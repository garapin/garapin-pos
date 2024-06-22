import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:pos/engine/configs/environment.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_cubit.dart';
import 'package:pos/modules/auth/locked_account/cubit/locked_account_state.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/image_load.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LockedAccountPage extends StatefulWidget {
  final User user;
  const LockedAccountPage({super.key, required this.user});

  @override
  State<LockedAccountPage> createState() => _LockedAccountPageState();
}

class _LockedAccountPageState extends State<LockedAccountPage> {
  final ExpansionTileController? tileQrController = ExpansionTileController();
  final ExpansionTileController? tileVaController = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    Sessions.setDatabase(jsonEncode(widget.user.storeDatabaseName
        ?.where((e) =>
            e.name.toString() ==
            widget.user.storeDatabaseName!.first.name!.toString())
        .first));

    final blocLockedAccount = context.read<LockedAccountCubit>();
    blocLockedAccount.initData().then((value) {
      blocLockedAccount.createInvoice(widget.user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LockedAccountCubit, LockedAccountState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 140,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.appColor.primary,
                      width: 2.0,
                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total ",
                              style: AppFont.largeBold(context),
                            ),
                            Text(
                              state.amountPendingTransaction?.amount
                                      .currencyFormat(symbol: 'Rp.')
                                      .toString() ??
                                  "",
                              style: AppFont.largeBold(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fee ",
                              style: AppFont.largeBold(context),
                            ),
                            Text(
                              "Rp 0",
                              style: AppFont.largeBold(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Divider(),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Pembayaran ",
                              style: AppFont.largeBold(context),
                            ),
                            Text(
                              state.amountPendingTransaction?.amount
                                      .currencyFormat(symbol: 'Rp.')
                                      .toString() ??
                                  "",
                              style: AppFont.largeBold(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: (state.paymentStatus == PaymentStatus.pending)
                    ? Container(
                        height: 400,
                        child: ListView(
                          children: [
                            ExpansionTile(
                              title: Text(
                                "QRIS",
                                style: AppFont.largeBold(context),
                              ),
                              controller: tileQrController,
                              onExpansionChanged: (value) {
                                if (value) {
                                  tileVaController?.collapse();
                                  context
                                      .read<LockedAccountCubit>()
                                      .changePaymentMethod(PaymentMethod.none);
                                }
                              },
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: () {
                                      /// TODO: Payment QR
                                      context
                                          .read<LockedAccountCubit>()
                                          .doSelectPayment(
                                            PaymentMethod.qris,
                                            widget.user,
                                            state.invoices!.invoice!,
                                            state.amountPendingTransaction
                                                    ?.amount ??
                                                0,
                                          );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: (state.paymentMethod !=
                                                  PaymentMethod.qris)
                                              ? const Color.fromARGB(
                                                  255,
                                                  220,
                                                  220,
                                                  220,
                                                )
                                              : AppColor.appColor.primary,
                                          width: 4.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Resources.images.paymentQris.image(
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                "Virtual Account",
                                style: AppFont.largeBold(context),
                              ),
                              controller: tileVaController,
                              onExpansionChanged: (value) {
                                if (value) {
                                  tileQrController?.collapse();
                                  context
                                      .read<LockedAccountCubit>()
                                      .changePaymentMethod(PaymentMethod.none);
                                }
                              },
                              children: [
                                Wrap(
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
                                                bankCode: e.bank,
                                              );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (state.paymentMethod ==
                                                          PaymentMethod.va &&
                                                      state.virtualAccountResponse
                                                              ?.bankCode ==
                                                          e.bank)
                                                  ? AppColor.appColor.primary
                                                  : const Color.fromARGB(
                                                      255,
                                                      220,
                                                      220,
                                                      220,
                                                    ),
                                              width: 4.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                          ),
                                          child: ImageLoad(
                                            height: 50,
                                            imageUrl: Environment.showUrlImage(
                                              path: e.image ?? "",
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            SizedBox(
                              child: Builder(
                                builder: (context) {
                                  if (state.paymentMethod ==
                                      PaymentMethod.qris) {
                                    return Column(
                                      children: [
                                        Text(
                                          "Pembayaran QRIS",
                                          style: AppFont.largePrimary(context)!
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                        ),
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
                                            "Scan untuk lakukan pembayaran",
                                            style: AppFont.large(context)!
                                                .copyWith(fontSize: 18),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Expired at ${state.qrData?.expiresAt!.toddMMMyyyyHHmmss()}",
                                            style: AppFont.large(context)!
                                                .copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (state.paymentMethod ==
                                      PaymentMethod.va) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pembayaran Virtual Account",
                                          style: AppFont.largePrimary(context)!
                                              .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        ImageLoad(
                                          height: 120,
                                          imageUrl: Environment.showUrlImage(
                                            path: state.availablePayment
                                                    .where((element) =>
                                                        element.bank ==
                                                        state
                                                            .virtualAccountResponse
                                                            ?.bankCode)
                                                    .first
                                                    .image ??
                                                "",
                                          ),
                                        ),
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
                                          style: AppFont.medium(context),
                                        ),
                                        Text(
                                          "Expired at ${state.virtualAccountResponse?.expirationDate!.toddMMMyyyyHHmmss() ?? ""}",
                                          style: AppFont.medium(context),
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
                        ),
                      )
                    : Column(
                        children: [
                          Resources.images.paymentSuccess.image(
                            width: 170,
                            height: 170,
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
                          const SizedBox(height: 60),
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
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
