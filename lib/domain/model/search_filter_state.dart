import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:flutter/foundation.dart';

class SearchFilterState {
  final DateTime? from;
  final DateTime? to;
  final Set<ClipItemType>? typeIncludes;
  final Set<TextCategory>? textCategories;
  final ClipboardSortKey? sortBy;
  final SortOrder? sortOrder;

  const SearchFilterState({
    this.from,
    this.to,
    this.typeIncludes,
    this.textCategories,
    this.sortBy,
    this.sortOrder,
  });

  bool get isActive =>
      from != null ||
      to != null ||
      typeIncludes != null ||
      textCategories != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchFilterState &&
        other.from == from &&
        other.to == to &&
        setEquals(other.typeIncludes, typeIncludes) &&
        setEquals(other.textCategories, textCategories) &&
        other.sortBy == sortBy &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode {
    return from.hashCode ^
        to.hashCode ^
        typeIncludes.hashCode ^
        textCategories.hashCode ^
        sortBy.hashCode ^
        sortOrder.hashCode;
  }
}
