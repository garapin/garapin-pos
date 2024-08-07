import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/detail_transaction_product_cubit.dart';
import 'package:pos/modules/report/cubit/report_detail_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class DetailTransactionProduct extends StatelessWidget {
  const DetailTransactionProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<DetailTransactionProductCubit,
          DetailTransactionProductState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: baseWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "invoice ${state.invoice?.invoiceLabel}",
                                    style: AppFont.largeBold(context),
                                  ),
                                  Text(
                                    "TRX ${state.trxName?.toUpperCase()}",
                                    style: AppFont.largeBold(context)!
                                        .copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "${state.invoice?.createdAt!.toddMMMyyyyHHmm()}",
                            style: AppFont.largeBold(context),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Foto',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Nama',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Jumlah Item',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Harga',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Diskon',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Total Harga',
                                  textAlign: TextAlign.center,
                                  style: AppFont.largeBold(context))),
                        ]),
                    const SizedBox(height: 12),
                    const Divider(thickness: 2),
                    SizedBox(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.invoice?.product?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = state.invoice?.product?.items?[index];
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 40,
                                    width: 40,
                                    // flex: 2,
                                    child: ImageLoad(
                                      imageUrl: Environment.showUrlImage(
                                          path: item?.product?.image ?? ""),
                                      errorWidget: ImageLoad(
                                        imageUrl: Environment.showUrlImage(
                                            path: item?.product?.icon ?? ""),
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                    item?.product?.name ?? "",
                                    style: AppFont.medium(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(item?.quantity.toString() ?? "-",
                                      textAlign: TextAlign.center,
                                      style: AppFont.medium(context)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      item?.product?.price
                                              .currencyFormat(symbol: "Rp.") ??
                                          "",
                                      style: AppFont.medium(context)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      item?.product?.discount
                                              .currencyFormat(symbol: "Rp.") ??
                                          "",
                                      style: AppFont.medium(context)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      ((item!.product!.price! -
                                                  item.product!.discount!) *
                                              item.quantity!)
                                          .toString()
                                          .currencyDot(symbol: "Rp."),
                                      style: AppFont.medium(context)),
                                ),
                              ]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Divider(thickness: 2),
                          );
                        },
                      ),
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Fee Bank",
                                  style: AppFont.largeBold(context)!
                                      .copyWith(color: AppColor.appColor.error),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Tax",
                                  style: AppFont.largeBold(context)!
                                      .copyWith(color: AppColor.appColor.error),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Total",
                                  style: AppFont.largeBold(context)!.copyWith(
                                      color: AppColor.appColor.success),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "- ${int.parse(state.fee ?? "0").toString().currencyDot(symbol: "Rp.")}",
                                  style: AppFont.largeBold(context)!
                                      .copyWith(color: AppColor.appColor.error),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "- ${int.parse(state.tax ?? "0").currencyFormat(symbol: "Rp.")}",
                                  style: AppFont.largeBold(context)!
                                      .copyWith(color: AppColor.appColor.error),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  (state.invoice?.product?.totalPrice == null)
                                      ? ""
                                      : (state.invoice!.product!.totalPrice! -
                                              int.parse(state.fee ?? "0") -
                                              int.parse(state.tax ?? "0"))
                                          .currencyFormat(symbol: "Rp."),
                                  style: AppFont.largeBold(context)!.copyWith(
                                      color: AppColor.appColor.success),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
