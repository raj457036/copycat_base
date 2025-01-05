import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:bloc/bloc.dart';
import 'package:copycat_base/bloc/event_bus_cubit/event_bus_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/db/exclusion_rules/exclusion_rules.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/platform_os.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'android_bg_clipboard_cubit.freezed.dart';
part 'android_bg_clipboard_state.dart';

@injectable
class AndroidBgClipboardCubit extends Cubit<AndroidBgClipboardState> {
  final EventBusCubit eventBus;
  final AndroidBackgroundClipboard plugin;
  final ClipboardRepository clipRepo;
  final String deviceId;
  bool isSyncing = false;

  AndroidBgClipboardCubit(
    this.plugin,
    this.eventBus,
    @Named("local") this.clipRepo,
    @Named("device_id") this.deviceId,
  ) : super(const AndroidBgClipboardState.unknown());

  Future<void> updateExclusionRule(ExclusionRules? rules) async {
    if (rules != null && rules.enable) {
      plugin.writeShared('exclude-email', rules.email);
      plugin.writeShared('exclude-phone', rules.phone);
      plugin.writeShared('exclude-pass-mgr', rules.passwordManager);
      plugin.writeShared(
        '<set>excludedPackages',
        rules.apps.map((e) => e.identifier).join(","),
      );
    } else {
      plugin.deleteShared([
        'exclude-email',
        'exclude-phone',
        'exclude-pass-mgr',
        'excludedPackages',
      ]);
    }
  }

  Future<void> writeToLocal(ClipboardItem item) async {
    final result = await clipRepo.updateOrCreate(item);
    result.fold((failure) {}, (item) async {
      item = await item.decrypt();
      eventBus.clipSync((CrossSyncEventType.create, item));
    });
  }

  ClipboardItem parseClip(String clip, String meta) {
    // type::description::serverId::userid::encrypted
    final parts = meta.split("::");
    final ClipItemType clipType = switch (parts[0]) {
      "Text" => ClipItemType.text,
      "Url" => ClipItemType.url,
      "Email" => ClipItemType.text,
      "Phone" => ClipItemType.text,
      "FileUrl" => ClipItemType.file, // TODO: not supported yet.
      _ => ClipItemType.text,
    };
    final TextCategory? textCategory = switch (parts[0]) {
      "Email" => TextCategory.email,
      "Phone" => TextCategory.phone,
      _ => null,
    };
    final desc = parts[1];
    final serverId = int.tryParse(parts[2]);
    return ClipboardItem(
      created: now(),
      modified: now(),
      type: clipType,
      os: PlatformOS.android,
      textCategory: textCategory,
      text: clipType == ClipItemType.text ? clip : null,
      url: clipType == ClipItemType.url ? clip : null,
      title: desc,
      description: desc,
      serverId: serverId,
      lastSynced: serverId != null ? now() : null,
      deviceId: deviceId,
    );
  }

  Future<void> syncStates() async {
    if (isSyncing) return;
    try {
      final endMark = await plugin.readShared<int>("endId") ?? -1;
      if (endMark == -1) return;
      final deleteKeys = <String>[];
      for (var i = 0; i < endMark + 1; i++) {
        final clipKey = "Clip-$i";
        final clipMetaKey = "Clip-$i-meta";
        final clip = await plugin.readShared<String>(clipKey);
        final clipMeta = await plugin.readShared<String>(clipMetaKey);

        if (clip != null &&
            clipMeta != null &&
            clip.isNotEmpty &&
            clipMeta.isNotEmpty) {
          final clipItem = parseClip(clip, clipMeta);
          writeToLocal(clipItem);
        }
        deleteKeys
          ..add(clipKey)
          ..add(clipMetaKey);

        logger.w("Clip: $clip | Meta: $clipMeta");
      }
      await plugin.writeShared("endId", -1);
      await plugin.deleteShared(deleteKeys);
    } finally {
      isSyncing = false;
    }
  }

  Future<void> reset() async {
    await plugin.clearStorage();
  }
}
