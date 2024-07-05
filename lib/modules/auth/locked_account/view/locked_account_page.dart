import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_cubit.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_state.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/image_load.dart';
import 'package:pos/widgets/components/notify.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LockedAccountPage extends StatefulWidget {
  final User user;
  final String selectedDB;
  final bool fromDashboard;
  const LockedAccountPage(
      {super.key,
      required this.user,
      required this.selectedDB,
      this.fromDashboard = false});

  @override
  State<LockedAccountPage> createState() => _LockedAccountPageState();
}

class _LockedAccountPageState extends State<LockedAccountPage> {
  final ExpansionTileController? tileQrController = ExpansionTileController();
  final ExpansionTileController? tileVaController = ExpansionTileController();

  PaymentMethod selectedPayment = PaymentMethod.qris;

  @override
  void initState() {
    super.initState();
    if (!widget.fromDashboard) {
      print("SET SESSION");
      Sessions.setDatabase(
        jsonEncode(
          widget.user.storeDatabaseName
              ?.where((e) => e.name.toString() == widget.selectedDB)
              .first,
        ),
      );
    }

    final blocLockedAccount = context.read<LockedAccountCubit>();
    blocLockedAccount.initData().then((value) {
      if (blocLockedAccount.state.amountPendingTransaction!.amount! > 0) {
        print("BBIKIN INVOICE");
        print(widget.user);
        blocLockedAccount.createInvoice(widget.user, targetDatabase: widget.selectedDB);
      } else {
        ShowNotify.success(context, msg: "Tidak ada transaksi pending");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<LockedAccountCubit, LockedAccountState>(
            builder: (context, state) {
              return (state.paymentStatus == PaymentStatus.pending)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Oops Akun anda telah di Lock Sementara",
                            style: AppFont.largeBold(context)
                                ?.copyWith(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            "Selesaikan pembayaran agar dapat menggunakan layanan kami kembali",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor("#F8F9FD"),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Pembayaran ",
                                      style: AppFont.large(context),
                                    ),
                                    Text(
                                      state.amountPendingTransaction?.amount
                                              .currencyFormat(symbol: 'Rp.')
                                              .toString() ??
                                          "",
                                      style: AppFont.largeBold(context)
                                          ?.copyWith(
                                              fontSize: 19,
                                              color: HexColor("#713F97")),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Pilih metode Pembayaran",
                              style: AppFont.largeBold(context)?.copyWith(
                                fontSize: 15,
                                color: HexColor("#828487"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: baseWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: HexColor("#E4E4E4"),
                                  style: BorderStyle.solid,
                                  width: 0.80,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<PaymentMethod>(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  value: selectedPayment,
                                  items: const [
                                    DropdownMenuItem(
                                      value: PaymentMethod.qris,
                                      child: Text("QRIS"),
                                    ),
                                    DropdownMenuItem(
                                      value: PaymentMethod.va,
                                      child: Text("Virtual Account"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPayment = value!;
                                    });
                                    if (value == PaymentMethod.qris) {
                                      context
                                          .read<LockedAccountCubit>()
                                          .doSelectPayment(
                                            PaymentMethod.qris,
                                            widget.user,
                                            state.invoices!.invoice!,
                                            state.amountPendingTransaction
                                                    ?.amount ??
                                                0,
                                          widget.selectedDB,
                                          );
                                    } else if (value == PaymentMethod.va) {
                                      // context
                                      //     .read<LockedAccountCubit>()
                                      //     .changePaymentMethod(PaymentMethod.va);
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (selectedPayment == PaymentMethod.va)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Wrap(
                                      spacing: 12,
                                      runSpacing: 12,
                                      alignment: WrapAlignment.start,
                                      children: state.availablePayment.map(
                                        (e) {
                                          return InkWell(
                                            onTap: () {
                                              /// TODO: Payment VA
                                              context
                                                  .read<LockedAccountCubit>()
                                                  .doSelectPayment(
                                                    PaymentMethod.va,
                                                    widget.user,
                                                    state.invoices!.invoice!,
                                                    state.amountPendingTransaction
                                                            ?.amount ??
                                                        0,
                                                widget.selectedDB,
                                                    bankCode: e.bank,
                                                  );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: (state.paymentMethod ==
                                                              PaymentMethod
                                                                  .va &&
                                                          state.virtualAccountResponse
                                                                  ?.bankCode ==
                                                              e.bank)
                                                      ? AppColor
                                                          .appColor.primary
                                                      : const Color.fromARGB(
                                                          255,
                                                          220,
                                                          220,
                                                          220,
                                                        ),
                                                  width: 4.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.0,
                                                ),
                                              ),
                                              child: ImageLoad(
                                                height: 50,
                                                imageUrl:
                                                    Environment.showUrlImage(
                                                  path: e.image ?? "",
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              child: Builder(
                                builder: (context) {
                                  if (state.paymentMethod ==
                                          PaymentMethod.qris &&
                                      selectedPayment == PaymentMethod.qris) {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: QrImageView(
                                            data: state.qrData!.qrString!,
                                            version: QrVersions.auto,
                                            size: 200.0,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Silahkan Scan QR diatas",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Expired at ${state.qrData?.expiresAt!.toddMMMyyyyHHmmss()}",
                                            style: AppFont.large(context)!
                                                .copyWith(
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (state.paymentMethod ==
                                          PaymentMethod.va &&
                                      selectedPayment == PaymentMethod.va) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 40),
                                        // Text(
                                        //   "Pembayaran Virtual Account",
                                        //   style: AppFont.largePrimary(context)!
                                        //       .copyWith(
                                        //     fontSize: 18,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                        // const SizedBox(height: 16),
                                        // ImageLoad(
                                        //   height: 120,
                                        //   imageUrl: Environment.showUrlImage(
                                        //     path: state.availablePayment
                                        //             .where((element) =>
                                        //                 element.bank ==
                                        //                 state
                                        //                     .virtualAccountResponse
                                        //                     ?.bankCode)
                                        //             .first
                                        //             .image ??
                                        //         "",
                                        //   ),
                                        // ),
                                        Text(
                                          state.virtualAccountResponse
                                                  ?.accountNumber ??
                                              "",
                                          style: AppFont.success(context)!
                                              .copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Merchant: ${state.virtualAccountResponse?.name ?? ""}",
                                          style: AppFont.largeBold(context)!
                                              .copyWith(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "Expired at ${state.virtualAccountResponse?.expirationDate!.toddMMMyyyyHHmmss() ?? ""}",
                                          style: AppFont.largeBold(context)!
                                              .copyWith(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Resources.images.paymentSuccess.image(
                          width: 140,
                          height: 140,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Pembayaran Sukses",
                            style: AppFont.largePrimary(context)!.copyWith(
                              fontSize: 22,
                              color: AppColor.appColor.success,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox(
                            height: 50,
                            width: baseWidth,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.appColor.primary,
                              ),
                              onPressed: () async {
                                final GoogleSignInAccount? s =
                                    await GoogleSignIn().signOut();
                                Sessions.clear().then(
                                    (value) => context.go(RouteNames.root));
                                context.pop();
                              },
                              child: const Text("Done"),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
