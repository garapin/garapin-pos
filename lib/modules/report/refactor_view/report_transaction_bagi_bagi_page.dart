import 'package:d_chart/commons/data_model/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:intl/intl.dart';
import 'package:pos/data/models/base/report_transaction_bagi_bagi.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/refactor_cubit/report_transaction_bagi_bagi_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/container_state_handler.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ReportTransactionBagiBagiPage extends StatefulWidget {
  const ReportTransactionBagiBagiPage({super.key});

  @override
  State<ReportTransactionBagiBagiPage> createState() => _ReportTransactionBagiBagiPageState();
}

class _ReportTransactionBagiBagiPageState extends State<ReportTransactionBagiBagiPage> {
  bool showChart = false;

  late DateTime _selectedDate = DateTime.now();
  late DateTime _selectedDateDaily = DateTime.now();
  late DateTime _selectedDateStartWeek = DateTime.now();
  late DateTime _selectedDateEndWeek = DateTime.now();

  final TextEditingController _startDateController = TextEditingController();

  final DateTime _firstDate =
  DateTime.now().subtract(const Duration(days: 350));
  final DateTime _lastDate = DateTime.now().add(const Duration(days: 350));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _startDateController.text =
    "${DateFormat("yyyy-MM-dd").format(_selectedDate)} - ${DateFormat("yyyy-MM-dd").format(_selectedDate)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: BlocBuilder<ReportTransactionBagiBagiCubit, ReportTransactionBagiBagiState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
              width: baseWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: ContainerStateHandler(
                loading: const SizedBox(),
                status: DataStateStatus.success,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Text(
                                "Report Bagi-Bagi",
                                style: AppFont.largeBold(context),
                              ),
                              const Spacer(),
                              Text(
                                "Show chart",
                                style: AppFont.largeBold(context),
                              ),
                              Switch(
                                value: showChart,
                                onChanged: (value) {
                                  setState(() {
                                    showChart = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Divider(thickness: 2),
                          const SizedBox(height: 12),
                          Text(
                            "Select TRX",
                            style: AppFont.largeBold(context),
                          ),
                          const SizedBox(height: 12),
                          OutlineFormDropdown(
                            initialValue: state.targetDatabase,
                            onChanged: (value) {
                              print(value);
                              context
                                  .read<ReportTransactionBagiBagiCubit>()
                                  .setFilterDatabase(value);
                              context
                                  .read<ReportTransactionBagiBagiCubit>()
                                  .clearTransaction();
                            },
                            name: "template",
                            hintText: "",
                            items: state.filterTemplate.map(
                                  (e) {
                                return DropdownMenuItem(
                                  value: e.dbName,
                                  child: Text(e.storeName ?? "-"),
                                );
                              },
                            ).toList(),
                            uniqueKey: UniqueKey(),
                          ),
                          // TODO: filter form
                          filterForm(context),

                          // TODO: card summary
                          const SizedBox(height: 24),
                          cardSummary(
                            state.transaction?.totalNetSales ?? 0,
                            state.transaction?.totalBagiBagiBiaya ?? 0,
                            state.transaction?.totalBagiBagiPendapatan ?? 0,
                            state.transaction?.totalTransaction ?? 0,
                          ),
                          const SizedBox(height: 12),
                          !showChart
                              ? pagedTable(
                            state.transaction?.transactions ?? [],
                            state.transaction?.transactions?.length ?? 0,
                            state.transaction?.excelBuffer ?? "",
                          )
                              : Container(),
                          const SizedBox(height: 12),
                          showChart
                              ? lineChart(state.transaction?.transactions ?? [])
                              : Container(),
                          showChart ? const SizedBox(height: 12) : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget filterForm(BuildContext contextBloc) {
    return SizedBox(
      width: baseWidth,
      child: FormBuilder(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              "Select Filter Date",
              style: AppFont.largeBold(context),
            ),
            const SizedBox(height: 12),
            FormBuilderDropdown(
              initialValue: "Daily",
              onChanged: (value) {
                if (value == "Daily") {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, newSetState) {
                        return AlertDialog(
                          content: dp.DayPicker.single(
                            selectedDate: _selectedDateDaily,
                            onChanged: (value) {
                              print("$value - $value");
                              newSetState(() {
                                _selectedDateDaily = value;
                              });
                              contextBloc
                                  .read<ReportTransactionBagiBagiCubit>()
                                  .setDateTimeRange("$value - $value");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.endDate ?? ""}";
                              Navigator.pop(context);
                            },
                            firstDate: _firstDate,
                            lastDate: _lastDate,
                          ),
                        );
                      },
                    ),
                  );
                }

                if (value == "Weekly") {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, newSetState) {
                        return AlertDialog(
                          content: dp.WeekPicker(
                            selectedDate: _selectedDateStartWeek,
                            onChanged: (value) {
                              newSetState(() {
                                _selectedDateStartWeek = value.start;
                                _selectedDateEndWeek = value.end;
                              });
                              contextBloc
                                  .read<ReportTransactionBagiBagiCubit>()
                                  .setDateTimeRange(
                                  "$_selectedDateStartWeek - $_selectedDateEndWeek");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.endDate ?? ""}";
                              Navigator.pop(context);
                            },
                            firstDate: _firstDate,
                            lastDate: _lastDate,
                          ),
                        );
                      },
                    ),
                  );
                }

                if (value == "Monthly") {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, newSetState) {
                        return AlertDialog(
                          content: dp.MonthPicker.single(
                            selectedDate: _selectedDate,
                            onChanged: (value) {
                              print(value.toString());
                              print(value.add(const Duration(days: 30)));
                              newSetState(() {
                                _selectedDate = value;
                              });
                              contextBloc
                                  .read<ReportTransactionBagiBagiCubit>()
                                  .setDateTimeRange(
                                  "$value - ${value.add(const Duration(days: 30))}");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.endDate ?? ""}";
                              Navigator.pop(context);
                            },
                            firstDate: _firstDate,
                            lastDate: _lastDate,
                          ),
                        );
                      },
                    ),
                  );
                }

                if (value == "Yearly") {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (ctx, newSetState) {
                        return AlertDialog(
                          content: dp.YearPicker.single(
                            selectedDate: _selectedDate,
                            onChanged: (value) {
                              print(value.toString());
                              print(value.add(const Duration(days: 364)));
                              newSetState(() {
                                _selectedDate = value;

                                contextBloc
                                    .read<ReportTransactionBagiBagiCubit>()
                                    .setDateTimeRange(
                                  "$value - ${value.add(const Duration(days: 364))}",
                                  filter: "Yearly",
                                );
                              });

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionBagiBagiCubit>().state.endDate ?? ""}";
                              Navigator.pop(context);
                            },
                            firstDate: _firstDate,
                            lastDate: _lastDate,
                          ),
                        );
                      },
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(58),
                ),
                hintStyle: const TextStyle(fontSize: 16),
                filled: true,
                fillColor: const Color(0xffffffff),
              ),
              name: "calendar",
              items: const [
                DropdownMenuItem(
                  value: "Daily",
                  child: Text("Daily"),
                ),
                DropdownMenuItem(
                  value: "Weekly",
                  child: Text("Weekly"),
                ),
                DropdownMenuItem(
                  value: "Monthly",
                  child: Text("Monthly"),
                ),
                DropdownMenuItem(
                  value: "Yearly",
                  child: Text("Yearly"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Select Date Range",
              style: AppFont.largeBold(context),
            ),
            const SizedBox(height: 12),
            FormBuilderDateRangePicker(
              controller: _startDateController,
              onChanged: (value) {
                print(value.toString());
                context
                    .read<ReportTransactionBagiBagiCubit>()
                    .setDateTimeRange(value.toString());
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
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
              firstDate: DateTime.now().subtract(
                const Duration(days: 1000),
              ),
              lastDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardSummary(int totalNett, int bagiBagiTotal, int bagiBagiPendapatan, int totalTrx) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Total Net Sales',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  totalNett.currencyFormat(symbol: "Rp "),
                  style: AppFont.largeBold(context)?.copyWith(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'BagiBagi Biaya',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  bagiBagiTotal.currencyFormat(symbol: "Rp "),
                  style: AppFont.largeBold(context)?.copyWith(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'BagiBagi Pendapatan',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  bagiBagiPendapatan.currencyFormat(symbol: "Rp "),
                  style: AppFont.largeBold(context)?.copyWith(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Total Transaction\n(Group by Invoice No)',
                  style: AppFont.largeBold(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text(
                  totalTrx.toString(),
                  style: AppFont.largeBold(context)?.copyWith(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pagedTable(List<Transaction> transaction, int lengthData, String buffer) {
    final PaginationController paginationController = PaginationController(
      rowCount: lengthData,
      rowsPerPage: 10,
    );
    return Column(
      children: [
        SizedBox(
          height: 400,
          width: baseWidth,
          child: ScrollableTableView(
            paginationController: paginationController,
            headers: [
              "Transaction Date",
              "Invoice No",
              "Status",
              "Type Bagi-Bagi",
              "Target Bagi-Bagi",
              "Net Sales",
              "Biaya BagiBagiPOS",
              "(%) BagiBagi Biaya",
              "(%) BagiBagi Pendapatan",
              "BagiBagi - Biaya",
              "BagiBagi - Pendapatan",
            ].map((label) {
              return TableViewHeader(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                label: label,
                minWidth: 190,
              );
            }).toList(),
            rows: [
              for (var item in transaction)
                TableViewRow(
                  height: 90,
                  cells: [
                    TableViewCell(
                      child: Text(
                        item.date!.toddMMMyyyyHHmmss(),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.invoice!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.status!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.type!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.target!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.netSales.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.costBagiBagiPos.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        "${item.percentageBagiBagiBiaya!}%",
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        "${item.percentageFeePos!}%",
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.bagiBagiBiaya.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.bagiBagiPendapatan.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ValueListenableBuilder(
              valueListenable: paginationController,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Text(
                        "${paginationController.currentPage}  of ${paginationController.pageCount}"),
                    Row(
                      children: [
                        IconButton(
                          onPressed: paginationController.currentPage <= 1
                              ? null
                              : () {
                            paginationController.previous();
                          },
                          iconSize: 20,
                          splashRadius: 20,
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: paginationController.currentPage <= 1
                                ? Colors.black26
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: paginationController.currentPage >=
                              paginationController.pageCount
                              ? null
                              : () {
                            paginationController.next();
                          },
                          iconSize: 20,
                          splashRadius: 20,
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: paginationController.currentPage >=
                                paginationController.pageCount
                                ? Colors.black26
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.read<ReportTransactionBagiBagiCubit>().saveToExcel(buffer);
                      },
                      child: const Text("Export"),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget lineChart(List<Transaction> transaction) {
    List<TimeData> numericDataList = [];

    for (var item in transaction) {
      numericDataList.add(
        TimeData(domain: item.date!, measure: item.netSales!),
      );
    }

    final numericGroupList = [
      TimeGroup(
        id: '1',
        data: numericDataList,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: DChartLineT(
          allowSliding: true,
          animate: true,
          groupList: numericGroupList,
        ),
      ),
    );
  }
}
