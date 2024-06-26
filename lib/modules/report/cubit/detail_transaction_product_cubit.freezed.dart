// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_transaction_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailTransactionProductState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Invoices? get invoice => throw _privateConstructorUsedError;
  String? get trxName => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  String? get fee => throw _privateConstructorUsedError;
  String? get tax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailTransactionProductStateCopyWith<DetailTransactionProductState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTransactionProductStateCopyWith<$Res> {
  factory $DetailTransactionProductStateCopyWith(
          DetailTransactionProductState value,
          $Res Function(DetailTransactionProductState) then) =
      _$DetailTransactionProductStateCopyWithImpl<$Res,
          DetailTransactionProductState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      Invoices? invoice,
      String? trxName,
      String? err,
      String? fee,
      String? tax});
}

/// @nodoc
class _$DetailTransactionProductStateCopyWithImpl<$Res,
        $Val extends DetailTransactionProductState>
    implements $DetailTransactionProductStateCopyWith<$Res> {
  _$DetailTransactionProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? invoice = freezed,
    Object? trxName = freezed,
    Object? err = freezed,
    Object? fee = freezed,
    Object? tax = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      trxName: freezed == trxName
          ? _value.trxName
          : trxName // ignore: cast_nullable_to_non_nullable
              as String?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailTransactionProductStateImplCopyWith<$Res>
    implements $DetailTransactionProductStateCopyWith<$Res> {
  factory _$$DetailTransactionProductStateImplCopyWith(
          _$DetailTransactionProductStateImpl value,
          $Res Function(_$DetailTransactionProductStateImpl) then) =
      __$$DetailTransactionProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      Invoices? invoice,
      String? trxName,
      String? err,
      String? fee,
      String? tax});
}

/// @nodoc
class __$$DetailTransactionProductStateImplCopyWithImpl<$Res>
    extends _$DetailTransactionProductStateCopyWithImpl<$Res,
        _$DetailTransactionProductStateImpl>
    implements _$$DetailTransactionProductStateImplCopyWith<$Res> {
  __$$DetailTransactionProductStateImplCopyWithImpl(
      _$DetailTransactionProductStateImpl _value,
      $Res Function(_$DetailTransactionProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? invoice = freezed,
    Object? trxName = freezed,
    Object? err = freezed,
    Object? fee = freezed,
    Object? tax = freezed,
  }) {
    return _then(_$DetailTransactionProductStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      trxName: freezed == trxName
          ? _value.trxName
          : trxName // ignore: cast_nullable_to_non_nullable
              as String?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DetailTransactionProductStateImpl
    implements _DetailTransactionProductState {
  const _$DetailTransactionProductStateImpl(
      {this.status = DataStateStatus.initial,
      this.invoice,
      this.trxName,
      this.err,
      this.fee,
      this.tax});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Invoices? invoice;
  @override
  final String? trxName;
  @override
  final String? err;
  @override
  final String? fee;
  @override
  final String? tax;

  @override
  String toString() {
    return 'DetailTransactionProductState(status: $status, invoice: $invoice, trxName: $trxName, err: $err, fee: $fee, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailTransactionProductStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.trxName, trxName) || other.trxName == trxName) &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, invoice, trxName, err, fee, tax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailTransactionProductStateImplCopyWith<
          _$DetailTransactionProductStateImpl>
      get copyWith => __$$DetailTransactionProductStateImplCopyWithImpl<
          _$DetailTransactionProductStateImpl>(this, _$identity);
}

abstract class _DetailTransactionProductState
    implements DetailTransactionProductState {
  const factory _DetailTransactionProductState(
      {final DataStateStatus status,
      final Invoices? invoice,
      final String? trxName,
      final String? err,
      final String? fee,
      final String? tax}) = _$DetailTransactionProductStateImpl;

  @override
  DataStateStatus get status;
  @override
  Invoices? get invoice;
  @override
  String? get trxName;
  @override
  String? get err;
  @override
  String? get fee;
  @override
  String? get tax;
  @override
  @JsonKey(ignore: true)
  _$$DetailTransactionProductStateImplCopyWith<
          _$DetailTransactionProductStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
