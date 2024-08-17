part of 'search_cubit.dart';

@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState.initial() = InitialSearchState;
  const factory SearchState.searching({
    required String search,
    Set<TextCategory>? textCategories,
    Set<ClipItemType>? types,
    ClipboardSortKey? sortBy,
    SortOrder? order,
    DateTime? from,
    DateTime? to,
  }) = SearchingState;
  const factory SearchState.results({
    required String search,
    Set<TextCategory>? textCategories,
    Set<ClipItemType>? types,
    ClipboardSortKey? sortBy,
    SortOrder? order,
    DateTime? from,
    DateTime? to,
    required List<ClipboardItem> results,
    @Default(false) bool hasMore,
    @Default(false) bool isLoading,
    @Default(0) int offset,
  }) = SearchResultState;
  const factory SearchState.error({required Failure failure}) =
      SearchErrorState;
}
