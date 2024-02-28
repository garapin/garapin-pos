import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/qrcode.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends BaseCubit<CheckoutState> {
  final CartCubit cartCubit;
  CheckoutCubit(BuildContext context, this.cartCubit)
      : super(context, CheckoutState());
  Timer? timer;
  @override
  Future<void> initData() async {
    loadingState();
    emit(state.copyWith(status: DataStateStatus.success));
    finishRefresh(state.status);
  }

  doSelectPayment(
      PaymentMethod paymentMethod, String invoices, int amount) async {
    if (paymentMethod == PaymentMethod.qris) {
      final data = await ApiService.createQrcode(context,
          invoices: invoices, amount: amount);
      if (data.isSuccess) {
        getDataInterval(data.data!.referenceId!);
        emit(state.copyWith(paymentMethod: paymentMethod, qrData: data.data));
      }
    }
  }

  getDataInterval(String invoices) {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      try {
        final data =
            await ApiService.getSingleInvoices(context, invoices: invoices);
        if (data.isSuccess) {
          if (data.data?.status == "SUCCEEDED") {
            timer.cancel();
            emit(state.copyWith(
                paymentStatus: PaymentStatus.success,
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

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
}
