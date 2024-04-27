import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/cubit/report_cubit.dart';
import 'package:pos/routes/routes.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:pos/widgets/widgets.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        body: BlocBuilder<ReportCubit, ReportState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 120),
                width: baseWidth,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: ContainerStateHandler(
                  loading: const SizedBox(),
                  status: DataStateStatus.success,
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
                              "Report Bagi-Bagi",
                              style: AppFont.largeBold(context),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 24),
                      Container(
                        width: baseWidth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: FormBuilder(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pilih TRX",
                                  style: AppFont.largeBold(context),
                                ),
                                const SizedBox(height: 12),
                                OutlineFormDropdown(
                                    initialValue:
                                        (state.store?.store?.merChantRole ==
                                                    "TRX" ||
                                                state.store?.store?.storeType ==
                                                    "USER")
                                            ? Sessions.getDatabaseModel()!.name
                                            : null,
                                    onChanged: (p0) {
                                      log(p0);
                                      cubit.cleanTransaction();
                                      cubit.selectfilterDatabase(p0);
                                    },
                                    name: "template",
                                    hintText: "Pilih Trx",
                                    items: state.filterTemplate.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          child: Text(e.storeName ?? "-"),
                                          value: e.dbName,
                                        );
                                      },
                                    ).toList(),
                                    uniqueKey: UniqueKey()),
                                const SizedBox(height: 20),
                                FormBuilderDateRangePicker(
                                    initialValue: DateTimeRange(
                                        start: DateTime.now()
                                            .subtract(const Duration(days: 7)),
                                        end: DateTime.now()),
                                    onChanged: (value) {
                                      cubit.getDateTimeRange(value.toString());
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20),
                                      suffixIcon: const Icon(Icons.date_range),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 1),
                                        borderRadius: BorderRadius.circular(58),
                                      ),
                                      hintStyle: const TextStyle(fontSize: 16),
                                      filled: true,
                                      fillColor: const Color(0xffffffff),
                                    ),
                                    name: "date",
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 1000)),
                                    lastDate: DateTime.now()),
                                const SizedBox(height: 28),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  height: 45,
                                  width: baseWidth,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          cubit.formKey.currentState?.save();
                                          if (cubit.formKey.currentState
                                                  ?.value["template"] ==
                                              null) {
                                            ShowNotify.error(context,
                                                msg: "Template belum dipilih");
                                          } else if (state.startDate == null &&
                                              state.endDate == null) {
                                            ShowNotify.error(context,
                                                msg: "Tanggal belum dipilih");
                                          } else {
                                            cubit.getData(
                                                force: true,
                                                isRefresh: true,
                                                param:
                                                    "created[gte]=${state.startDate}&created[lte]=${state.endDate}");
                                          }
                                        },
                                        child: const Text("Cari Transaksi")),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 2),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ContainerStateHandler(
                          refresherOptions: RefresherOptions(
                            controller: cubit.refreshController,
                            onRefresh: cubit.refreshData,
                            onLoading: cubit.loadMoreData,
                            enablePullUp: state.canLoadMore,
                          ),
                          status: state.status,
                          loading: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: state.transaction.isEmpty
                              ? const Center(child: Text("Transaksi Kosong"))
                              : ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  itemCount: state.transaction.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = state.transaction[index];
                                    return ListTile(
                                      onTap: () async {
                                        print(state.filterTemplate
                                            .where((element) =>
                                                element.dbName ==
                                                state.targetDatabase)
                                            .first
                                            .storeName);
                                        var status = context.pushNamed(
                                            RouteNames.reportBagiDretail,
                                            extra: Map<String, String>.from({
                                              "database": state.targetDatabase,
                                              "invoice": item.referenceId,
                                              "trx": state.filterTemplate
                                                  .where((element) =>
                                                      element.dbName ==
                                                      state.targetDatabase)
                                                  .first
                                                  .storeName
                                            }));
                                        print("ini status");
                                        print(status
                                            .then((value) => value.toString()));

                                        // if (status != null) {
                                        //   context.pushNamed(
                                        //       RouteNames.detailTransactionProduct,
                                        //       extra: Map<String, String>.from({
                                        //         "database": state.targetDatabase,
                                        //         "invoice": item.referenceId
                                        //       }));
                                        // }
                                      },
                                      title: Text(
                                        item.referenceId?.split("&&")[0] ?? "",
                                        style: AppFont.largeBold(context)!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            "Transaksi : ${item.status!.name}",
                                            style: AppFont.mediumBold(context)!
                                                .copyWith(
                                                    color: item.status!.name ==
                                                            "SUCCESS"
                                                        ? AppColor
                                                            .appColor.success
                                                        : AppColor
                                                            .appColor.warning),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(item.created!
                                              .toddMMMyyyyHHmmss()),
                                        ],
                                      ),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            item.amount
                                                .currencyFormat(symbol: "Rp."),
                                            style: AppFont.largeBold(context),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "Settle : ${item.settlementStatus}",
                                            style: AppFont.mediumBold(context)!
                                                .copyWith(
                                                    color:
                                                        item.settlementStatus ==
                                                                "SETTLED"
                                                            ? AppColor.appColor
                                                                .success
                                                            : AppColor.appColor
                                                                .warning),
                                          ),
                                          Text("${item.channelCode}"),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Column(
                                      children: [
                                        SizedBox(height: 6),
                                        Divider(thickness: 2),
                                      ],
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
