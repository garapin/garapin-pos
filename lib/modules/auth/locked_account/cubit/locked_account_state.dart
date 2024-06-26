import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/models/base/amount_pending_transaction.dart';
import 'package:pos/data/models/base/available_payment.dart';
import 'package:pos/data/models/base/database.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/data/models/base/qrcode.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/data/models/base/virtual_account.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';

part 'locked_account_state.freezed.dart';

@freezed
class LockedAccountState with _$LockedAccountState {
  const factory LockedAccountState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    String? error,
    QrCode? qrData,
    Invoices? invoices,
    AmountPendingTransaction? amountPendingTransaction,
    VirtualAccount? virtualAccountResponse,
    Store? store,
    @Default([]) List<AvailablePayment> availablePayment,
    @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    @Default(PaymentMethod.none) PaymentMethod paymentMethod,
  }) = _LockedAccountState;
}