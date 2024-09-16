// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exclusion_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppInfo {
  String get name => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppInfoCopyWith<AppInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) then) =
      _$AppInfoCopyWithImpl<$Res, AppInfo>;
  @useResult
  $Res call({String name, String? path, String? identifier});
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res, $Val extends AppInfo>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppInfoImplCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$$AppInfoImplCopyWith(
          _$AppInfoImpl value, $Res Function(_$AppInfoImpl) then) =
      __$$AppInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? path, String? identifier});
}

/// @nodoc
class __$$AppInfoImplCopyWithImpl<$Res>
    extends _$AppInfoCopyWithImpl<$Res, _$AppInfoImpl>
    implements _$$AppInfoImplCopyWith<$Res> {
  __$$AppInfoImplCopyWithImpl(
      _$AppInfoImpl _value, $Res Function(_$AppInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$AppInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppInfoImpl extends _AppInfo {
  _$AppInfoImpl({this.name = '', this.path, this.identifier}) : super._();

  @override
  @JsonKey()
  final String name;
  @override
  final String? path;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'AppInfo(name: $name, path: $path, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, path, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInfoImplCopyWith<_$AppInfoImpl> get copyWith =>
      __$$AppInfoImplCopyWithImpl<_$AppInfoImpl>(this, _$identity);
}

abstract class _AppInfo extends AppInfo {
  factory _AppInfo(
      {final String name,
      final String? path,
      final String? identifier}) = _$AppInfoImpl;
  _AppInfo._() : super._();

  @override
  String get name;
  @override
  String? get path;
  @override
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$AppInfoImplCopyWith<_$AppInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExclusionRules {
  /// including password patterns and password managers
  bool get sensitiveInfo => throw _privateConstructorUsedError;
  List<String> get patterns => throw _privateConstructorUsedError;
  List<String> get titles => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  List<AppInfo> get apps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExclusionRulesCopyWith<ExclusionRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExclusionRulesCopyWith<$Res> {
  factory $ExclusionRulesCopyWith(
          ExclusionRules value, $Res Function(ExclusionRules) then) =
      _$ExclusionRulesCopyWithImpl<$Res, ExclusionRules>;
  @useResult
  $Res call(
      {bool sensitiveInfo,
      List<String> patterns,
      List<String> titles,
      List<String> urls,
      List<AppInfo> apps});
}

/// @nodoc
class _$ExclusionRulesCopyWithImpl<$Res, $Val extends ExclusionRules>
    implements $ExclusionRulesCopyWith<$Res> {
  _$ExclusionRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensitiveInfo = null,
    Object? patterns = null,
    Object? titles = null,
    Object? urls = null,
    Object? apps = null,
  }) {
    return _then(_value.copyWith(
      sensitiveInfo: null == sensitiveInfo
          ? _value.sensitiveInfo
          : sensitiveInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      patterns: null == patterns
          ? _value.patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      titles: null == titles
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apps: null == apps
          ? _value.apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<AppInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExclusionRulesImplCopyWith<$Res>
    implements $ExclusionRulesCopyWith<$Res> {
  factory _$$ExclusionRulesImplCopyWith(_$ExclusionRulesImpl value,
          $Res Function(_$ExclusionRulesImpl) then) =
      __$$ExclusionRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool sensitiveInfo,
      List<String> patterns,
      List<String> titles,
      List<String> urls,
      List<AppInfo> apps});
}

/// @nodoc
class __$$ExclusionRulesImplCopyWithImpl<$Res>
    extends _$ExclusionRulesCopyWithImpl<$Res, _$ExclusionRulesImpl>
    implements _$$ExclusionRulesImplCopyWith<$Res> {
  __$$ExclusionRulesImplCopyWithImpl(
      _$ExclusionRulesImpl _value, $Res Function(_$ExclusionRulesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensitiveInfo = null,
    Object? patterns = null,
    Object? titles = null,
    Object? urls = null,
    Object? apps = null,
  }) {
    return _then(_$ExclusionRulesImpl(
      sensitiveInfo: null == sensitiveInfo
          ? _value.sensitiveInfo
          : sensitiveInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      patterns: null == patterns
          ? _value._patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      titles: null == titles
          ? _value._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apps: null == apps
          ? _value._apps
          : apps // ignore: cast_nullable_to_non_nullable
              as List<AppInfo>,
    ));
  }
}

/// @nodoc

class _$ExclusionRulesImpl extends _ExclusionRules {
  _$ExclusionRulesImpl(
      {this.sensitiveInfo = false,
      final List<String> patterns = const [],
      final List<String> titles = const [],
      final List<String> urls = const [],
      final List<AppInfo> apps = const []})
      : _patterns = patterns,
        _titles = titles,
        _urls = urls,
        _apps = apps,
        super._();

  /// including password patterns and password managers
  @override
  @JsonKey()
  final bool sensitiveInfo;
  final List<String> _patterns;
  @override
  @JsonKey()
  List<String> get patterns {
    if (_patterns is EqualUnmodifiableListView) return _patterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patterns);
  }

  final List<String> _titles;
  @override
  @JsonKey()
  List<String> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  final List<AppInfo> _apps;
  @override
  @JsonKey()
  List<AppInfo> get apps {
    if (_apps is EqualUnmodifiableListView) return _apps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apps);
  }

  @override
  String toString() {
    return 'ExclusionRules(sensitiveInfo: $sensitiveInfo, patterns: $patterns, titles: $titles, urls: $urls, apps: $apps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExclusionRulesImpl &&
            (identical(other.sensitiveInfo, sensitiveInfo) ||
                other.sensitiveInfo == sensitiveInfo) &&
            const DeepCollectionEquality().equals(other._patterns, _patterns) &&
            const DeepCollectionEquality().equals(other._titles, _titles) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            const DeepCollectionEquality().equals(other._apps, _apps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sensitiveInfo,
      const DeepCollectionEquality().hash(_patterns),
      const DeepCollectionEquality().hash(_titles),
      const DeepCollectionEquality().hash(_urls),
      const DeepCollectionEquality().hash(_apps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExclusionRulesImplCopyWith<_$ExclusionRulesImpl> get copyWith =>
      __$$ExclusionRulesImplCopyWithImpl<_$ExclusionRulesImpl>(
          this, _$identity);
}

abstract class _ExclusionRules extends ExclusionRules {
  factory _ExclusionRules(
      {final bool sensitiveInfo,
      final List<String> patterns,
      final List<String> titles,
      final List<String> urls,
      final List<AppInfo> apps}) = _$ExclusionRulesImpl;
  _ExclusionRules._() : super._();

  @override

  /// including password patterns and password managers
  bool get sensitiveInfo;
  @override
  List<String> get patterns;
  @override
  List<String> get titles;
  @override
  List<String> get urls;
  @override
  List<AppInfo> get apps;
  @override
  @JsonKey(ignore: true)
  _$$ExclusionRulesImplCopyWith<_$ExclusionRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
