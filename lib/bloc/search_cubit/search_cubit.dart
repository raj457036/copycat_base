import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/analytics.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final AnalyticsRepository analyticsRepo;
  final ClipboardRepository repo;

  SearchCubit(
    @Named("offline") this.repo,
    this.analyticsRepo,
  ) : super(const SearchState.initial());

  Future<void> search(
    String? query, {
    Set<TextCategory>? textCategories,
    Set<ClipItemType>? clipTypes,
    ClipboardSortKey? sortBy,
    SortOrder? order,
    DateTime? from,
    DateTime? to,
    bool force = false,
    bool keepStateFilters = true,
  }) async {
    analyticsRepo.logFeatureUsed(feature: "search");
    switch (state) {
      case InitialSearchState() || SearchErrorState():
        {
          if (query == null) return;
          emit(
            SearchState.searching(
              search: query,
              textCategories: textCategories,
              types: clipTypes,
              sortBy: sortBy,
              order: order,
              from: from,
              to: to,
            ),
          );

          final items = await repo.getList(
            limit: 50,
            search: query,
            types: clipTypes,
            category: textCategories,
            from: from,
            to: to,
            order: order ?? SortOrder.desc,
            sortBy: sortBy,
          );

          emit(
            items.fold(
              (l) => SearchState.error(
                failure: l,
              ),
              (r) => SearchState.results(
                search: query,
                isLoading: false,
                results: r.results,
                offset: r.results.length,
                hasMore: r.hasMore,
                types: clipTypes,
                textCategories: textCategories,
                from: from,
                to: to,
                order: order,
                sortBy: sortBy,
              ),
            ),
          );
        }
        break;
      case SearchResultState():
        {
          final state_ = state as SearchResultState;
          final newQuery = (query != null && state_.search != query) || force;
          if (!state_.hasMore && !newQuery) return;
          final search_ =
              (newQuery ? query : (keepStateFilters ? state_.search : "")) ??
                  "";
          final types_ = clipTypes ?? (keepStateFilters ? state_.types : null);
          final category_ = textCategories ??
              (keepStateFilters ? state_.textCategories : null);
          final from_ = from ?? (keepStateFilters ? state_.from : null);
          final to_ = to ?? (keepStateFilters ? state_.to : null);
          final order_ = order ?? state_.order ?? SortOrder.desc;
          final sortBy_ = sortBy ?? (keepStateFilters ? state_.sortBy : null);
          emit(
            SearchState.searching(
              search: search_,
              types: types_,
              textCategories: category_,
              from: from_,
              to: to_,
              order: order_,
              sortBy: sortBy_,
            ),
          );
          final items = await repo.getList(
            limit: 50,
            offset: newQuery ? 0 : state_.offset,
            search: search_,
            types: types_,
            category: category_,
            from: from_,
            to: to_,
            order: order_,
            sortBy: sortBy_,
          );

          final nextState = items.fold(
            (l) => SearchState.error(
              failure: l,
            ),
            (r) => SearchState.results(
              results: newQuery ? r.results : [...state_.results, ...r.results],
              offset: r.results.length + (newQuery ? 0 : state_.offset),
              hasMore: r.hasMore,
              search: search_,
              types: types_,
              textCategories: category_,
              from: from_,
              to: to_,
              order: order_,
              sortBy: sortBy_,
            ),
          );
          emit(nextState);
        }
      case _:
    }
  }

  void put(ClipboardItem item) {
    state.mapOrNull(results: (result) {
      final items = result.results.replaceWhere(
        (it) => it.id == item.id,
        item,
      );
      emit(
        result.copyWith(results: items),
      );
    });
  }

  Future<void> deleteItem(ClipboardItem item) async {
    state.mapOrNull(results: (result) {
      final items = result.results
          .where(
            (it) => it.id != item.id,
          )
          .toList();
      final isDeleted = items.length < result.results.length;
      emit(
        result.copyWith(
          results: items,
          offset: isDeleted ? result.offset - 1 : result.offset,
        ),
      );
    });
  }
}
