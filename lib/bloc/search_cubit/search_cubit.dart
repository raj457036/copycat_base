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
    List<String>? textCategories,
    List<ClipItemType>? clipTypes,
    ClipboardSortKey? sortBy,
    SortOrder? order,
    DateTime? from,
    DateTime? to,
  }) async {
    analyticsRepo.logFeatureUsed(feature: "search");
    switch (state) {
      case InitialSearchState() || SearchErrorState():
        {
          if (query == null) return;
          emit(
            SearchState.searching(
              query: query,
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
                query: query,
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
          final newQuery = query != null && state_.query != query;
          if (!state_.hasMore && !newQuery) return;
          emit(
            SearchState.searching(
              query: query ?? state_.query,
              types: clipTypes ?? state_.types,
              textCategories: textCategories ?? state_.textCategories,
              from: from ?? state_.from,
              to: to ?? state_.to,
              order: order ?? state_.order,
              sortBy: sortBy ?? state_.sortBy,
            ),
          );
          final items = await repo.getList(
            limit: 50,
            offset: newQuery ? 0 : state_.offset,
            search: query ?? state_.query,
            types: clipTypes ?? state_.types,
            category: textCategories ?? state_.textCategories,
            from: from ?? state_.from,
            to: to ?? state_.to,
            order: order ?? state_.order ?? SortOrder.desc,
            sortBy: sortBy ?? state_.sortBy,
          );

          final nextState = items.fold(
            (l) => SearchState.error(
              failure: l,
            ),
            (r) => SearchState.results(
              query: query ?? state_.query,
              results: newQuery ? r.results : [...state_.results, ...r.results],
              offset: r.results.length + (newQuery ? 0 : state_.offset),
              hasMore: r.hasMore,
              types: clipTypes ?? state_.types,
              textCategories: textCategories ?? state_.textCategories,
              from: from ?? state_.from,
              to: to ?? state_.to,
              order: order ?? state_.order ?? SortOrder.desc,
              sortBy: sortBy ?? state_.sortBy,
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
