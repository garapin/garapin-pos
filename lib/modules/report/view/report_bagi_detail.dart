import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/data/models/base/total_bagi.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/report_detail_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class ReportBagiDretail extends StatelessWidget {
  const ReportBagiDretail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<ReportDetailCubit, ReportDetailState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "invoice ${state.split?.split?.invoice?.split("&&")[0]}",
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${state.split?.split?.createdAt!.toddMMMyyyyHHmmss()}",
                                    style: AppFont.largeBold(context),
                                  ),
                                ),
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
                                  child: Text('Type',
                                      style: AppFont.largeBold(context))),
                              Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text('Target',
                                      style: AppFont.largeBold(context))),
                              Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text('Bagi-bagi Biaya',
                                      style: AppFont.largeBold(context))),
                              Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text('Bagi-Bagi pendapatan',
                                      style: AppFont.largeBold(context))),
                            ]),
                        const SizedBox(height: 12),
                        const Divider(thickness: 2),
                        SizedBox(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.split?.split?.routes?.length ?? 0,
                            itemBuilder: (context, index) {
                              var item = state.split?.split?.routes?[index];
                              return (state.store?.store?.merChantRole ==
                                      "SUPP")
                                  ? (item?.referenceId !=
                                          Sessions.getDatabaseModel()?.name)
                                      ? const SizedBox()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: baseWidth / 7,
                                                  child: Text(item?.role ?? "",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: AppFont.medium(
                                                          context))),
                                              Container(
                                                alignment: Alignment.center,
                                                width: baseWidth / 7,
                                                child: Text(
                                                  (item?.target == "Garapin")
                                                      ? "Bagi-Bagi Pos"
                                                      : item?.target ?? "",
                                                  style:
                                                      AppFont.medium(context),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: baseWidth / 7,
                                                child: Text(
                                                    item?.fee?.currencyFormat(
                                                            symbol: "Rp.") ??
                                                        "-",
                                                    textAlign: TextAlign.center,
                                                    style: AppFont.medium(
                                                        context)),
                                              ),
                                              (item?.role == "TRX")
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: baseWidth / 7,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              item?.flatAmount
                                                                      .currencyFormat(
                                                                          symbol:
                                                                              "Rp") ??
                                                                  "",
                                                              style: AppFont
                                                                  .medium(
                                                                      context)),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            "- ${state.fee.toString().currencyDot(symbol: "Rp.")}",
                                                            style: AppFont
                                                                    .medium(
                                                                        context)!
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .appColor
                                                                        .error),
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            "- ${state.tax.toString().currencyDot(symbol: "Rp.")}",
                                                            style: AppFont
                                                                    .medium(
                                                                        context)!
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .appColor
                                                                        .error),
                                                          ),
                                                          const SizedBox(
                                                              height: 4),
                                                          Text(
                                                            (state
                                                                        .invoice
                                                                        ?.product
                                                                        ?.totalPrice ==
                                                                    null)
                                                                ? ""
                                                                : (item!.flatAmount! -
                                                                        (int.parse(state.fee ??
                                                                                "0") +
                                                                            int.parse(state.tax ??
                                                                                "0")))
                                                                    .currencyFormat(
                                                                        symbol:
                                                                            "Rp."),
                                                            style: AppFont
                                                                    .medium(
                                                                        context)!
                                                                .copyWith(
                                                                    color: AppColor
                                                                        .appColor
                                                                        .success),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: baseWidth / 7,
                                                      child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          item?.flatAmount
                                                                  .currencyFormat(
                                                                      symbol:
                                                                          "Rp") ??
                                                              "",
                                                          style: AppFont.medium(
                                                              context)),
                                                    ),
                                            ])
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                          Container(
                                              alignment: Alignment.center,
                                              width: baseWidth / 7,
                                              child: Text(item?.role ?? "",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      AppFont.medium(context))),
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text(
                                              (item?.target == "Garapin")
                                                  ? "Bagi-Bagi Pos"
                                                  : item?.target ?? "",
                                              style: AppFont.medium(context),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text(
                                                item?.fee?.currencyFormat(
                                                        symbol: "Rp.") ??
                                                    "-",
                                                textAlign: TextAlign.center,
                                                style: AppFont.medium(context)),
                                          ),
                                          (item?.role == "TRX")
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  width: baseWidth / 7,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          item?.flatAmount
                                                                  .currencyFormat(
                                                                      symbol:
                                                                          "Rp") ??
                                                              "",
                                                          style: AppFont.medium(
                                                              context)),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        "fee bank - ${state.fee.toString().currencyDot(symbol: "Rp.")}",
                                                        style: AppFont.medium(
                                                                context)!
                                                            .copyWith(
                                                                color: AppColor
                                                                    .appColor
                                                                    .error),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        "Tax - ${state.tax.toString().currencyDot(symbol: "Rp.")}",
                                                        style: AppFont.medium(
                                                                context)!
                                                            .copyWith(
                                                                color: AppColor
                                                                    .appColor
                                                                    .error),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        (state.invoice?.product
                                                                    ?.totalPrice ==
                                                                null)
                                                            ? ""
                                                            : (item!.flatAmount! -
                                                                    (int.parse(state.fee ??
                                                                            "0") +
                                                                        int.parse(state.tax ??
                                                                            "0")))
                                                                .currencyFormat(
                                                                    symbol:
                                                                        "Rp."),
                                                        style: AppFont.medium(
                                                                context)!
                                                            .copyWith(
                                                                color: AppColor
                                                                    .appColor
                                                                    .success),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  alignment: Alignment.center,
                                                  width: baseWidth / 7,
                                                  child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      item?.flatAmount
                                                              .currencyFormat(
                                                                  symbol:
                                                                      "Rp") ??
                                                          "",
                                                      style: AppFont.medium(
                                                          context)),
                                                ),
                                        ]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              var item = state.split?.split?.routes?[index];

                              return (state.store?.store?.merChantRole ==
                                      "SUPP")
                                  ? (item?.referenceId !=
                                          Sessions.getDatabaseModel()?.name)
                                      ? const SizedBox()
                                      : const Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 6),
                                          child: Divider(thickness: 2),
                                        )
                                  : const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Divider(thickness: 2));
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(thickness: 2),
                        const SizedBox(height: 15),
                        (state.invoice?.feeGarapin == null ||
                                state.invoice?.feeGarapin == 0)
                            ? const SizedBox()
                            : (state.store?.store?.merChantRole == "SUPP")
                                ? const SizedBox()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text("CUST",
                                                textAlign: TextAlign.center,
                                                style:
                                                    AppFont.medium(context))),
                                        Container(
                                          alignment: Alignment.center,
                                          width: baseWidth / 7,
                                          child: Text(
                                            "Customer",
                                            style: AppFont.medium(context),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: baseWidth / 7,
                                          child: Text(
                                              state.invoice?.feeGarapin
                                                      .toString() ??
                                                  "0",
                                              textAlign: TextAlign.center,
                                              style: AppFont.medium(context)),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: baseWidth / 7,
                                          child: Text(
                                              textAlign: TextAlign.center,
                                              "-",
                                              style: AppFont.medium(context)),
                                        )
                                      ]),
                        const SizedBox(height: 15),
                        (state.invoice?.feeGarapin == null ||
                                state.invoice?.feeGarapin == 0)
                            ? const SizedBox()
                            : (state.store?.store?.merChantRole == "SUPP")
                                ? const SizedBox()
                                : const Divider(thickness: 2),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            width: baseWidth,
                            child: (state.store?.store?.merChantRole == "SUPP")
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("Total Bagi-Bagi Pendapatan",
                                              style:
                                                  AppFont.mediumBold(context)),
                                          const SizedBox(width: 12),
                                          Text(
                                            ((state.split?.split?.routes
                                                            ?.map((e) =>
                                                                e.flatAmount)
                                                            .reduce((value,
                                                                    element) =>
                                                                value! +
                                                                element!) ??
                                                        0) -
                                                    (int.parse(
                                                            state.fee ?? '0') +
                                                        (int.parse(
                                                            state.tax ?? '0'))))
                                                .toString()
                                                .currencyDot(symbol: "Rp."),
                                            textAlign: TextAlign.center,
                                            style: AppFont.mediumBold(context),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("Total Bagi-Bagi Biaya",
                                              style:
                                                  AppFont.mediumBold(context)),
                                          const SizedBox(width: 12),
                                          // harus dibuka
                                          Builder(builder: (context) {
                                            int totalBagi = state
                                                    .split?.split?.routes
                                                    ?.map((e) => e.fee)
                                                    .reduce((value, element) =>
                                                        value! + element!) ??
                                                0;
                                            int feeGarapin =
                                                state.invoice?.feeGarapin ?? 0;
                                            return Text(
                                                (totalBagi + feeGarapin)
                                                    .toString()
                                                    .currencyDot(symbol: "Rp."),
                                                textAlign: TextAlign.center,
                                                style: AppFont.mediumBold(
                                                    context));
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  (state.store?.store?.merChantRole == "SUPP")
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          width: baseWidth,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              const Divider(),
                              const SizedBox(height: 16),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Foto',
                                            style: AppFont.largeBold(context))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Nama',
                                            style: AppFont.largeBold(context))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Jumlah Item',
                                            style: AppFont.largeBold(context))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Harga',
                                            style: AppFont.largeBold(context))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Diskon',
                                            style: AppFont.largeBold(context))),
                                    Container(
                                        alignment: Alignment.center,
                                        width: baseWidth / 7,
                                        child: Text('Total Harga',
                                            style: AppFont.largeBold(context))),
                                  ]),
                              const SizedBox(height: 12),
                              const Divider(thickness: 2),
                              SizedBox(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      state.invoice?.product?.items?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    var item =
                                        state.invoice?.product?.items?[index];

                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              height: 40,
                                              width: 40,
                                              // flex: 2,
                                              child: ImageLoad(
                                                imageUrl:
                                                    Environment.showUrlImage(
                                                        path: item?.product
                                                                ?.image ??
                                                            ""),
                                                errorWidget: ImageLoad(
                                                  imageUrl:
                                                      Environment.showUrlImage(
                                                          path: item?.product
                                                                  ?.icon ??
                                                              ""),
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
                                            child: Text(
                                                item?.quantity.toString() ??
                                                    "-",
                                                textAlign: TextAlign.center,
                                                style: AppFont.medium(context)),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text(
                                                textAlign: TextAlign.center,
                                                item?.product?.price
                                                        .currencyFormat(
                                                            symbol: "Rp.") ??
                                                    "",
                                                style: AppFont.medium(context)),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text(
                                                textAlign: TextAlign.center,
                                                item?.product?.discount
                                                        .currencyFormat(
                                                            symbol: "Rp.") ??
                                                    "",
                                                style: AppFont.medium(context)),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: baseWidth / 7,
                                            child: Text(
                                                textAlign: TextAlign.center,
                                                ((item!.product!.price! -
                                                            item.product!
                                                                .discount!) *
                                                        item.quantity!)
                                                    .toString()
                                                    .currencyDot(symbol: "Rp."),
                                                style: AppFont.medium(context)),
                                          ),
                                        ]);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Divider(thickness: 2),
                                    );
                                  },
                                ),
                              ),
                              const Divider(thickness: 2),
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Fee Bank",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.error),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Tax",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.error),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Total",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.success),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "- ${int.parse(state.fee ?? "0").toString().currencyDot(symbol: "Rp.")}",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.error),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "- ${int.parse(state.tax ?? "0").currencyFormat(symbol: "Rp.")}",
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.error),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            (state.invoice?.product
                                                        ?.totalPrice ==
                                                    null)
                                                ? ""
                                                : (state.invoice!.product!
                                                            .totalPrice! -
                                                        int.parse(
                                                            state.fee ?? "0") -
                                                        int.parse(
                                                            state.tax ?? "0"))
                                                    .currencyFormat(
                                                        symbol: "Rp."),
                                            style: AppFont.largeBold(context)!
                                                .copyWith(
                                                    color: AppColor
                                                        .appColor.success),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
