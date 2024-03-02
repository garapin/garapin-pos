import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/engine/extensions/int.dart';
import 'package:pos/modules/cart/cubit/cart_cubit.dart';
import 'package:pos/modules/checkout/cubit/checkout_cubit.dart';
import 'package:pos/resources/resources.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/container_state_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../engine/base/app.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final List<String> subMethods;

  const PaymentMethodCard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
    required this.subMethods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                Align(
                  alignment: Alignment.center,
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
                // Image.asset(
                //   image,
                //   width: 100,
                //   height: 100,
                // ),
                // SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (subMethods.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: subMethods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(subMethods[index]),
                  onTap: () {
                    // Navigate to selected sub-method
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

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
            loading: SizedBox(),
            child: Container(
              height: baseHeight,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView(
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
                          child: Align(
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
                          height: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                                      cartCubit.state.invoces ?? "",
                                      style: AppFont.largeBold(context),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total pembayaran",
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
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        (state.paymentStatus == PaymentStatus.pending)
                            ? Column(
                                children: [
                                  Text("Payment Method",
                                      style: AppFont.largeBold(context)),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      cubit.doSelectPayment(
                                          PaymentMethod.qris,
                                          cartCubit.state.invoces!,
                                          cartCubit.state.cart!.totalPrice!);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: (state.paymentMethod !=
                                                  PaymentMethod.qris)
                                              ? Colors.grey
                                              : AppColor.appColor
                                                  .primary, // Warna border berdasarkan status (checked/unchecked)
                                          width: 4.0, // Ketebalan border
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Mengatur border radius
                                      ),
                                      child: Resources.images.paymentQris
                                          .image(), // Widget untuk menampilkan gambar
                                    ),
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
                                  SizedBox(height: 60),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          child: Container(
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black),
                                                onPressed: () {},
                                                child: Text("Print Receipt")),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          child: Container(
                                            height: 50,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColor
                                                        .appColor.primary),
                                                onPressed: () {
                                                  cartCubit.goToCheckout(
                                                      isCheckout: false);
                                                },
                                                child: Text("Done")),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                        SizedBox(height: 20),
                        (state.paymentMethod != PaymentMethod.qris)
                            ? SizedBox()
                            : Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: QrImageView(
                                      data: state.qrData!.qrString!,
                                      version: QrVersions.auto,
                                      size: 200.0,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Scan untuk lakukan pembayaran",
                                        style: AppFont.large(context)!
                                            .copyWith(fontSize: 18),
                                      ))
                                ],
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
