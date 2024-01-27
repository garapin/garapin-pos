// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomepageState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Transaction> get listTransaction => throw _privateConstructorUsedError;
  String get filterStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomepageStateCopyWith<HomepageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageStateCopyWith<$Res> {
  factory $HomepageStateCopyWith(
          HomepageState value, $Res Function(HomepageState) then) =
      _$HomepageStateCopyWithImpl<$Res, HomepageState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Transaction> listTransaction,
      String filterStatus});
}

/// @nodoc
class _$HomepageStateCopyWithImpl<$Res, $Val extends HomepageState>
    implements $HomepageStateCopyWith<$Res> {
  _$HomepageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? listTransaction = null,
    Object? filterStatus = null,
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
      listTransaction: null == listTransaction
          ? _value.listTransaction
          : listTransaction // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      filterStatus: null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomepageStateImplCopyWith<$Res>
    implements $HomepageStateCopyWith<$Res> {
  factory _$$HomepageStateImplCopyWith(
          _$HomepageStateImpl value, $Res Function(_$HomepageStateImpl) then) =
      __$$HomepageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Transaction> listTransaction,
      String filterStatus});
}

/// @nodoc
class __$$HomepageStateImplCopyWithImpl<$Res>
    extends _$HomepageStateCopyWithImpl<$Res, _$HomepageStateImpl>
    implements _$$HomepageStateImplCopyWith<$Res> {
  __$$HomepageStateImplCopyWithImpl(
      _$HomepageStateImpl _value, $Res Function(_$HomepageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? listTransaction = null,
    Object? filterStatus = null,
  }) {
    return _then(_$HomepageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      listTransaction: null == listTransaction
          ? _value._listTransaction
          : listTransaction // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      filterStatus: null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomepageStateImpl implements _HomepageState {
  const _$HomepageStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Transaction> listTransaction = const [],
      this.filterStatus = "ALL"})
      : _listTransaction = listTransaction;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<Transaction> _listTransaction;
  @override
  @JsonKey()
  List<Transaction> get listTransaction {
    if (_listTransaction is EqualUnmodifiableListView) return _listTransaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTransaction);
  }

  @override
  @JsonKey()
  final String filterStatus;

  @override
  String toString() {
    return 'HomepageState(status: $status, err: $err, listTransaction: $listTransaction, filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality()
                .equals(other._listTransaction, _listTransaction) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err,
      const DeepCollectionEquality().hash(_listTransaction), filterStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageStateImplCopyWith<_$HomepageStateImpl> get copyWith =>
      __$$HomepageStateImplCopyWithImpl<_$HomepageStateImpl>(this, _$identity);
}

abstract class _HomepageState implements HomepageState {
  const factory _HomepageState(
      {final DataStateStatus status,
      final String? err,
      final List<Transaction> listTransaction,
      final String filterStatus}) = _$HomepageStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Transaction> get listTransaction;
  @override
  String get filterStatus;
  @override
  @JsonKey(ignore: true)
  _$$HomepageStateImplCopyWith<_$HomepageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
