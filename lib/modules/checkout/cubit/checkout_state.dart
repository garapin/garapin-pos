part of 'checkout_cubit.dart';

enum PaymentStatus { pending, success, error }

enum PaymentMethod { none, qris, va, cash }

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    QrCode? qrData,
    Store? store,
    Invoices? invoices,
    VirtualAccount? virtualAccountResponse,
    PaymentCash? cashResponse,
    @Default([]) List<AvailablePayment> availablePayment,
    @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    @Default(PaymentMethod.none) PaymentMethod paymentMethod,
  }) = _CheckoutState;
}
