import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 120),
            width: baseWidth,
            height: baseHeight,
            color: Colors.white,
            child: ContainerStateHandler(
              loading: SizedBox(),
              status: DataStateStatus.success,
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Container(
                    width: baseWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: FormBuilder(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pilih Template",
                              style: AppFont.largeBold(context),
                            ),
                            SizedBox(height: 12),
                            OutlineFormDropdown(
                                onChanged: (p0) {
                                  log(p0);
                                  cubit.cleanTransaction();
                                  cubit.selectfilterDatabase(p0);
                                },
                                name: "template",
                                hintText: "cari template",
                                items: state.filterTemplate.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      child: Text(e.templateName ?? "-"),
                                      value: e.dbName,
                                    );
                                  },
                                ).toList()
                                // DropdownMenuItem(
                                //   child: Text("a"),
                                //   value: "a",
                                // ),
                                // DropdownMenuItem(
                                //   child: Text("b"),
                                //   value: "b",
                                // )
                                ,
                                uniqueKey: UniqueKey()),
                            SizedBox(height: 20),
                            FormBuilderDateRangePicker(
                                initialValue: DateTimeRange(
                                    start: DateTime.now()
                                        .subtract(Duration(days: 7)),
                                    end: DateTime.now()),
                                onChanged: (value) {
                                  cubit.getDateTimeRange(value.toString());
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                  suffixIcon: Icon(Icons.date_range),
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
                                    .subtract(Duration(days: 1000)),
                                lastDate: DateTime.now()),
                            SizedBox(height: 28),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              height: 45,
                              width: baseWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (state.targetDatabase == null) {
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
                                    child: Text("Cari Transaksi")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 2),
                  SizedBox(height: 20),
                  Expanded(
                    child: ContainerStateHandler(
                      refresherOptions: RefresherOptions(
                        controller: cubit.refreshController,
                        onRefresh: cubit.refreshData,
                        onLoading: cubit.loadMoreData,
                        enablePullUp: state.canLoadMore,
                      ),
                      status: state.status,
                      loading: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: state.transaction.isEmpty
                          ? Center(child: Text("Transaksi Kosong"))
                          : ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              itemCount: state.transaction.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = state.transaction[index];
                                return ListTile(
                                  onTap: () {
                                    context.pushNamed(
                                        RouteNames.reportBagiDretail,
                                        extra: Map<String, String>.from({
                                          "database": state.targetDatabase,
                                          "invoice": item.referenceId
                                        }));
                                  },
                                  title: Text(
                                    item.referenceId?.split("&&")[0] ?? "",
                                    style: AppFont.largeBold(context)!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Text(
                                        "status transaksi : ${item.status!.name}",
                                        style: AppFont.medium(context),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                          "${item.created!.toddMMMyyyyHHmmss()}"),
                                    ],
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(item.amount
                                          .currencyFormat(symbol: "Rp.")),
                                      Text(
                                          "status settle : ${item.settlementStatus}"),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Column(
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
          );
        },
      ),
    );
  }
}
