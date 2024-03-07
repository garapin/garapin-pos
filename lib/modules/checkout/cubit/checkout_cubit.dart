import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/available_payment.dart';
import 'package:pos/data/models/base/qrcode.dart';
import 'package:pos/data/models/base/virtual_account.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';

import '../../../data/models/base/invoices.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends BaseCubit<CheckoutState> {
  Timer? timer;
  final ScrollController scrollController = ScrollController();
  final CartCubit cartCubit;
  CheckoutCubit(BuildContext context, this.cartCubit)
      : super(context, CheckoutState());

  @override
  Future<void> initData() async {
    loadingState();
    getInvoices();
    getInvoicesInterval(cartCubit.state.invoces!);
    getAvailablePayment();
    emit(state.copyWith(status: DataStateStatus.success));

    finishRefresh(state.status);
  }

  getAvailablePayment() async {
    final data = await ApiService.paymentAvailable(context);
    emit(state.copyWith(availablePayment: data.data));
  }

  getInvoices() async {
    final data = await ApiService.getSingleInvoices(context,
        invoices: cartCubit.state.invoces!);
    if (data.isSuccess) {
      emit(state.copyWith(invoices: data.data));
    }
  }

  doSelectPayment(PaymentMethod paymentMethod, String invoices, int amount,
      {String? bankCode}) async {
    if (paymentMethod == PaymentMethod.qris) {
      // if (state.qrData == null) {
      final data = await ApiService.createQrcode(context,
          invoices: invoices, amount: amount);
      if (data.isSuccess) {
        // getInvoicesInterval(data.data!.referenceId!);
        emit(state.copyWith(paymentMethod: paymentMethod, qrData: data.data));
      }
      // }
    } else if (paymentMethod == PaymentMethod.va) {
      final data = await ApiService.createVirtualAccount(context,
          invoice: invoices, bankCode: bankCode!);
      if (data.isSuccess) {
        // getInvoicesInterval(data.data!.externalId!);
        emit(state.copyWith(
            paymentMethod: PaymentMethod.va,
            virtualAccountResponse: data.data));
      }
    }
    scrollBottom();
  }

  void getInvoicesInterval(String invoices) {
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      try {
        final data =
            await ApiService.getSingleInvoices(context, invoices: invoices);
        if (data.isSuccess) {
          emit(state.copyWith(invoices: data.data));
          if (data.data?.status == "SUCCEEDED") {
            timer.cancel();
            emit(state.copyWith(
                paymentStatus: PaymentStatus.success,
                paymentMethod: PaymentMethod.none));
            cartCubit.clearCart();
            showSuccess("Sukses Terbayar");
          } else if (data.data?.status == "CANCELLED") {
            timer.cancel();
            print("batal woy");
            emit(state.copyWith(
                paymentStatus: PaymentStatus.pending,
                paymentMethod: PaymentMethod.none));
            showSuccess("Sukses Terbayar");
          }
        }
      } catch (error) {
        // Tangani kesalahan yang mungkin terjadi
        print('Error: $error');
      }
    });
  }

  cancelCheckout(String invoices) async {
    final data = await ApiService.cancelOrder(context, invoices: invoices);
    if (data.isSuccess) {
      showInfo("Order $invoices Dibatalkan");
    }
  }

  scrollBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500), // Durasi animasi
      curve: Curves.easeOut, // Kurva animasi
    );
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
