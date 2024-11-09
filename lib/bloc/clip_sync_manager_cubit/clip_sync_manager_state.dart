part of 'clip_sync_manager_cubit.dart';

@freezed
class ClipSyncManagerState with _$ClipSyncManagerState {
  const factory ClipSyncManagerState.disabled() = ClipSyncDisabled;
  const factory ClipSyncManagerState.unknown() = ClipSyncUnknown;
  const factory ClipSyncManagerState.syncingUnknonw() = ClipSyncSyncingUnknown;
  const factory ClipSyncManagerState.syncing({
    required int total,
    required int synced,
  }) = ClipSyncSyncing;
  const factory ClipSyncManagerState.synced() = ClipSyncComplete;
  const factory ClipSyncManagerState.failed(Failure failure) = ClipSyncFailed;
}
