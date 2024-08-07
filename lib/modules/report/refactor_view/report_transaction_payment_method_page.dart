import 'package:d_chart/commons/data_model/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/models/base/report_transaction_by_payment_method.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/refactor_cubit/report_transaction_by_payment_method_cubit.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/container_state_handler.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ReportTransactionPaymentMethodPage extends StatefulWidget {
  const ReportTransactionPaymentMethodPage({super.key});

  @override
  State<ReportTransactionPaymentMethodPage> createState() =>
      _ReportTransactionPaymentMethodPageState();
}

class _ReportTransactionPaymentMethodPageState
    extends State<ReportTransactionPaymentMethodPage> {
  bool showChart = false;
  String selectedChart = 'Daily';

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
      body: BlocBuilder<ReportTransactionByPaymentMethodCubit,
          ReportTransactionByPaymentMethodState>(
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
                                "Report Transaction by Payment Method",
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
                                  .read<ReportTransactionByPaymentMethodCubit>()
                                  .setFilterDatabase(value);
                              context
                                  .read<ReportTransactionByPaymentMethodCubit>()
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
                            state.transaction?.totalCash ?? 0,
                            state.transaction?.totalQris ?? 0,
                            state.transaction?.totalVa ?? 0,
                            state.transaction?.totalNetSales ?? 0,
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
                              ? lineChart(state.transaction?.transactions ?? [], state.transaction!)
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
                                selectedChart = "Daily";
                                _selectedDateDaily = value;
                              });
                              contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>()
                                  .setDateTimeRange("$value - $value");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.endDate ?? ""}";
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
                                selectedChart = "Weekly";
                                _selectedDateStartWeek = value.start;
                                _selectedDateEndWeek = value.end;
                              });
                              contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>()
                                  .setDateTimeRange(
                                      "$_selectedDateStartWeek - $_selectedDateEndWeek");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.endDate ?? ""}";
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

                              int lastDay =
                                  DateTime(value.year, value.month + 1, 0).day;
                              print(value.add(Duration(days: lastDay - 1)));
                              newSetState(() {
                                selectedChart = "Monthly";
                                _selectedDate = value;
                              });
                              contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>()
                                  .setDateTimeRange(
                                      "$value - ${value.add(Duration(days: lastDay - 1))}");

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.endDate ?? ""}";
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
                              print(value.add(const Duration(days: 365)));
                              newSetState(() {
                                selectedChart = "Yearly";
                                _selectedDate = value;

                                contextBloc
                                    .read<
                                        ReportTransactionByPaymentMethodCubit>()
                                    .setDateTimeRange(
                                      "$value - ${value.add(const Duration(days: 365))}",
                                      filter: "Yearly",
                                    );
                              });

                              _startDateController.text = "${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.startDate ?? ""} - ${contextBloc
                                  .read<ReportTransactionByPaymentMethodCubit>().state.endDate ?? ""}";
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
              format: DateFormat('yyyy-MM-dd'),
              initialValue: DateTimeRange(
                start: DateTime.now().subtract(
                  const Duration(days: 7),
                ),
                end: DateTime.now(),
              ),
              onChanged: (value) {
                print(value.toString());
                context
                    .read<ReportTransactionByPaymentMethodCubit>()
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

  Widget cardSummary(int cash, int qris, int va, int totalNett) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 250,
            child: Column(
              children: [
                Text(
                  'CASH',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  cash.currencyFormat(symbol: "Rp "),
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
                  'QRIS',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  qris.currencyFormat(symbol: "Rp "),
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
                  'VA',
                  style: AppFont.largeBold(context),
                ),
                const SizedBox(height: 40),
                Text(
                  va.currencyFormat(symbol: "Rp "),
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
                  'Total Sales',
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
              "Payment Method",
              "Gross Sales",
              "Discount Sales",
              "Nett Sales (Amount - Discount)",
            ].map((label) {
              return TableViewHeader(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                label: label,
                minWidth: 170,
              );
            }).toList(),
            rows: [
              for (var item in transaction)
                TableViewRow(
                  height: 60,
                  cells: [
                    TableViewCell(
                      child: Text(
                        selectedChart == 'Yearly' ? item.date!.toMMMyyyy() : item.date!.toddMMMyyyy(),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.paymentMethod!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.grossSales.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.discount.currencyFormat(symbol: "Rp "),
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.netSales.currencyFormat(symbol: "Rp "),
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
                        context.read<ReportTransactionByPaymentMethodCubit>().saveToExcel(buffer);
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

  Widget lineChart(List<Transaction> transaction, ReportTransactionByPaymentMethod item) {
    List<OrdinalData> numericDataList = [];

    numericDataList.add(
      OrdinalData(domain: "VA", measure: item.totalVa!),
    );

    numericDataList.add(
      OrdinalData(domain: "QRIS", measure: item.totalQris!),
    );

    numericDataList.add(
      OrdinalData(domain: "CASH", measure: item.totalCash!),
    );

    final numericGroupList = [
      OrdinalGroup(
        id: '1',
        data: numericDataList,
        color: Colors.purple,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: DChartBarO(
          allowSliding: true,
          animate: true,
          groupList: numericGroupList,
        ),
      ),
    );
  }
}
