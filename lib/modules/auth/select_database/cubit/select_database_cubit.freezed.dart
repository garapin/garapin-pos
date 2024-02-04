// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_database_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectDatabaseState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String get selectedDatabase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectDatabaseStateCopyWith<SelectDatabaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectDatabaseStateCopyWith<$Res> {
  factory $SelectDatabaseStateCopyWith(
          SelectDatabaseState value, $Res Function(SelectDatabaseState) then) =
      _$SelectDatabaseStateCopyWithImpl<$Res, SelectDatabaseState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      User? user,
      String selectedDatabase});
}

/// @nodoc
class _$SelectDatabaseStateCopyWithImpl<$Res, $Val extends SelectDatabaseState>
    implements $SelectDatabaseStateCopyWith<$Res> {
  _$SelectDatabaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? user = freezed,
    Object? selectedDatabase = null,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      selectedDatabase: null == selectedDatabase
          ? _value.selectedDatabase
          : selectedDatabase // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectDatabaseStateImplCopyWith<$Res>
    implements $SelectDatabaseStateCopyWith<$Res> {
  factory _$$SelectDatabaseStateImplCopyWith(_$SelectDatabaseStateImpl value,
          $Res Function(_$SelectDatabaseStateImpl) then) =
      __$$SelectDatabaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      User? user,
      String selectedDatabase});
}

/// @nodoc
class __$$SelectDatabaseStateImplCopyWithImpl<$Res>
    extends _$SelectDatabaseStateCopyWithImpl<$Res, _$SelectDatabaseStateImpl>
    implements _$$SelectDatabaseStateImplCopyWith<$Res> {
  __$$SelectDatabaseStateImplCopyWithImpl(_$SelectDatabaseStateImpl _value,
      $Res Function(_$SelectDatabaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? user = freezed,
    Object? selectedDatabase = null,
  }) {
    return _then(_$SelectDatabaseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      selectedDatabase: null == selectedDatabase
          ? _value.selectedDatabase
          : selectedDatabase // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectDatabaseStateImpl implements _SelectDatabaseState {
  const _$SelectDatabaseStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      this.user,
      this.selectedDatabase = ''});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  @override
  final User? user;
  @override
  @JsonKey()
  final String selectedDatabase;

  @override
  String toString() {
    return 'SelectDatabaseState(status: $status, err: $err, user: $user, selectedDatabase: $selectedDatabase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDatabaseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedDatabase, selectedDatabase) ||
                other.selectedDatabase == selectedDatabase));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, err, user, selectedDatabase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDatabaseStateImplCopyWith<_$SelectDatabaseStateImpl> get copyWith =>
      __$$SelectDatabaseStateImplCopyWithImpl<_$SelectDatabaseStateImpl>(
          this, _$identity);
}

abstract class _SelectDatabaseState implements SelectDatabaseState {
  const factory _SelectDatabaseState(
      {final DataStateStatus status,
      final String? err,
      final User? user,
      final String selectedDatabase}) = _$SelectDatabaseStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  User? get user;
  @override
  String get selectedDatabase;
  @override
  @JsonKey(ignore: true)
  _$$SelectDatabaseStateImplCopyWith<_$SelectDatabaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
