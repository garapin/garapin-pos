// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locked_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LockedAccountState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  QrCode? get qrData => throw _privateConstructorUsedError;
  Invoices? get invoices => throw _privateConstructorUsedError;
  AmountPendingTransaction? get amountPendingTransaction =>
      throw _privateConstructorUsedError;
  VirtualAccount? get virtualAccountResponse =>
      throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  List<AvailablePayment> get availablePayment =>
      throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LockedAccountStateCopyWith<LockedAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LockedAccountStateCopyWith<$Res> {
  factory $LockedAccountStateCopyWith(
          LockedAccountState value, $Res Function(LockedAccountState) then) =
      _$LockedAccountStateCopyWithImpl<$Res, LockedAccountState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      QrCode? qrData,
      Invoices? invoices,
      AmountPendingTransaction? amountPendingTransaction,
      VirtualAccount? virtualAccountResponse,
      Store? store,
      List<AvailablePayment> availablePayment,
      PaymentStatus paymentStatus,
      PaymentMethod paymentMethod});
}

/// @nodoc
class _$LockedAccountStateCopyWithImpl<$Res, $Val extends LockedAccountState>
    implements $LockedAccountStateCopyWith<$Res> {
  _$LockedAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? qrData = freezed,
    Object? invoices = freezed,
    Object? amountPendingTransaction = freezed,
    Object? virtualAccountResponse = freezed,
    Object? store = freezed,
    Object? availablePayment = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      qrData: freezed == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as QrCode?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      amountPendingTransaction: freezed == amountPendingTransaction
          ? _value.amountPendingTransaction
          : amountPendingTransaction // ignore: cast_nullable_to_non_nullable
              as AmountPendingTransaction?,
      virtualAccountResponse: freezed == virtualAccountResponse
          ? _value.virtualAccountResponse
          : virtualAccountResponse // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      availablePayment: null == availablePayment
          ? _value.availablePayment
          : availablePayment // ignore: cast_nullable_to_non_nullable
              as List<AvailablePayment>,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LockedAccountStateImplCopyWith<$Res>
    implements $LockedAccountStateCopyWith<$Res> {
  factory _$$LockedAccountStateImplCopyWith(_$LockedAccountStateImpl value,
          $Res Function(_$LockedAccountStateImpl) then) =
      __$$LockedAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      QrCode? qrData,
      Invoices? invoices,
      AmountPendingTransaction? amountPendingTransaction,
      VirtualAccount? virtualAccountResponse,
      Store? store,
      List<AvailablePayment> availablePayment,
      PaymentStatus paymentStatus,
      PaymentMethod paymentMethod});
}

/// @nodoc
class __$$LockedAccountStateImplCopyWithImpl<$Res>
    extends _$LockedAccountStateCopyWithImpl<$Res, _$LockedAccountStateImpl>
    implements _$$LockedAccountStateImplCopyWith<$Res> {
  __$$LockedAccountStateImplCopyWithImpl(_$LockedAccountStateImpl _value,
      $Res Function(_$LockedAccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? qrData = freezed,
    Object? invoices = freezed,
    Object? amountPendingTransaction = freezed,
    Object? virtualAccountResponse = freezed,
    Object? store = freezed,
    Object? availablePayment = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$LockedAccountStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      qrData: freezed == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as QrCode?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      amountPendingTransaction: freezed == amountPendingTransaction
          ? _value.amountPendingTransaction
          : amountPendingTransaction // ignore: cast_nullable_to_non_nullable
              as AmountPendingTransaction?,
      virtualAccountResponse: freezed == virtualAccountResponse
          ? _value.virtualAccountResponse
          : virtualAccountResponse // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      availablePayment: null == availablePayment
          ? _value._availablePayment
          : availablePayment // ignore: cast_nullable_to_non_nullable
              as List<AvailablePayment>,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc

class _$LockedAccountStateImpl implements _LockedAccountState {
  const _$LockedAccountStateImpl(
      {this.status = DataStateStatus.initial,
      this.error,
      this.qrData,
      this.invoices,
      this.amountPendingTransaction,
      this.virtualAccountResponse,
      this.store,
      final List<AvailablePayment> availablePayment = const [],
      this.paymentStatus = PaymentStatus.pending,
      this.paymentMethod = PaymentMethod.none})
      : _availablePayment = availablePayment;

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final String? error;
  @override
  final QrCode? qrData;
  @override
  final Invoices? invoices;
  @override
  final AmountPendingTransaction? amountPendingTransaction;
  @override
  final VirtualAccount? virtualAccountResponse;
  @override
  final Store? store;
  final List<AvailablePayment> _availablePayment;
  @override
  @JsonKey()
  List<AvailablePayment> get availablePayment {
    if (_availablePayment is EqualUnmodifiableListView)
      return _availablePayment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePayment);
  }

  @override
  @JsonKey()
  final PaymentStatus paymentStatus;
  @override
  @JsonKey()
  final PaymentMethod paymentMethod;

  @override
  String toString() {
    return 'LockedAccountState(status: $status, error: $error, qrData: $qrData, invoices: $invoices, amountPendingTransaction: $amountPendingTransaction, virtualAccountResponse: $virtualAccountResponse, store: $store, availablePayment: $availablePayment, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LockedAccountStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.qrData, qrData) || other.qrData == qrData) &&
            (identical(other.invoices, invoices) ||
                other.invoices == invoices) &&
            (identical(
                    other.amountPendingTransaction, amountPendingTransaction) ||
                other.amountPendingTransaction == amountPendingTransaction) &&
            (identical(other.virtualAccountResponse, virtualAccountResponse) ||
                other.virtualAccountResponse == virtualAccountResponse) &&
            (identical(other.store, store) || other.store == store) &&
            const DeepCollectionEquality()
                .equals(other._availablePayment, _availablePayment) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      qrData,
      invoices,
      amountPendingTransaction,
      virtualAccountResponse,
      store,
      const DeepCollectionEquality().hash(_availablePayment),
      paymentStatus,
      paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LockedAccountStateImplCopyWith<_$LockedAccountStateImpl> get copyWith =>
      __$$LockedAccountStateImplCopyWithImpl<_$LockedAccountStateImpl>(
          this, _$identity);
}

abstract class _LockedAccountState implements LockedAccountState {
  const factory _LockedAccountState(
      {final DataStateStatus status,
      final String? error,
      final QrCode? qrData,
      final Invoices? invoices,
      final AmountPendingTransaction? amountPendingTransaction,
      final VirtualAccount? virtualAccountResponse,
      final Store? store,
      final List<AvailablePayment> availablePayment,
      final PaymentStatus paymentStatus,
      final PaymentMethod paymentMethod}) = _$LockedAccountStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get error;
  @override
  QrCode? get qrData;
  @override
  Invoices? get invoices;
  @override
  AmountPendingTransaction? get amountPendingTransaction;
  @override
  VirtualAccount? get virtualAccountResponse;
  @override
  Store? get store;
  @override
  List<AvailablePayment> get availablePayment;
  @override
  PaymentStatus get paymentStatus;
  @override
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$LockedAccountStateImplCopyWith<_$LockedAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
