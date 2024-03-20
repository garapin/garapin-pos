// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bagi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BagiState {
  DataStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BagiStateCopyWith<BagiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BagiStateCopyWith<$Res> {
  factory $BagiStateCopyWith(BagiState value, $Res Function(BagiState) then) =
      _$BagiStateCopyWithImpl<$Res, BagiState>;
  @useResult
  $Res call({DataStateStatus status});
}

/// @nodoc
class _$BagiStateCopyWithImpl<$Res, $Val extends BagiState>
    implements $BagiStateCopyWith<$Res> {
  _$BagiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BagiStateImplCopyWith<$Res>
    implements $BagiStateCopyWith<$Res> {
  factory _$$BagiStateImplCopyWith(
          _$BagiStateImpl value, $Res Function(_$BagiStateImpl) then) =
      __$$BagiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status});
}

/// @nodoc
class __$$BagiStateImplCopyWithImpl<$Res>
    extends _$BagiStateCopyWithImpl<$Res, _$BagiStateImpl>
    implements _$$BagiStateImplCopyWith<$Res> {
  __$$BagiStateImplCopyWithImpl(
      _$BagiStateImpl _value, $Res Function(_$BagiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$BagiStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
    ));
  }
}

/// @nodoc

class _$BagiStateImpl implements _BagiState {
  const _$BagiStateImpl({this.status = DataStateStatus.initial});

  @override
  @JsonKey()
  final DataStateStatus status;

  @override
  String toString() {
    return 'BagiState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BagiStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BagiStateImplCopyWith<_$BagiStateImpl> get copyWith =>
      __$$BagiStateImplCopyWithImpl<_$BagiStateImpl>(this, _$identity);
}

abstract class _BagiState implements BagiState {
  const factory _BagiState({final DataStateStatus status}) = _$BagiStateImpl;

  @override
  DataStateStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$BagiStateImplCopyWith<_$BagiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
