import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/history_transaction/cubit/history_transaction_cubit.dart';
import 'package:pos/modules/report/cubit/detail_transaction_product_cubit.dart';
import 'package:pos/modules/report/cubit/report_detail_cubit.dart';
import 'package:pos/widgets/widgets.dart';
import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class HistoryTransactionPage extends StatelessWidget {
  const HistoryTransactionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HistoryTransactionCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<HistoryTransactionCubit, HistoryTransactionState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            status: state.status,
            loading: Center(
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
                          horizontal: 24, vertical: 8),
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
                                    "History Transaksi",
                                    style: AppFont.largeBold(context),
                                  ),
                                  Text(
                                    DateTime.now().toddMMMMyyyy(),
                                    style: AppFont.medium(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Order ID',
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Jam & Tanggal',
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Total Harga',
                                  style: AppFont.largeBold(context))),
                          Container(
                              alignment: Alignment.center,
                              width: baseWidth / 7,
                              child: Text('Payment',
                                  style: AppFont.largeBold(context))),
                        ]),
                    SizedBox(height: 12),
                    Divider(thickness: 2),
                    SizedBox(height: 8),
                    SizedBox(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.inv.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = state.inv[index];
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                    item.invoiceLabel ?? "",
                                    style: AppFont.medium(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(item.createdAt!.toddMMMyyyyHHmm(),
                                      textAlign: TextAlign.center,
                                      style: AppFont.medium(context)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      item.product?.totalPrice
                                              .currencyFormat(symbol: "Rp.") ??
                                          "",
                                      style: AppFont.medium(context)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: baseWidth / 7,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      item.paymentMethod ?? "-",
                                      style: AppFont.medium(context)),
                                ),
                              ]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Divider(thickness: 2),
                                SizedBox(height: 8),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(thickness: 2),
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
