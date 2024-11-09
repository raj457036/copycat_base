import 'dart:async';
import 'dart:math';

import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:bloc/bloc.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/numbers/duration.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/repositories/sync_clipboard.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:easy_worker/easy_worker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'clip_sync_manager_cubit.freezed.dart';
part 'clip_sync_manager_state.dart';

void _syncingClips(
  (List<ClipboardItem>, Map<int, int>) record,
  Sender send,
) async {
  final Isar db;
  final instance = Isar.getInstance("CopyCat-Clipboard-DB");
  if (instance != null && instance.isOpen) {
    db = instance;
  } else {
    final dir = await getApplicationDocumentsDirectory();
    db = Isar.openSync(
      [ClipboardItemSchema],
      directory: dir.path,
      relaxedDurability: true,
      inspector: kDebugMode,
      name: "CopyCat-Clipboard-DB",
    );
  }

  final events = <ClipCrossSyncEvent>[];
  final (items, collectionMap) = record;
  await db.txn(() async {
    for (var index = 0; index < items.length; index++) {
      final item = items[index];
      final found = await db.clipboardItems
          .filter()
          .serverIdEqualTo(item.serverId)
          .findFirst();

      if (found == null) {
        events.add((CrossSyncEventType.create, item));
        continue;
      }

      items[index] = item.copyWith(
        lastSynced: found.lastSynced,
        localPath: found.localPath,
        collectionId: collectionMap[item.serverCollectionId],
      )..applyId(found);
      events.add((CrossSyncEventType.update, item));
    }
  });

  await db.writeTxn(() async {
    final ids = await db.clipboardItems.putAll(items);
    for (int i = 0; i < events.length; i++) {
      events[i].$2.id = ids[i];
    }
  });

  send(events);
}

final _clipSyncWorker =
    EasyCompute<List<ClipCrossSyncEvent>, (List<ClipboardItem>, Map<int, int>)>(
  ComputeEntrypoint(
    _syncingClips,
    initData: {
      "token": ServicesBinding.rootIsolateToken,
    },
    onInit: (payload) async {
      if (payload is Map) {
        final token = payload["token"];
        if (token != null) {
          BackgroundIsolateBinaryMessenger.ensureInitialized(token);
        }
      }
    },
  ),
  workerName: "ClipSyncWorker",
);

@injectable
class ClipSyncManagerCubit extends Cubit<ClipSyncManagerState> {
  final String deviceId;
  final ClipCollectionCubit collectionCubit;
  final ClipboardRepository clipboardRepository;
  final ClipCollectionRepository clipCollectionRepository;
  final SyncRepository syncRepo;

  Timer? _pollingTimer;
  int? _syncHours, _manualDelay;
  bool _busy = false;
  DateTime? lastSynced;

  ClipSyncManagerCubit(
    this.syncRepo,
    this.collectionCubit,
    @Named("offline") this.clipboardRepository,
    this.clipCollectionRepository,
    @Named("device_id") this.deviceId,
  ) : super(const ClipSyncManagerState.unknown());

  int get syncHours => _syncHours ?? 0;

  /// Range: 5s -> 15s
  int get manualDelay => min(max(_manualDelay ?? 15, $5S), 15);

  void changeConfig({int? syncHours, int? manualDelay, bool? disabled}) {
    if (syncHours != null) _syncHours = syncHours;
    if (manualDelay != null) _manualDelay = manualDelay;
    if (disabled != null) {
      if (disabled) {
        emit(const ClipSyncManagerState.disabled());
      } else {
        emit(const ClipSyncManagerState.unknown());
      }
    }
  }

  void startPolling() {
    if (_pollingTimer != null) return;
    _pollingTimer = Timer.periodic(
      const Duration(seconds: $45S),
      (_) => !_busy ? syncClips() : null,
    );
  }

  void stopPolling() {
    if (_pollingTimer == null) return;
    _pollingTimer?.cancel();
  }

  (bool, int) canManullySync() {
    if (lastSynced != null) {
      final elapsed = now().difference(lastSynced!).inSeconds;
      if (elapsed >= manualDelay) {
        lastSynced = now();
        return (true, 0);
      }
      return (false, manualDelay - elapsed);
    }
    lastSynced = now();
    return (true, 0);
  }

  Future<bool> syncClips({bool manual = false}) async {
    if (manual) {
      final (canSync, secondLeft) = canManullySync();
      if (!canSync) {
        showFailureSnackbar(frequentSyncing(secondLeft));
        return false;
      }
      closeSnackbar();
    }

    _busy = true;
    emit(const ClipSyncManagerState.unknown());
    try {
      if (_syncHours == null) return false;

      DateTime? fromTs;
      final latestSyncedItem =
          await clipboardRepository.getLatest(synced: true);
      latestSyncedItem.fold((l) {}, (item) {
        fromTs = item?.lastSynced;
      });

      await syncDeleted(fromTs);

      if (state is ClipSyncFailed) return false;
      await syncChanges(fromTs);

      if (state is ClipSyncFailed) return false;
      emit(const ClipSyncManagerState.synced());
      return state is ClipSyncComplete;
    } finally {
      _busy = false;
    }
  }

  Future<void> syncDeleted(DateTime? fromTs) async {
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;

    emit(const ClipSyncManagerState.syncingUnknonw());
    while (hasMore) {
      final result = await syncRepo.getDeletedClipboardItems(
        limit: 1000,
        lastSynced: _lastSyncedTime(fromTs),
        offset: offset,
        excludeDeviceId: deviceId,
      );

      await result.fold((l) async {
        emit(ClipSyncManagerState.failed(l));
      }, (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;

        final items = r.results;
        if (items.isEmpty) return;

        final deletedItems = await clipboardRepository.deleteMany(items);
        deletedItems.fold((l) {
          logger.e(l);
        }, (deletedItems) {
          final syncEvents = deletedItems
              .map((item) => (CrossSyncEventType.delete, item))
              .toList();
          broadcastBatchEvent(syncEvents);
        });
      });

      if (result.isLeft()) break;
    }
  }

  Future<void> syncChanges(
    DateTime? fromTs,
  ) async {
    // Fetch changes from server
    bool hasMore = true;
    int offset = 0;

    bool failed = false;
    int syncedCount = 0;

    final collectionMapping = collectionCubit.serverMapping;

    while (hasMore && !failed) {
      emit(ClipSyncManagerState.syncing(total: 0, synced: syncedCount));
      final result = await syncRepo.getLatestClipboardItems(
        limit: 1000,
        lastSynced: _lastSyncedTime(fromTs),
        offset: offset,
        excludeDeviceId: fromTs != null ? deviceId : null,
      );

      await result.fold((l) async {
        emit(ClipSyncManagerState.failed(l));
        failed = true;
      }, (r) async {
        hasMore = r.hasMore;
        offset += r.results.length;
        // Apply changes to local db
        final items = r.results;

        if (items.isEmpty) return;
        await _clipSyncWorker.waitUntilReady();
        final syncEvents = await _clipSyncWorker.compute(
          (items, collectionMapping),
        );
        syncedCount = syncEvents.length;
        broadcastBatchEvent(syncEvents);
      });
    }

    if (!failed) {
      emit(const ClipSyncManagerState.synced());
    }
  }

  void broadcastBatchEvent(List<ClipCrossSyncEvent> events) {
    final eventPayload = clipboardBatchEvent.createPayload(events);
    EventBus.emit(eventPayload);
  }

  DateTime _lastSyncedTime(DateTime? relativeTo) {
    if (relativeTo != null) {
      final diff = now().difference(relativeTo);
      if (diff.inHours < syncHours) {
        return relativeTo;
      }
    }

    final pastDate = now().subtract(Duration(hours: syncHours));
    return pastDate;
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
