import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:pos/modules/dashboard/withdrawl/cubit/withdrawl_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/widgets/components/outline_form_text.dart';
import 'package:pos/widgets/widgets.dart';

import '../../../../themes/themes.dart';
import '../../../../widgets/components/outline_form_dropdown.dart';

// Fungsi untuk mem-mask nomor akun
String maskAccountNumber(String accountNumber) {
  if (accountNumber.length < 3) {
    return accountNumber;
  }
  final maskedPart = accountNumber.substring(0, accountNumber.length - 3);
  return '$maskedPart***';
}

Color statusWithDraw(String status) {
  switch (status.toUpperCase()) {
    // Convert status to uppercase to avoid case-sensitive issues
    case "SUCCESSED":
      return AppColor.appColor.success;
    case "ACCEPTED":
      return AppColor.appColor.active;
    case "FAILED":
      return AppColor.appColor.error;
    case "EXPIRED":
      return Colors.grey;
    case "REFUNDED":
      return AppColor.appColor.warning;
    default:
      return Colors.grey; // Default color for unknown status
  }
}

class WithdrawlPage extends StatelessWidget {
  const WithdrawlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitDashboard = context.read<DashboardCubit>();
    final cubit = context.read<WithdrawlCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<WithdrawlCubit, WithdrawlState>(
        builder: (context, state) {
          return ContainerStateHandler(
              refresherOptions: cubit.defaultRefresh,
              status: state.status,
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
                  width: baseWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              Text(
                                "Withdraw",
                                style: AppFont.largeBold(context),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Resources.images.accountBalance.image(height: 45),
                              const SizedBox(height: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.accountBalance?.balance
                                              .currencyFormat(symbol: "Rp.") ??
                                          "",
                                      style: AppFont.largeBold(context)!
                                          .copyWith(fontSize: 24),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "Saldo",
                                      style: AppFont.mediumBold(context)!
                                          .copyWith(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              state.accountBalance?.bank?.accountNumber != null
                                  ? InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: baseWidth,
                                        height: 60,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          26))),
                                          onPressed: () {
                                            cubitDashboard.changePage(3);
                                          },
                                          child: Text(
                                            "Bank account kosong, Tambahkan bank account di profile untuk bisa withdraw",
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      height: 100,
                                      width: baseWidth,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(36)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: ImageLoad(
                                                height: 100,
                                                fit: BoxFit.contain,
                                                errorWidget: const SizedBox(),
                                                placeholderWidget:
                                                    const SizedBox(),
                                                imageUrl: Environment.showUrlImage(
                                                    path: state.accountBalance !=
                                                            null
                                                        ? state.availablePayment
                                                                .where((element) =>
                                                                    element
                                                                        .bank ==
                                                                    state
                                                                        .accountBalance!
                                                                        .bank!
                                                                        .bankName)
                                                                .first
                                                                .image ??
                                                            ""
                                                        : "")),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.accountBalance?.bank
                                                        ?.holderName ??
                                                    "",
                                                style:
                                                    AppFont.largeBold(context)!
                                                        .copyWith(fontSize: 18),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                state.accountBalance?.bank
                                                        ?.bankName ??
                                                    "",
                                                style: AppFont.medium(context)!
                                                    .copyWith(fontSize: 18),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                maskAccountNumber(state
                                                        .accountBalance
                                                        ?.bank
                                                        ?.accountNumber
                                                        ?.toString() ??
                                                    ''),
                                                style: AppFont.medium(context)!
                                                    .copyWith(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                              const SizedBox(height: 24),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Penarikan",
                                  style: AppFont.mediumBold(context)!
                                      .copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: cubit.amountController,
                                onChanged: (value) {
                                  final NumberFormat _currencyFormat =
                                      NumberFormat.currency(
                                          symbol: '', decimalDigits: 0);
                                  String text = value.replaceAll(
                                      RegExp(r'[^0-9]'),
                                      ''); // Menghapus karakter non-digit
                                  if (text.isNotEmpty) {
                                    String formatted = _currencyFormat.format(
                                        int.parse(
                                            text)); // Format sebagai mata uang
                                    cubit.amountController.value =
                                        cubit.amountController.value.copyWith(
                                      text: formatted,
                                      selection: TextSelection.collapsed(
                                          offset: formatted.length),
                                    );
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Hanya angka yang diperbolehkan
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Masukan jumlah penarikan',
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.none,
                                          width: 0.5,
                                          color: Colors.grey),
                                      borderRadius: BorderRadius.circular(36)),
                                ),
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                height: 55,
                                width: baseWidth,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(36),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: state.accountBalance
                                                      ?.bank?.accountNumber ==
                                                  null
                                              ? Colors.grey
                                              : AppColor.appColor.primary),
                                      onPressed: () {
                                        if (state.accountBalance?.bank
                                                ?.accountNumber ==
                                            null) {
                                          ShowNotify.error(context,
                                              msg: "Bank account harus diisi");
                                        } else {
                                          cubit.checkSaldoValid();
                                        }

                                        // cubit.showPin(context);
                                      },
                                      child: Text(
                                        "Withdraw",
                                        style: AppFont.largeBold(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 18),
                                      )),
                                ),
                              ),
                              SizedBox(height: 12),
                              Divider(thickness: 1),
                              SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 260,
                                  child: FormBuilderDateRangePicker(
                                      initialValue: DateTimeRange(
                                          start: DateTime.now().subtract(
                                              const Duration(days: 7)),
                                          end: DateTime.now()),
                                      onChanged: (value) {
                                        cubit
                                            .getDateTimeRange(value.toString());
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20),
                                        suffixIcon:
                                            const Icon(Icons.date_range),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(58),
                                        ),
                                        hintStyle:
                                            const TextStyle(fontSize: 16),
                                        filled: true,
                                        fillColor: const Color(0xffffffff),
                                      ),
                                      name: "date",
                                      firstDate: DateTime.now()
                                          .subtract(const Duration(days: 1000)),
                                      lastDate: DateTime.now()),
                                ),
                              ),
                              SizedBox(height: 12),
                              (state.history.isEmpty)
                                  ? Column(
                                      children: [
                                        Center(
                                          child: Text(
                                              "Tidak ada data history wothdraw"),
                                        ),
                                        Center(
                                          child: Text(
                                              "${state.startDate} - ${state.endDate}"),
                                        ),
                                      ],
                                    )
                                  : ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var his = state.history[index];
                                        return ListTile(
                                            trailing: Text(his.status ?? "",
                                                style: AppFont.mediumBold(
                                                        context)!
                                                    .copyWith(
                                                        color: statusWithDraw(
                                                            his.status ?? ""))),
                                            subtitle: Text(his.created
                                                    ?.toddMMMyyyyHHmmss() ??
                                                ""),
                                            title: Text(
                                                his.amount
                                                    .toString()
                                                    .currencyDot(symbol: "Rp."),
                                                style:
                                                    AppFont.largeBold(context)!));
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox();
                                      },
                                      itemCount: state.history.length)
                            ],
                          ),
                        ),
                      ]),
                ),
              ));
        },
      ),
    );
  }
}
