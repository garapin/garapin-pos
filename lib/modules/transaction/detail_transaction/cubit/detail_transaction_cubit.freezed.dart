// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailTransactionState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  List<Cart> get item => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  ShowImageType get showImageType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailTransactionStateCopyWith<DetailTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTransactionStateCopyWith<$Res> {
  factory $DetailTransactionStateCopyWith(DetailTransactionState value,
          $Res Function(DetailTransactionState) then) =
      _$DetailTransactionStateCopyWithImpl<$Res, DetailTransactionState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Cart> item,
      Transaction? transaction,
      ShowImageType showImageType});
}

/// @nodoc
class _$DetailTransactionStateCopyWithImpl<$Res,
        $Val extends DetailTransactionState>
    implements $DetailTransactionStateCopyWith<$Res> {
  _$DetailTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? item = null,
    Object? transaction = freezed,
    Object? showImageType = null,
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
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      showImageType: null == showImageType
          ? _value.showImageType
          : showImageType // ignore: cast_nullable_to_non_nullable
              as ShowImageType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailTransactionStateImplCopyWith<$Res>
    implements $DetailTransactionStateCopyWith<$Res> {
  factory _$$DetailTransactionStateImplCopyWith(
          _$DetailTransactionStateImpl value,
          $Res Function(_$DetailTransactionStateImpl) then) =
      __$$DetailTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? err,
      List<Cart> item,
      Transaction? transaction,
      ShowImageType showImageType});
}

/// @nodoc
class __$$DetailTransactionStateImplCopyWithImpl<$Res>
    extends _$DetailTransactionStateCopyWithImpl<$Res,
        _$DetailTransactionStateImpl>
    implements _$$DetailTransactionStateImplCopyWith<$Res> {
  __$$DetailTransactionStateImplCopyWithImpl(
      _$DetailTransactionStateImpl _value,
      $Res Function(_$DetailTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? err = freezed,
    Object? item = null,
    Object? transaction = freezed,
    Object? showImageType = null,
  }) {
    return _then(_$DetailTransactionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      showImageType: null == showImageType
          ? _value.showImageType
          : showImageType // ignore: cast_nullable_to_non_nullable
              as ShowImageType,
    ));
  }
}

/// @nodoc

class _$DetailTransactionStateImpl implements _DetailTransactionState {
  const _$DetailTransactionStateImpl(
      {this.status = DataStateStatus.initial,
      this.err,
      final List<Cart> item = const [],
      this.transaction,
      this.showImageType = ShowImageType.instalation})
      : _item = item;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? err;
  final List<Cart> _item;
  @override
  @JsonKey()
  List<Cart> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  final Transaction? transaction;
  @override
  @JsonKey()
  final ShowImageType showImageType;

  @override
  String toString() {
    return 'DetailTransactionState(status: $status, err: $err, item: $item, transaction: $transaction, showImageType: $showImageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.showImageType, showImageType) ||
                other.showImageType == showImageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, err,
      const DeepCollectionEquality().hash(_item), transaction, showImageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailTransactionStateImplCopyWith<_$DetailTransactionStateImpl>
      get copyWith => __$$DetailTransactionStateImplCopyWithImpl<
          _$DetailTransactionStateImpl>(this, _$identity);
}

abstract class _DetailTransactionState implements DetailTransactionState {
  const factory _DetailTransactionState(
      {final DataStateStatus status,
      final String? err,
      final List<Cart> item,
      final Transaction? transaction,
      final ShowImageType showImageType}) = _$DetailTransactionStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get err;
  @override
  List<Cart> get item;
  @override
  Transaction? get transaction;
  @override
  ShowImageType get showImageType;
  @override
  @JsonKey(ignore: true)
  _$$DetailTransactionStateImplCopyWith<_$DetailTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
