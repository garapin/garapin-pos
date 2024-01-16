import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/cubit/detail_transaction_cubit.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailTransactionCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Transaction")),
      body: BlocBuilder<DetailTransactionCubit, DetailTransactionState>(
        builder: (context, state) {
          return ContainerStateHandler(
              refresherOptions: cubit.defaultRefresh,
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              status: state.status,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ImageLoad(
                              imageUrl:
                                  "${Environment.baseUrl()}${state.transaction?.signatureImage ?? ""}",
                              fit: BoxFit.contain,
                              errorWidget: Resources.images.armor
                                  .image(color: Colors.grey))),
                      const SizedBox(height: 8),
                      Text(state.transaction?.updated
                              ?.toEEEEddMMMMyyyy()
                              .toString() ??
                          ""),
                      Text(state.transaction?.noSuratJalan ?? ""),
                      Text(state.transaction?.statusTransaction ?? ""),
                      Text(state.transaction?.transactionPurpose ?? ""),
                      const Divider(thickness: 2),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.item.length,
                        itemBuilder: (context, index) {
                          var item = state.item[index];
                          return Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  child: Row(children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.noProduct ?? "",
                                          style: AppFont.largeBold(context),
                                        ),
                                        Text(
                                          "IMEI ${item.imei} | SN ${item.noSn}",
                                          style: AppFont.medium(context),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            color: AppColor.appColor.primary
                                                .withOpacity(0.2)),
                                        child: Center(
                                            child: Text(
                                                item.status?.toUpperCase() ??
                                                    "",
                                                style:
                                                    AppFont.whiteLarge(context)!
                                                        .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColor.appColor.primary,
                                                ))))
                                  ])));
                        },
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
