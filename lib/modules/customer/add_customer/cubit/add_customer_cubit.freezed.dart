// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_customer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddCustomerState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCustomerStateCopyWith<AddCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCustomerStateCopyWith<$Res> {
  factory $AddCustomerStateCopyWith(
          AddCustomerState value, $Res Function(AddCustomerState) then) =
      _$AddCustomerStateCopyWithImpl<$Res, AddCustomerState>;
  @useResult
  $Res call({DataStateStatus status, String? err});
}

/// @nodoc
class _$AddCustomerStateCopyWithImpl<$Res, $Val extends AddCustomerState>
    implements $AddCustomerStateCopyWith<$Res> {
  _$AddCustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCustomerStateImplCopyWith<$Res>
    implements $AddCustomerStateCopyWith<$Res> {
  factory _$$AddCustomerStateImplCopyWith(_$AddCustomerStateImpl value,
          $Res Function(_$AddCustomerStateImpl) then) =
      __$$AddCustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, String? err});
}

/// @nodoc
class __$$AddCustomerStateImplCopyWithImpl<$Res>
    extends _$AddCustomerStateCopyWithImpl<$Res, _$AddCustomerStateImpl>
    implements _$$AddCustomerStateImplCopyWith<$Res> {
  __$$AddCustomerStateImplCopyWithImpl(_$AddCustomerStateImpl _value,
      $Res Function(_$AddCustomerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
  }) {
    return _then(_$AddCustomerStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddCustomerStateImpl implements _AddCustomerState {
  const _$AddCustomerStateImpl(
      {this.status = DataStateStatus.initial, this.err});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;

  @override
  String toString() {
    return 'AddCustomerState(status: $status, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCustomerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCustomerStateImplCopyWith<_$AddCustomerStateImpl> get copyWith =>
      __$$AddCustomerStateImplCopyWithImpl<_$AddCustomerStateImpl>(
          this, _$identity);
}

abstract class _AddCustomerState implements AddCustomerState {
  const factory _AddCustomerState(
      {final DataStateStatus status,
      final String? err}) = _$AddCustomerStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$AddCustomerStateImplCopyWith<_$AddCustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
