import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';

final searchFocusEvent = Event<void>("SEARCH_FOCUS");

// clipboard events
final clipboardSyncItemEvent =
    Event<ClipCrossSyncEvent>("CLIPBOARD_SYNCED_ITEM");
