// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_transaction_teknisi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListTransactionTeknisiState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  String get filterStatus => throw _privateConstructorUsedError;
  List<Transaction> get listTransaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListTransactionTeknisiStateCopyWith<ListTransactionTeknisiState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTransactionTeknisiStateCopyWith<$Res> {
  factory $ListTransactionTeknisiStateCopyWith(
          ListTransactionTeknisiState value,
          $Res Function(ListTransactionTeknisiState) then) =
      _$ListTransactionTeknisiStateCopyWithImpl<$Res,
          ListTransactionTeknisiState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      String filterStatus,
      List<Transaction> listTransaction});
}

/// @nodoc
class _$ListTransactionTeknisiStateCopyWithImpl<$Res,
        $Val extends ListTransactionTeknisiState>
    implements $ListTransactionTeknisiStateCopyWith<$Res> {
  _$ListTransactionTeknisiStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ListTransactionTeknisiStateImplCopyWith<$Res>
    implements $ListTransactionTeknisiStateCopyWith<$Res> {
  factory _$$ListTransactionTeknisiStateImplCopyWith(
          _$ListTransactionTeknisiStateImpl value,
          $Res Function(_$ListTransactionTeknisiStateImpl) then) =
      __$$ListTransactionTeknisiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      String filterStatus,
      List<Transaction> listTransaction});
}

/// @nodoc
class __$$ListTransactionTeknisiStateImplCopyWithImpl<$Res>
    extends _$ListTransactionTeknisiStateCopyWithImpl<$Res,
        _$ListTransactionTeknisiStateImpl>
    implements _$$ListTransactionTeknisiStateImplCopyWith<$Res> {
  __$$ListTransactionTeknisiStateImplCopyWithImpl(
      _$ListTransactionTeknisiStateImpl _value,
      $Res Function(_$ListTransactionTeknisiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? filterStatus = null,
    Object? listTransaction = null,
  }) {
    return _then(_$ListTransactionTeknisiStateImpl(
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

class _$ListTransactionTeknisiStateImpl
    implements _ListTransactionTeknisiState {
  const _$ListTransactionTeknisiStateImpl(
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
    return 'ListTransactionTeknisiState(status: $status, err: $err, filterStatus: $filterStatus, listTransaction: $listTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTransactionTeknisiStateImpl &&
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
  _$$ListTransactionTeknisiStateImplCopyWith<_$ListTransactionTeknisiStateImpl>
      get copyWith => __$$ListTransactionTeknisiStateImplCopyWithImpl<
          _$ListTransactionTeknisiStateImpl>(this, _$identity);
}

abstract class _ListTransactionTeknisiState
    implements ListTransactionTeknisiState {
  const factory _ListTransactionTeknisiState(
          {final DataStateStatus status,
          final String? err,
          final String filterStatus,
          final List<Transaction> listTransaction}) =
      _$ListTransactionTeknisiStateImpl;

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
  _$$ListTransactionTeknisiStateImplCopyWith<_$ListTransactionTeknisiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
