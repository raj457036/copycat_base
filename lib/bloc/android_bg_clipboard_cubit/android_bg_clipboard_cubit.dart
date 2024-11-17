import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
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
  final AndroidBackgroundClipboard plugin;
  final ClipboardRepository clipRepo;

  AndroidBgClipboardCubit(
    this.plugin,
    @Named("offline") this.clipRepo,
  ) : super(AndroidBgClipboardState.unknown());

  Future<void> writeToLocal(ClipboardItem item) async {
    final result = await clipRepo.updateOrCreate(item);
    result.fold((failure) {}, (item) async {
      item = await item.decrypt();
      final eventPayload =
          clipboardEvent.createPayload((CrossSyncEventType.create, item));
      EventBus.emit(eventPayload);
    });
  }

  ClipboardItem parseClip(String clip, String meta) {
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
    return ClipboardItem(
      created: now(),
      modified: now(),
      type: clipType,
      os: PlatformOS.android,
      textCategory: textCategory,
      text: clipType == ClipItemType.text ? clip : null,
      url: clipType == ClipItemType.url ? clip : null,
    );
  }

  Future<void> syncStates() async {
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
  }

  Future<void> reset() async {
    await plugin.clearStorage();
  }
}
