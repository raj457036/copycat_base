import 'dart:async';

import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/domain/repositories/clip_collection.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'realtime_clip_sync_cubit.freezed.dart';
part 'realtime_clip_sync_state.dart';

@injectable
class RealtimeClipSyncCubit extends Cubit<RealtimeClipSyncState> {
  final ClipCrossSyncListener listener;
  final ClipboardRepository clipRepo;
  final ClipCollectionRepository collectionRepo;
  bool _subscribed = false;

  StreamSubscription? statusSubscription, changeSubscription;

  RealtimeClipSyncCubit(
    this.listener,
    @Named("local") this.clipRepo,
    this.collectionRepo,
  ) : super(const RealtimeClipSyncState.initial()) {
    statusSubscription = listener.onStatusChange.listen(onStatusChange);
    changeSubscription = listener.onChange.listen(onSync);
  }

  void _clearSubs() {
    changeSubscription?.cancel();
    statusSubscription?.cancel();
  }

  void subscribe() {
    if (_subscribed) {
      listener.reconnect();
      return;
    }
    listener.start();
    _subscribed = true;
  }

  void unsubscribe() {
    if (!_subscribed) return;
    listener.stop();
    _subscribed = false;
  }

  void onStatusChange(CrossSyncStatusEvent event) {
    final (status, obj) = event;
    logger.w("Status Change");
    logger.w(status);
    logger.w(obj);
    switch (status) {
      case CrossSyncListenerStatus.connecting:
        emit(RealtimeClipSyncState.connecting());
      case CrossSyncListenerStatus.connected:
        emit(RealtimeClipSyncState.connected());
      default:
        emit(RealtimeClipSyncState.disconnected());
    }
  }

  Future<void> onSync(ClipCrossSyncEvent event) async {
    var (type, item) = event;
    logger.w("Sync Change");
    logger.w(type);
    logger.w(item);

    if (item.serverCollectionId != null) {
      final collection =
          await collectionRepo.get(serverId: item.serverCollectionId);

      collection.fold((failure) {}, (collection) {
        if (collection != null) {
          item = item.copyWith(collectionId: collection.id);
        }
      });
    }

    final result = await clipRepo.updateOrCreate(item);
    result.fold((failure) {}, (item) async {
      final eventPayload = clipboardEvent.createPayload((type, item));
      EventBus.emit(eventPayload);
    });
  }

  @override
  Future<void> close() {
    unsubscribe();
    _clearSubs();
    return super.close();
  }
}
