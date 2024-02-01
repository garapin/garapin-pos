// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_customer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListCustomerState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Mitra> get allMitra => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListCustomerStateCopyWith<ListCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCustomerStateCopyWith<$Res> {
  factory $ListCustomerStateCopyWith(
          ListCustomerState value, $Res Function(ListCustomerState) then) =
      _$ListCustomerStateCopyWithImpl<$Res, ListCustomerState>;
  @useResult
  $Res call({DataStateStatus status, String? err, List<Mitra> allMitra});
}

/// @nodoc
class _$ListCustomerStateCopyWithImpl<$Res, $Val extends ListCustomerState>
    implements $ListCustomerStateCopyWith<$Res> {
  _$ListCustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? allMitra = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      allMitra: null == allMitra
          ? _value.allMitra
          : allMitra // ignore: cast_nullable_to_non_nullable
              as List<Mitra>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListCustomerStateImplCopyWith<$Res>
    implements $ListCustomerStateCopyWith<$Res> {
  factory _$$ListCustomerStateImplCopyWith(_$ListCustomerStateImpl value,
          $Res Function(_$ListCustomerStateImpl) then) =
      __$$ListCustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, String? err, List<Mitra> allMitra});
}

/// @nodoc
class __$$ListCustomerStateImplCopyWithImpl<$Res>
    extends _$ListCustomerStateCopyWithImpl<$Res, _$ListCustomerStateImpl>
    implements _$$ListCustomerStateImplCopyWith<$Res> {
  __$$ListCustomerStateImplCopyWithImpl(_$ListCustomerStateImpl _value,
      $Res Function(_$ListCustomerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? allMitra = null,
  }) {
    return _then(_$ListCustomerStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      allMitra: null == allMitra
          ? _value._allMitra
          : allMitra // ignore: cast_nullable_to_non_nullable
              as List<Mitra>,
    ));
  }
}

/// @nodoc

class _$ListCustomerStateImpl implements _ListCustomerState {
  const _$ListCustomerStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Mitra> allMitra = const []})
      : _allMitra = allMitra;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<Mitra> _allMitra;
  @override
  @JsonKey()
  List<Mitra> get allMitra {
    if (_allMitra is EqualUnmodifiableListView) return _allMitra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allMitra);
  }

  @override
  String toString() {
    return 'ListCustomerState(status: $status, err: $err, allMitra: $allMitra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListCustomerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other._allMitra, _allMitra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, err, const DeepCollectionEquality().hash(_allMitra));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListCustomerStateImplCopyWith<_$ListCustomerStateImpl> get copyWith =>
      __$$ListCustomerStateImplCopyWithImpl<_$ListCustomerStateImpl>(
          this, _$identity);
}

abstract class _ListCustomerState implements ListCustomerState {
  const factory _ListCustomerState(
      {final DataStateStatus status,
      final String? err,
      final List<Mitra> allMitra}) = _$ListCustomerStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Mitra> get allMitra;
  @override
  @JsonKey(ignore: true)
  _$$ListCustomerStateImplCopyWith<_$ListCustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
