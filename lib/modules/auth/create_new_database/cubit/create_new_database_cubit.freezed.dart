// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_new_database_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateNewDatabaseState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNewDatabaseStateCopyWith<CreateNewDatabaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewDatabaseStateCopyWith<$Res> {
  factory $CreateNewDatabaseStateCopyWith(CreateNewDatabaseState value,
          $Res Function(CreateNewDatabaseState) then) =
      _$CreateNewDatabaseStateCopyWithImpl<$Res, CreateNewDatabaseState>;
  @useResult
  $Res call({DataStateStatus status, String? err});
}

/// @nodoc
class _$CreateNewDatabaseStateCopyWithImpl<$Res,
        $Val extends CreateNewDatabaseState>
    implements $CreateNewDatabaseStateCopyWith<$Res> {
  _$CreateNewDatabaseStateCopyWithImpl(this._value, this._then);

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
abstract class _$$CreateNewDatabaseStateImplCopyWith<$Res>
    implements $CreateNewDatabaseStateCopyWith<$Res> {
  factory _$$CreateNewDatabaseStateImplCopyWith(
          _$CreateNewDatabaseStateImpl value,
          $Res Function(_$CreateNewDatabaseStateImpl) then) =
      __$$CreateNewDatabaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, String? err});
}

/// @nodoc
class __$$CreateNewDatabaseStateImplCopyWithImpl<$Res>
    extends _$CreateNewDatabaseStateCopyWithImpl<$Res,
        _$CreateNewDatabaseStateImpl>
    implements _$$CreateNewDatabaseStateImplCopyWith<$Res> {
  __$$CreateNewDatabaseStateImplCopyWithImpl(
      _$CreateNewDatabaseStateImpl _value,
      $Res Function(_$CreateNewDatabaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
  }) {
    return _then(_$CreateNewDatabaseStateImpl(
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

class _$CreateNewDatabaseStateImpl implements _CreateNewDatabaseState {
  const _$CreateNewDatabaseStateImpl(
      {this.status = DataStateStatus.initial, this.err});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;

  @override
  String toString() {
    return 'CreateNewDatabaseState(status: $status, err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewDatabaseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewDatabaseStateImplCopyWith<_$CreateNewDatabaseStateImpl>
      get copyWith => __$$CreateNewDatabaseStateImplCopyWithImpl<
          _$CreateNewDatabaseStateImpl>(this, _$identity);
}

abstract class _CreateNewDatabaseState implements CreateNewDatabaseState {
  const factory _CreateNewDatabaseState(
      {final DataStateStatus status,
      final String? err}) = _$CreateNewDatabaseStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$CreateNewDatabaseStateImplCopyWith<_$CreateNewDatabaseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
