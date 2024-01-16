// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListTransactionState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Transaction> get listTransaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListTransactionStateCopyWith<ListTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTransactionStateCopyWith<$Res> {
  factory $ListTransactionStateCopyWith(ListTransactionState value,
          $Res Function(ListTransactionState) then) =
      _$ListTransactionStateCopyWithImpl<$Res, ListTransactionState>;
  @useResult
  $Res call(
      {DataStateStatus status, String? err, List<Transaction> listTransaction});
}

/// @nodoc
class _$ListTransactionStateCopyWithImpl<$Res,
        $Val extends ListTransactionState>
    implements $ListTransactionStateCopyWith<$Res> {
  _$ListTransactionStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListTransactionStateImplCopyWith<$Res>
    implements $ListTransactionStateCopyWith<$Res> {
  factory _$$ListTransactionStateImplCopyWith(_$ListTransactionStateImpl value,
          $Res Function(_$ListTransactionStateImpl) then) =
      __$$ListTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status, String? err, List<Transaction> listTransaction});
}

/// @nodoc
class __$$ListTransactionStateImplCopyWithImpl<$Res>
    extends _$ListTransactionStateCopyWithImpl<$Res, _$ListTransactionStateImpl>
    implements _$$ListTransactionStateImplCopyWith<$Res> {
  __$$ListTransactionStateImplCopyWithImpl(_$ListTransactionStateImpl _value,
      $Res Function(_$ListTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? listTransaction = null,
  }) {
    return _then(_$ListTransactionStateImpl(
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
    ));
  }
}

/// @nodoc

class _$ListTransactionStateImpl implements _ListTransactionState {
  const _$ListTransactionStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Transaction> listTransaction = const []})
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
  String toString() {
    return 'ListTransactionState(status: $status, err: $err, listTransaction: $listTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality()
                .equals(other._listTransaction, _listTransaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err,
      const DeepCollectionEquality().hash(_listTransaction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTransactionStateImplCopyWith<_$ListTransactionStateImpl>
      get copyWith =>
          __$$ListTransactionStateImplCopyWithImpl<_$ListTransactionStateImpl>(
              this, _$identity);
}

abstract class _ListTransactionState implements ListTransactionState {
  const factory _ListTransactionState(
      {final DataStateStatus status,
      final String? err,
      final List<Transaction> listTransaction}) = _$ListTransactionStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Transaction> get listTransaction;
  @override
  @JsonKey(ignore: true)
  _$$ListTransactionStateImplCopyWith<_$ListTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
