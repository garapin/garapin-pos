import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_state.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';

class LockedAccountCubit extends BaseCubit<LockedAccountState> {
  Timer? timer;
  LockedAccountCubit(BuildContext context)
      : super(context, const LockedAccountState());

  createInvoice(User user,
      {required String targetDatabase, bool isQuickRelease = false}) async {
    final data = await ApiService.createInvoiceTopUp(
      context,
      targetDatabase: targetDatabase,
      amount: state.amountPendingTransaction?.amount ?? 0,
      payerEmail: user.email ?? "",
      isQuickRelease: isQuickRelease,
    );
    if (data.isSuccess) {
      getInvoices(data.data!.invoice!);
    } else {
      showError(data.message);
    }
  }

  getStore() async {
    emit(state.copyWith(status: DataStateStatus.loading));
    final data = await ApiService.getStoreInfo(context);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, store: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
  }

  getAmountPendingTransaction() async {
    final data = await ApiService.getAmountPending(
      context,
    );
    if (data.isSuccess) {
      emit(state.copyWith(amountPendingTransaction: data.data));
    }
  }

  getInvoices(String invoice) async {
    final data = await ApiService.getSingleInvoices(context, invoices: invoice);
    if (data.isSuccess) {
      emit(state.copyWith(invoices: data.data));

      getInvoicesInterval(data.data!.invoice!);
    }
  }

  getAvailablePayment() async {
    final data = await ApiService.paymentAvailable(context, type: 'payment');
    emit(state.copyWith(availablePayment: data.data));
  }

  doSelectPayment(PaymentMethod paymentMethod, User user, String invoices,
      int amount, String targetDatabase,
      {String? bankCode, bool isQuickRelease = false}) async {
    showLoading();
    if (paymentMethod == PaymentMethod.qris) {
      final data = await ApiService.createQrcodeTopUp(
        context,
        invoices: invoices,
        targetDatabase: targetDatabase,
        amount: amount,
        isQuickRelease: isQuickRelease,
      );
      if (data.isSuccess) {
        emit(state.copyWith(paymentMethod: paymentMethod, qrData: data.data));
      }
    } else if (paymentMethod == PaymentMethod.va) {
      final data = await ApiService.createVirtualAccountTopUp(
        context,
        invoice: invoices,
        bankCode: bankCode!,
        isQuickRelease: isQuickRelease,
      );
      if (data.isSuccess) {
        emit(
          state.copyWith(
            paymentMethod: PaymentMethod.va,
            virtualAccountResponse: data.data,
          ),
        );
      } else {
        showError(data.message);
      }
    }
    dismissLoading();
  }

  changePaymentMethod(PaymentMethod paymentMethod) {
    if (state.paymentMethod == paymentMethod) {
      emit(state.copyWith(paymentMethod: PaymentMethod.none));
    } else {
      emit(state.copyWith(paymentMethod: paymentMethod));
    }
  }

  void getInvoicesInterval(String invoices) {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) async {
        try {
          final data =
              await ApiService.getSingleInvoices(context, invoices: invoices);
          if (data.isSuccess) {
            print("GET INTERVAL");
            emit(state.copyWith(invoices: data.data));
            if (data.data?.status == "SUCCEEDED" ||
                data.data?.status == "PENDING_TRANSFER") {
              timer.cancel();
              emit(
                state.copyWith(
                  paymentStatus: PaymentStatus.success,
                  paymentMethod: PaymentMethod.none,
                ),
              );
              showSuccess("Sukses Terbayar");
            } else if (data.data?.status == "CANCELLED") {
              print("CANCELED TRX");
              timer.cancel();
              emit(
                state.copyWith(
                  paymentStatus: PaymentStatus.pending,
                  paymentMethod: PaymentMethod.none,
                ),
              );
              showSuccess("Sukses Terbayar");
            }
          }
        } catch (error) {
          print('Error: $error');
        }
      },
    );
  }

  cancelCheckout(String invoices) async {
    final data = await ApiService.cancelOrder(context, invoices: invoices);
    if (data.isSuccess) {
      showInfo("Order $invoices Dibatalkan");
      timer?.cancel();
    }
  }

  @override
  Future<void> initData() async {
    getAvailablePayment();
    await getAmountPendingTransaction();
  }

  @override
  void loadingState() {
    // TODO: implement loadingState
  }

  @override
  Future<void> refreshData() {
    // TODO: implement refreshData
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    timer?.cancel();
    return super.close();
  }
}
