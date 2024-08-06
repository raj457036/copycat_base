// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focused_clipitem_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FocusedClipitemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unfocused,
    required TResult Function(ClipboardItem item) focused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unfocused,
    TResult? Function(ClipboardItem item)? focused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unfocused,
    TResult Function(ClipboardItem item)? focused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnfocusedClipItem value) unfocused,
    required TResult Function(FocusedClipItem value) focused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnfocusedClipItem value)? unfocused,
    TResult? Function(FocusedClipItem value)? focused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnfocusedClipItem value)? unfocused,
    TResult Function(FocusedClipItem value)? focused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusedClipitemStateCopyWith<$Res> {
  factory $FocusedClipitemStateCopyWith(FocusedClipitemState value,
          $Res Function(FocusedClipitemState) then) =
      _$FocusedClipitemStateCopyWithImpl<$Res, FocusedClipitemState>;
}

/// @nodoc
class _$FocusedClipitemStateCopyWithImpl<$Res,
        $Val extends FocusedClipitemState>
    implements $FocusedClipitemStateCopyWith<$Res> {
  _$FocusedClipitemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnfocusedClipItemImplCopyWith<$Res> {
  factory _$$UnfocusedClipItemImplCopyWith(_$UnfocusedClipItemImpl value,
          $Res Function(_$UnfocusedClipItemImpl) then) =
      __$$UnfocusedClipItemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnfocusedClipItemImplCopyWithImpl<$Res>
    extends _$FocusedClipitemStateCopyWithImpl<$Res, _$UnfocusedClipItemImpl>
    implements _$$UnfocusedClipItemImplCopyWith<$Res> {
  __$$UnfocusedClipItemImplCopyWithImpl(_$UnfocusedClipItemImpl _value,
      $Res Function(_$UnfocusedClipItemImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnfocusedClipItemImpl implements UnfocusedClipItem {
  const _$UnfocusedClipItemImpl();

  @override
  String toString() {
    return 'FocusedClipitemState.unfocused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnfocusedClipItemImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unfocused,
    required TResult Function(ClipboardItem item) focused,
  }) {
    return unfocused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unfocused,
    TResult? Function(ClipboardItem item)? focused,
  }) {
    return unfocused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unfocused,
    TResult Function(ClipboardItem item)? focused,
    required TResult orElse(),
  }) {
    if (unfocused != null) {
      return unfocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnfocusedClipItem value) unfocused,
    required TResult Function(FocusedClipItem value) focused,
  }) {
    return unfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnfocusedClipItem value)? unfocused,
    TResult? Function(FocusedClipItem value)? focused,
  }) {
    return unfocused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnfocusedClipItem value)? unfocused,
    TResult Function(FocusedClipItem value)? focused,
    required TResult orElse(),
  }) {
    if (unfocused != null) {
      return unfocused(this);
    }
    return orElse();
  }
}

abstract class UnfocusedClipItem implements FocusedClipitemState {
  const factory UnfocusedClipItem() = _$UnfocusedClipItemImpl;
}

/// @nodoc
abstract class _$$FocusedClipItemImplCopyWith<$Res> {
  factory _$$FocusedClipItemImplCopyWith(_$FocusedClipItemImpl value,
          $Res Function(_$FocusedClipItemImpl) then) =
      __$$FocusedClipItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ClipboardItem item});

  $ClipboardItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$FocusedClipItemImplCopyWithImpl<$Res>
    extends _$FocusedClipitemStateCopyWithImpl<$Res, _$FocusedClipItemImpl>
    implements _$$FocusedClipItemImplCopyWith<$Res> {
  __$$FocusedClipItemImplCopyWithImpl(
      _$FocusedClipItemImpl _value, $Res Function(_$FocusedClipItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$FocusedClipItemImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ClipboardItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ClipboardItemCopyWith<$Res> get item {
    return $ClipboardItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$FocusedClipItemImpl implements FocusedClipItem {
  const _$FocusedClipItemImpl(this.item);

  @override
  final ClipboardItem item;

  @override
  String toString() {
    return 'FocusedClipitemState.focused(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusedClipItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusedClipItemImplCopyWith<_$FocusedClipItemImpl> get copyWith =>
      __$$FocusedClipItemImplCopyWithImpl<_$FocusedClipItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unfocused,
    required TResult Function(ClipboardItem item) focused,
  }) {
    return focused(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unfocused,
    TResult? Function(ClipboardItem item)? focused,
  }) {
    return focused?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unfocused,
    TResult Function(ClipboardItem item)? focused,
    required TResult orElse(),
  }) {
    if (focused != null) {
      return focused(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnfocusedClipItem value) unfocused,
    required TResult Function(FocusedClipItem value) focused,
  }) {
    return focused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnfocusedClipItem value)? unfocused,
    TResult? Function(FocusedClipItem value)? focused,
  }) {
    return focused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnfocusedClipItem value)? unfocused,
    TResult Function(FocusedClipItem value)? focused,
    required TResult orElse(),
  }) {
    if (focused != null) {
      return focused(this);
    }
    return orElse();
  }
}

abstract class FocusedClipItem implements FocusedClipitemState {
  const factory FocusedClipItem(final ClipboardItem item) =
      _$FocusedClipItemImpl;

  ClipboardItem get item;
  @JsonKey(ignore: true)
  _$$FocusedClipItemImplCopyWith<_$FocusedClipItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
