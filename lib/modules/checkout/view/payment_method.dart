import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../widgets/components/pair_bluethooth.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key, required this.cartCubit});
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(context, cartCubit),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          return ContainerStateHandler(
            status: state.status,
            loading: const SizedBox(),
            child: Container(
              height: baseHeight,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView(
                controller: cubit.scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.timer?.cancel();
                            cubit.cancelCheckout(cartCubit.state.invoces!);
                            cartCubit.goToCheckout(isCheckout: false);
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Text(
                          "Pilih pembayaran",
                          style: AppFont.largeBold(context)!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: baseWidth,
                          height: 140,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.appColor
                                  .primary, // Warna border berdasarkan status (checked/unchecked)
                              width: 2.0, // Ketebalan border
                            ),
                            borderRadius: BorderRadius.circular(
                                10.0), // Mengatur border radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order",
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      state.invoices?.invoiceLabel ?? "",
                                      style: AppFont.largeBold(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      state.invoices?.product?.totalPrice
                                              .currencyFormat(symbol: 'Rp.')
                                              .toString() ??
                                          "",
                                      style: AppFont.largeBold(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Fee",
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      state.invoices?.feeGarapin
                                              .currencyFormat(symbol: 'Rp.')
                                              .toString() ??
                                          "0",
                                      style: AppFont.largeBold(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Divider(),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Pembayaran",
                                      style: AppFont.largeBold(context),
                                    ),
                                    Text(
                                      state.invoices?.totalWithFee
                                              .currencyFormat(symbol: 'Rp.')
                                              .toString() ??
                                          "0",
                                      style: AppFont.largeBold(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        (state.paymentStatus == PaymentStatus.pending)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExpansionTile(
                                    controller: cubit.tileQrController,
                                    onExpansionChanged: (value) {
                                      if (value) {
                                        cubit.tileVaController?.collapse();
                                        cubit.changePaymentMethod(
                                            PaymentMethod.none);
                                      }
                                    },
                                    title: Text(
                                      "QRIS",
                                      style: AppFont.largeBold(context),
                                    ),
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () {
                                            cubit.doSelectPayment(
                                                PaymentMethod.qris,
                                                cartCubit.state.invoces!,
                                                cartCubit
                                                    .state.cart!.totalPrice!);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: (state.paymentMethod !=
                                                        PaymentMethod.qris)
                                                    ? const Color.fromARGB(
                                                        255, 220, 220, 220)
                                                    : AppColor.appColor
                                                        .primary, // Warna border berdasarkan status (checked/unchecked)
                                                width: 4.0, // Ketebalan border
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                  10.0), // Mengatur border radius
                                            ),
                                            child: Resources.images.paymentQris
                                                .image(
                                                    height:
                                                        30), // Widget untuk menampilkan gambar
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                  ExpansionTile(
                                      onExpansionChanged: (value) {
                                        if (value) {
                                          cubit.tileQrController?.collapse();
                                          cubit.changePaymentMethod(
                                              PaymentMethod.none);
                                        }
                                      },
                                      controller: cubit.tileVaController,
                                      enabled: true,
                                      title: Text(
                                        "Virtual Account",
                                        style: AppFont.largeBold(context),
                                      ),
                                      children: [
                                        Wrap(
                                          spacing: 12,
                                          runSpacing: 12,
                                          alignment: WrapAlignment.start,
                                          children:
                                              state.availablePayment.map((e) {
                                            return InkWell(
                                              onTap: () {
                                                cubit.doSelectPayment(
                                                    PaymentMethod.va,
                                                    cartCubit.state.invoces!,
                                                    cartCubit.state.cart!
                                                        .totalPrice!,
                                                    bankCode: e.bank);
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
                                                            220), // Warna border berdasarkan status (checked/unchecked)
                                                    width:
                                                        4.0, // Ketebalan border
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0), // Mengatur border radius
                                                ),
                                                child: ImageLoad(
                                                    height: 50,
                                                    imageUrl: Environment
                                                        .showUrlImage(
                                                            path: e.image ??
                                                                "")), // Widget untuk menampilkan gambar
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(height: 20),
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: TextButton(
                                        onPressed: () {
                                          cubit.tileVaController?.collapse();
                                          cubit.tileQrController?.collapse();
                                          cubit.changePaymentMethod(
                                              PaymentMethod.cash);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Cash",
                                              style: AppFont.largeBold(context),
                                            ),
                                            Icon((state.paymentMethod ==
                                                    PaymentMethod.cash)
                                                ? Icons
                                                    .keyboard_arrow_up_rounded
                                                : Icons
                                                    .keyboard_arrow_down_rounded)
                                          ],
                                        )),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Resources.images.paymentSuccess.image(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Pembayaran Sukses",
                                      style: AppFont.largePrimary(context)!
                                          .copyWith(
                                              fontSize: 22,
                                              color: AppColor.appColor.success),
                                    ),
                                  ),
                                  state.cashResponse?.refund != null &&
                                          state.cashResponse?.refund != 0
                                      ? Text(
                                          state.cashResponse!.refund
                                              .currencyFormat(
                                                  symbol: "Kembalian Rp."),
                                          style: AppFont.largePrimary(context)!
                                              .copyWith(fontSize: 20),
                                        )
                                      : SizedBox(),
                                  const SizedBox(height: 60),
                                  BluetoothPrintExample(
                                    logoUrl:
                                        state.store?.store?.storeImage ?? "",
                                    noInvoices:
                                        state.invoices?.invoiceLabel ?? "",
                                    item: state.invoices?.product?.items ?? [],
                                    date: DateTime.parse(
                                            state.invoices!.paymentDate!)
                                        .toddMMMyyyyHHmmss(),
                                    nameMerchant:
                                        state.store?.store?.storeName ?? "",
                                    totalPrice: state
                                        .invoices!.product!.totalPrice
                                        .currencyFormat(symbol: "Rp."),
                                    paymentMethod:
                                        state.invoices?.paymentMethod ?? "",
                                  ),
                                  SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      height: 50,
                                      width: baseWidth,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.appColor.primary),
                                          onPressed: () {
                                            cartCubit.goToCheckout(
                                                isCheckout: false);
                                          },
                                          child: const Text("Done")),
                                    ),
                                  ),
                                ],
                              ),
                        Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          width: baseWidth,
                          child: Builder(
                            builder: (context) {
                              if (state.paymentMethod == PaymentMethod.qris) {
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
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Expired at ${state.qrData?.expiresAt!.toddMMMyyyyHHmmss()}",
                                          style: AppFont.large(context)!
                                              .copyWith(fontSize: 18),
                                        ))
                                  ],
                                );
                              } else if (state.paymentMethod ==
                                  PaymentMethod.va) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pembayaran Virtual Account",
                                      style: AppFont.largePrimary(context)!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 16),
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
                                                "")), // Widget untuk menampilkan gambar

                                    Text(
                                      state.virtualAccountResponse
                                              ?.accountNumber ??
                                          "",
                                      style: AppFont.success(context)!.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
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
                              } else if (state.paymentMethod ==
                                  PaymentMethod.cash) {
                                return Column(children: [
                                  Text(
                                    "Pembayaran Cash",
                                    style: AppFont.largePrimary(context)!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          final text = newValue.text;
                                          final newText = (int.parse(text)
                                              .currencyFormat());
                                          return TextEditingValue(
                                            text: newText,
                                            selection: TextSelection.collapsed(
                                                offset: newText.length),
                                          );
                                        }),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: cubit.amountCashController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(26))),
                                          label: Text(
                                            "Masukan jumlah uang",
                                          )),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(26),
                                      child: SizedBox(
                                        width: baseWidth,
                                        height: 50,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              String removeCurrency = cubit
                                                  .amountCashController.text
                                                  .replaceAll(
                                                      RegExp(r'[^\d]'), '');
                                              cubit.doSelectPayment(
                                                PaymentMethod.cash,
                                                cartCubit.state.invoces!,
                                                int.parse(removeCurrency),
                                              );
                                            },
                                            child: const Text(
                                                "Konfirmasi Bayar Cash")),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ]);
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
