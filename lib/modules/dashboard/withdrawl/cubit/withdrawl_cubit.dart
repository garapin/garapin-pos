import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/api/services.dart';
import 'package:pos/data/models/base/account_balance.dart';
import 'package:pos/data/models/base/withdraw_history.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/engine/helpers/options.dart';
import 'package:pos/modules/dashboard/withdrawl/view/withdrawl.dart';
import 'package:pos/themes/themes.dart';

import '../../../../data/models/base/available_payment.dart';
import '../../../../widgets/components/image_load.dart';

part 'withdrawl_state.dart';
part 'withdrawl_cubit.freezed.dart';

class WithdrawlCubit extends BaseCubit<WithdrawlState> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  WithdrawlCubit(BuildContext context) : super(context, const WithdrawlState());

  @override
  Future<void> initData() async {
    loadingState();
    amountController.clear();
    pinController.clear;
    getAvailablePayment();
    getHistory();
    getBalance();
  }

  getBalance() async {
    final data = await ApiService.getAccountBalane(context);
    if (data.isSuccess) {
      emit(state.copyWith(
          status: DataStateStatus.success,
          accountBalance: data.data,
          endDate: DateTime.now().toyyyyMMdd(),
          startDate: DateTime.now().subtract(Duration(days: 7)).toyyyyMMdd()));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  getHistory() async {
    final data = await ApiService.withdrawHistory(context,
        startDate: state.startDate!, endDate: state.endDate!);
    if (data.isSuccess) {
      emit(state.copyWith(status: DataStateStatus.success, history: data.data));
    } else {
      emit(state.copyWith(status: DataStateStatus.error));
    }
    finishRefresh(state.status);
  }

  void getDateTimeRange(String datetimeRange) {
    String dateTimeRange = datetimeRange;
    print(dateTimeRange);
    List<String> dates = dateTimeRange.split(" - ");
    DateTime startDate = DateTime.parse(dates[0]);
    DateTime endDate = DateTime.parse(dates[1]).add(Duration(days: 1));
    emit(state.copyWith(
        startDate: startDate.toString(), endDate: endDate.toString()));
    getHistory();
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
    } else {
      pinController.clear();
      context.pop();
    }
  }

  withdraw() async {
    int amount = int.parse(amountController.text.replaceAll(",", ""));
    final data = await ApiService.withdraw(context,
        amount: amount,
        channelColde: state.availablePayment
            .where((element) =>
                element.bank == state.accountBalance!.bank!.bankName!)
            .first
            .code!);
    if (data.isSuccess) {
      showSuccess("Berhasil Withdraw");
      refreshData();
    } else {
      showError("Withdraw gagal, coba secara berkala");
    }
  }

  checkSaldoValid() {
    int amount = int.parse(amountController.text.replaceAll(",", ""));
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
            title: Text(
              'Konfirmasi Withdraw',
              style: AppFont.large(context)!.copyWith(fontSize: 20),
            ),
            content: SizedBox(
              width: 300,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lanjutkan withdraw sebesar ${amountController.text.currencyDot(symbol: "Rp.")}",
                    style: AppFont.large(context)!.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 70,
                    width: baseWidth,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(36)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ImageLoad(
                              height: 100,
                              fit: BoxFit.contain,
                              errorWidget: const SizedBox(),
                              placeholderWidget: const SizedBox(),
                              imageUrl: Environment.showUrlImage(
                                  path: state.accountBalance != null
                                      ? state.availablePayment
                                              .where((element) =>
                                                  element.bank ==
                                                  state.accountBalance!.bank!
                                                      .bankName)
                                              .first
                                              .image ??
                                          ""
                                      : "")),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.accountBalance?.bank?.holderName ?? "",
                              style: AppFont.largeBold(context)!
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.accountBalance?.bank?.bankName ?? "",
                              style: AppFont.medium(context)!
                                  .copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              maskAccountNumber(state
                                      .accountBalance?.bank?.accountNumber
                                      ?.toString() ??
                                  ''),
                              style: AppFont.medium(context)!
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //  TextField(
            //   controller: pinController,
            //   obscureText: true,
            //   keyboardType: TextInputType.number,
            //   textAlign: TextAlign.center,
            //   maxLength: 6,
            //   style: AppFont.large(context)!.copyWith(fontSize: 16),
            //   decoration: const InputDecoration(hintText: 'Masukan Pin'),
            // ),
            actions: <Widget>[
              Container(
                height: 40,
                width: 155,
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
                width: 155,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: ElevatedButton(
                    onPressed: () async {
                      // verifyPin();
                      withdraw();
                      context.pop();
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
