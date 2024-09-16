import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'exclusion_rules.freezed.dart';
part 'exclusion_rules.g.dart';

@freezed
@Embedded(ignore: {"copyWith"})
class AppInfo with _$AppInfo {
  const AppInfo._();

  factory AppInfo({
    @Default('') String name,
    String? path,
    String? identifier,
  }) = _AppInfo;
}

@freezed
@Embedded(ignore: {"copyWith"})
class ExclusionRules with _$ExclusionRules {
  const ExclusionRules._();
  factory ExclusionRules({
    /// including password patterns and password managers
    @Default(false) bool sensitiveInfo,
    @Default([]) List<String> patterns,
    @Default([]) List<String> titles,
    @Default([]) List<String> urls,
    @Default([]) List<AppInfo> apps,
  }) = _ExclusionRules;
}
