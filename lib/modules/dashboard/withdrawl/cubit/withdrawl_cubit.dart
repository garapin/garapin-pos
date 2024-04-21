import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/account_balance.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';
import 'package:pos/themes/themes.dart';

import '../../../../data/models/base/available_payment.dart';

part 'withdrawl_state.dart';
part 'withdrawl_cubit.freezed.dart';

class WithdrawlCubit extends BaseCubit<WithdrawlState> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  WithdrawlCubit(BuildContext context) : super(context, const WithdrawlState());

  @override
  Future<void> initData() async {
    loadingState();
    getAvailablePayment();
    getBalance();
  }

  getBalance() async {
    final data = await ApiService.getAccountBalane(context);
    if (data.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success, accountBalance: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  getAvailablePayment() async {
    final data = await ApiService.paymentAvailable(context);
    emit(state.copyWith(availablePayment: data.data));
  }

  @override
  void loadingState() => emit(state.copyWith(status: DataStateStatus.initial));

  @override
  Future<void> refreshData() => initData();
  void verifyPin() async {
    final data =
        await ApiService.verifyPin(context, pin: int.parse(pinController.text));
    if (data.isSuccess) {
      pinController.clear();
      withdraw();
      context.pop();

      log("success");
    } else {
      pinController.clear();
      context.pop();
      log("error");
    }
  }

  withdraw() async {
    int amount = int.parse(amountController.text.replaceAll(",", ""));
    final data = await ApiService.withdraw(context, amount: amount);
    if (data.isSuccess) {
      showSuccess("Berhasil Withdraw");
      refreshData();
    } else {
      showError("Withdraw gagal, coba secara berkala");
    }
  }

  checkSaldoValid() {
    int amount = int.parse(amountController.text.replaceAll(",", ""));
    log(amount.toString());
    log(state.accountBalance!.balance!.toString());
    if (amount > state.accountBalance!.balance!) {
      showError("Melebihi saldo anda");
    } else {
      showPin(context);
    }
  }

  showPin(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text('Input Pin'),
            content: TextField(
              controller: pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              style: AppFont.large(context)!.copyWith(fontSize: 16),
              decoration: const InputDecoration(hintText: 'Masukan Pin'),
            ),
            actions: <Widget>[
              Container(
                height: 40,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: OutlinedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60))),
                        onPressed: () {
                          pinController.clear();
                          context.pop();
                        },
                        child: Text('Cancel')),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: ElevatedButton(
                    onPressed: () async {
                      verifyPin();
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
