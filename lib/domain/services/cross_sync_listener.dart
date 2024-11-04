import 'dart:async';

import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';

typedef CrossSyncEvent = (String, Map<String, dynamic>);

abstract class CrossSyncListener<T> {
  Future<void> start();
  Future<void> stop();
  Future<void> send(T item);
  Stream<T> get events;

  bool get isInitiated;
}

abstract class ClipCrossSyncListener extends CrossSyncListener<ClipboardItem> {}

abstract class CollectionCrossSyncListener
    extends CrossSyncListener<ClipCollection> {}
