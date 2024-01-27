// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_teknisi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageTeknisiState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  String get filterStatus => throw _privateConstructorUsedError;
  List<Transaction> get listTransaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageTeknisiStateCopyWith<HomePageTeknisiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageTeknisiStateCopyWith<$Res> {
  factory $HomePageTeknisiStateCopyWith(HomePageTeknisiState value,
          $Res Function(HomePageTeknisiState) then) =
      _$HomePageTeknisiStateCopyWithImpl<$Res, HomePageTeknisiState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      String filterStatus,
      List<Transaction> listTransaction});
}

/// @nodoc
class _$HomePageTeknisiStateCopyWithImpl<$Res,
        $Val extends HomePageTeknisiState>
    implements $HomePageTeknisiStateCopyWith<$Res> {
  _$HomePageTeknisiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? filterStatus = null,
    Object? listTransaction = null,
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
      filterStatus: null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String,
      listTransaction: null == listTransaction
          ? _value.listTransaction
          : listTransaction // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageTeknisiStateImplCopyWith<$Res>
    implements $HomePageTeknisiStateCopyWith<$Res> {
  factory _$$HomePageTeknisiStateImplCopyWith(_$HomePageTeknisiStateImpl value,
          $Res Function(_$HomePageTeknisiStateImpl) then) =
      __$$HomePageTeknisiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      String filterStatus,
      List<Transaction> listTransaction});
}

/// @nodoc
class __$$HomePageTeknisiStateImplCopyWithImpl<$Res>
    extends _$HomePageTeknisiStateCopyWithImpl<$Res, _$HomePageTeknisiStateImpl>
    implements _$$HomePageTeknisiStateImplCopyWith<$Res> {
  __$$HomePageTeknisiStateImplCopyWithImpl(_$HomePageTeknisiStateImpl _value,
      $Res Function(_$HomePageTeknisiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? filterStatus = null,
    Object? listTransaction = null,
  }) {
    return _then(_$HomePageTeknisiStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      filterStatus: null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String,
      listTransaction: null == listTransaction
          ? _value._listTransaction
          : listTransaction // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$HomePageTeknisiStateImpl implements _HomePageTeknisiState {
  const _$HomePageTeknisiStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      this.filterStatus = "ALL",
      final List<Transaction> listTransaction = const []})
      : _listTransaction = listTransaction;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  @override
  @JsonKey()
  final String filterStatus;
  final List<Transaction> _listTransaction;
  @override
  @JsonKey()
  List<Transaction> get listTransaction {
    if (_listTransaction is EqualUnmodifiableListView) return _listTransaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTransaction);
  }

  @override
  String toString() {
    return 'HomePageTeknisiState(status: $status, err: $err, filterStatus: $filterStatus, listTransaction: $listTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageTeknisiStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            const DeepCollectionEquality()
                .equals(other._listTransaction, _listTransaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err, filterStatus,
      const DeepCollectionEquality().hash(_listTransaction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageTeknisiStateImplCopyWith<_$HomePageTeknisiStateImpl>
      get copyWith =>
          __$$HomePageTeknisiStateImplCopyWithImpl<_$HomePageTeknisiStateImpl>(
              this, _$identity);
}

abstract class _HomePageTeknisiState implements HomePageTeknisiState {
  const factory _HomePageTeknisiState(
      {final DataStateStatus status,
      final String? err,
      final String filterStatus,
      final List<Transaction> listTransaction}) = _$HomePageTeknisiStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  String get filterStatus;
  @override
  List<Transaction> get listTransaction;
  @override
  @JsonKey(ignore: true)
  _$$HomePageTeknisiStateImplCopyWith<_$HomePageTeknisiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
