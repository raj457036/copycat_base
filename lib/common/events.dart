import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';

final searchFocusEvent = Event<void>("SEARCH_FOCUS");

// clipboard events
final clipboardEvent = Event<ClipCrossSyncEvent>("CLIPBOARD_SYNCED_ITEM");
final clipboardBatchEvent =
    Event<List<ClipCrossSyncEvent>>("CLIPBOARD_SYNCED_BATCH_ITEMS");

// collection events
final collectionEvent =
    Event<CollectionCrossSyncEvent>("COLLECTION_SYNCED_ITEM");
final collectionBatchEvent =
    Event<List<CollectionCrossSyncEvent>>("COLLECTION_SYNCED_BATCH_ITEMS");
