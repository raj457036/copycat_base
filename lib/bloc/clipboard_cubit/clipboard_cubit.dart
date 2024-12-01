import 'dart:async';

import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/model/search_filter_state.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/services/cross_sync_listener.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clipboard_cubit.freezed.dart';
part 'clipboard_state.dart';

@injectable
class ClipboardCubit extends Cubit<ClipboardState> {
  final ClipboardRepository repo;
  EventRule<ClipCrossSyncEvent>? clipboardItemER;
  EventRule<List<ClipCrossSyncEvent>>? batchClipboardItemER;
  String? currentQuery;

  ClipboardCubit(
    @Named("local") this.repo,
  ) : super(const ClipboardState.loaded(items: [])) {
    clipboardItemER = EventRule(clipboardEvent, targets: [
      EventListener(onSyncEvent),
    ]);
    batchClipboardItemER = EventRule(clipboardBatchEvent, targets: [
      EventListener(onBatchSyncEvent),
    ]);
  }

  void onBatchSyncEvent(List<ClipCrossSyncEvent> events) {
    if (events.isEmpty) return;
    // Deleted
    final deleted = events
        .where((event) {
          final (type, _) = event;
          return type == CrossSyncEventType.delete;
        })
        .map((event) => event.$2)
        .toList();
    deleteItem(deleted);

    if (currentQuery != null && currentQuery!.isNotEmpty) return;
    final filter = state.filterState;

    // Created
    final created = events
        .where((event) {
          final (type, item) = event;
          return type == CrossSyncEventType.create &&
              filter.matchedByFilter(item);
        })
        .map((event) => event.$2)
        .toList();
    if (created.isNotEmpty) {
      emit(state.copyWith(items: [...created, ...state.items]));
    }

    // Updates
    final updated = events
        .where((event) {
          final (type, item) = event;
          return type == CrossSyncEventType.update &&
              filter.matchedByFilter(item);
        })
        .map((event) => event.$2)
        .toList();
    if (updated.isEmpty) return;
    final updateIndexMap = <int, int>{};
    for (var i = 0; i < updated.length; i++) {
      final item = updated[i];
      updateIndexMap[item.id] = i;
    }

    final replaced = <ClipboardItem>[];
    for (var i = 0; i < state.items.length; i++) {
      final item = state.items[i];
      final found = updateIndexMap[item.id];
      if (found != null) {
        replaced.add(updated[found]);
      } else {
        replaced.add(item);
      }
    }
    emit(state.copyWith(items: replaced));
  }

  void onSyncEvent(ClipCrossSyncEvent event) {
    final (type, item) = event;
    // deleted
    if (item.deletedAt != null || type == CrossSyncEventType.delete) {
      deleteItem([item]);
      return;
    }

    if (currentQuery != null && currentQuery!.isNotEmpty) return;
    final filter = state.filterState;
    if (filter.matchedByFilter(item)) {
      put(item, isNew: type == CrossSyncEventType.create);
    }
  }

  void reset() => emit(const ClipboardState.loaded(items: []));

  void put(ClipboardItem item, {bool isNew = false}) {
    if (isNew) {
      emit(state.copyWith(items: [item, ...state.items]));
    } else {
      final items = state.items.replaceWhere((it) => it.id == item.id, item);
      emit(
        state.copyWith(items: items),
      );
    }
  }

  bool fetchIfInitBatch() {
    if (state.items.length <= 50) {
      fetch(fromTop: true);
      return true;
    }
    return false;
  }

  Future<void> fetch({
    bool fromTop = false,
    String? query,
    SearchFilterState? filterState,
  }) async {
    currentQuery = query;
    emit(
      state.copyWith(
        loading: true,
        offset: fromTop ? 0 : state.offset,
        filterState: fromTop
            ? filterState ?? const SearchFilterState()
            : state.filterState,
      ),
    );

    final items = await repo.getList(
      limit: state.limit,
      offset: fromTop ? 0 : state.offset,
      search: query,
      types: state.filterState.typeIncludes,
      category: state.filterState.textCategories,
      from: state.filterState.from,
      to: state.filterState.to,
      order: state.filterState.sortOrder ?? SortOrder.desc,
      sortBy: state.filterState.sortBy,
    );

    emit(
      items.fold(
        (l) => state.copyWith(
          failure: l,
          loading: false,
        ),
        (r) => state.copyWith(
          loading: false,
          items: fromTop ? r.results : [...state.items, ...r.results],
          offset: state.offset + r.results.length,
          limit: state.limit,
          hasMore: r.hasMore,
        ),
      ),
    );
  }

  Future<void> deleteItem(List<ClipboardItem> items) async {
    state.mapOrNull(loaded: (result) {
      final ids = items.map((item) => item.id).toSet();
      final items_ = result.items.where((it) => !ids.contains(it.id)).toList();
      final isDeleted = items_.length < result.items.length;
      emit(
        result.copyWith(
          items: items_,
          offset: isDeleted ? result.offset - 1 : result.offset,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    clipboardItemER?.cancel();
    batchClipboardItemER?.cancel();
    return super.close();
  }
}
