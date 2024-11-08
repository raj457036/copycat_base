import 'dart:async';

import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';

enum CrossSyncEventType { create, update, delete }

typedef CrossSyncEvent<T> = (CrossSyncEventType, T);

enum CrossSyncListenerStatus {
  unknown,
  connecting,
  connected,
  error,
  disconnected,
}

typedef CrossSyncStatusEvent = (CrossSyncListenerStatus, Object? object);

abstract class CrossSyncListener<T> {
  Future<void> start();
  Future<void> stop();
  Future<void> send(T item);
  Stream<CrossSyncEvent<T>> get onChange;
  Stream<CrossSyncStatusEvent> get onStatusChange;

  bool get isInitiated;
}

typedef ClipCrossSyncEvent = CrossSyncEvent<ClipboardItem>;

abstract class ClipCrossSyncListener extends CrossSyncListener<ClipboardItem> {}

abstract class CollectionCrossSyncListener
    extends CrossSyncListener<ClipCollection> {}
