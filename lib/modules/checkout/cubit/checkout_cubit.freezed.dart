// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  QrCode? get qrData => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  Invoices? get invoices => throw _privateConstructorUsedError;
  VirtualAccount? get virtualAccountResponse =>
      throw _privateConstructorUsedError;
  PaymentCash? get cashResponse => throw _privateConstructorUsedError;
  List<AvailablePayment> get availablePayment =>
      throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      QrCode? qrData,
      Store? store,
      Invoices? invoices,
      VirtualAccount? virtualAccountResponse,
      PaymentCash? cashResponse,
      List<AvailablePayment> availablePayment,
      PaymentStatus paymentStatus,
      PaymentMethod paymentMethod});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

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
    Object? store = freezed,
    Object? invoices = freezed,
    Object? virtualAccountResponse = freezed,
    Object? cashResponse = freezed,
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
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      virtualAccountResponse: freezed == virtualAccountResponse
          ? _value.virtualAccountResponse
          : virtualAccountResponse // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      cashResponse: freezed == cashResponse
          ? _value.cashResponse
          : cashResponse // ignore: cast_nullable_to_non_nullable
              as PaymentCash?,
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
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
          _$CheckoutStateImpl value, $Res Function(_$CheckoutStateImpl) then) =
      __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      String? error,
      QrCode? qrData,
      Store? store,
      Invoices? invoices,
      VirtualAccount? virtualAccountResponse,
      PaymentCash? cashResponse,
      List<AvailablePayment> availablePayment,
      PaymentStatus paymentStatus,
      PaymentMethod paymentMethod});
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
      _$CheckoutStateImpl _value, $Res Function(_$CheckoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? qrData = freezed,
    Object? store = freezed,
    Object? invoices = freezed,
    Object? virtualAccountResponse = freezed,
    Object? cashResponse = freezed,
    Object? availablePayment = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$CheckoutStateImpl(
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
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as Invoices?,
      virtualAccountResponse: freezed == virtualAccountResponse
          ? _value.virtualAccountResponse
          : virtualAccountResponse // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      cashResponse: freezed == cashResponse
          ? _value.cashResponse
          : cashResponse // ignore: cast_nullable_to_non_nullable
              as PaymentCash?,
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

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl(
      {this.status = DataStateStatus.initial,
      this.error,
      this.qrData,
      this.store,
      this.invoices,
      this.virtualAccountResponse,
      this.cashResponse,
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
  final Store? store;
  @override
  final Invoices? invoices;
  @override
  final VirtualAccount? virtualAccountResponse;
  @override
  final PaymentCash? cashResponse;
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
    return 'CheckoutState(status: $status, error: $error, qrData: $qrData, store: $store, invoices: $invoices, virtualAccountResponse: $virtualAccountResponse, cashResponse: $cashResponse, availablePayment: $availablePayment, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.qrData, qrData) || other.qrData == qrData) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.invoices, invoices) ||
                other.invoices == invoices) &&
            (identical(other.virtualAccountResponse, virtualAccountResponse) ||
                other.virtualAccountResponse == virtualAccountResponse) &&
            (identical(other.cashResponse, cashResponse) ||
                other.cashResponse == cashResponse) &&
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
      store,
      invoices,
      virtualAccountResponse,
      cashResponse,
      const DeepCollectionEquality().hash(_availablePayment),
      paymentStatus,
      paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState(
      {final DataStateStatus status,
      final String? error,
      final QrCode? qrData,
      final Store? store,
      final Invoices? invoices,
      final VirtualAccount? virtualAccountResponse,
      final PaymentCash? cashResponse,
      final List<AvailablePayment> availablePayment,
      final PaymentStatus paymentStatus,
      final PaymentMethod paymentMethod}) = _$CheckoutStateImpl;

  @override
  DataStateStatus get status;
  @override
  String? get error;
  @override
  QrCode? get qrData;
  @override
  Store? get store;
  @override
  Invoices? get invoices;
  @override
  VirtualAccount? get virtualAccountResponse;
  @override
  PaymentCash? get cashResponse;
  @override
  List<AvailablePayment> get availablePayment;
  @override
  PaymentStatus get paymentStatus;
  @override
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
