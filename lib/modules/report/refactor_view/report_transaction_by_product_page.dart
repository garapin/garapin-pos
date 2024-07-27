import 'package:d_chart/commons/data_model/data_model.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/data/models/base/report_transaction_by_product.dart';
import 'package:pos/engine/base/app.dart';
import 'package:pos/engine/engine.dart';
import 'package:pos/modules/report/refactor_cubit/report_transaction_by_product_cubit.dart';
import 'package:pos/themes/themes.dart';
import 'package:pos/widgets/components/container_state_handler.dart';
import 'package:pos/widgets/components/outline_form_dropdown.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ReportTransactionByProductPage extends StatefulWidget {
  const ReportTransactionByProductPage({super.key});

  @override
  State<ReportTransactionByProductPage> createState() => _ReportTransactionByProductPageState();
}

class _ReportTransactionByProductPageState extends State<ReportTransactionByProductPage> {
  bool showChart = false;

  late DateTime _selectedDate = DateTime.now();
  late DateTime _selectedDateDaily = DateTime.now();
  late DateTime _selectedDateStartWeek = DateTime.now();
  late DateTime _selectedDateEndWeek = DateTime.now();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: BlocBuilder<ReportTransactionByProductCubit, ReportTransactionByProductState>(
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
                                "Report Transaction by Product",
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
                                  .read<ReportTransactionByProductCubit>()
                                  .setFilterDatabase(value);
                              context
                                  .read<ReportTransactionByProductCubit>()
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
                            state.transaction?.totalGrossSales ?? 0,
                            state.transaction?.totalDiscount ?? 0,
                            state.transaction?.totalNetSales ?? 0,
                            state.transaction?.totalTransactions ?? 0,
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
                                  .read<ReportTransactionByProductCubit>()
                                  .setDateTimeRange("$value - $value");
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
                                  .read<ReportTransactionByProductCubit>()
                                  .setDateTimeRange(
                                  "$_selectedDateStartWeek - $_selectedDateEndWeek");
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
                                  .read<ReportTransactionByProductCubit>()
                                  .setDateTimeRange(
                                  "$value - ${value.add(const Duration(days: 30))}");
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
                                    .read<ReportTransactionByProductCubit>()
                                    .setDateTimeRange(
                                  "$value - ${value.add(const Duration(days: 364))}",
                                  filter: "Yearly",
                                );
                              });
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
              initialValue: DateTimeRange(
                start: DateTime.now().subtract(
                  const Duration(days: 7),
                ),
                end: DateTime.now(),
              ),
              onChanged: (value) {
                print(value.toString());
                context
                    .read<ReportTransactionByProductCubit>()
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

  Widget cardSummary(int totalGross, int totalDiscount, int totalNett, int totalTrx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Total Gross Sales',
                style: AppFont.largeBold(context),
              ),
              const SizedBox(height: 40),
              Text(
                totalGross.currencyFormat(symbol: "Rp "),
                style: AppFont.largeBold(context)?.copyWith(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Total Discount Sales',
                style: AppFont.largeBold(context),
              ),
              const SizedBox(height: 40),
              Text(
                totalDiscount.currencyFormat(symbol: "Rp "),
                style: AppFont.largeBold(context)?.copyWith(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Total Nett Sales',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Total Transaction',
                style: AppFont.largeBold(context),
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
              "Brand",
              "Category",
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
                        item.brand!.name!,
                        style: AppFont.largeBold(context),
                      ),
                    ),
                    TableViewCell(
                      child: Text(
                        item.category!.name!,
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
                        item.totalPrice.currencyFormat(symbol: "Rp "),
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
                        context.read<ReportTransactionByProductCubit>().saveToExcel(buffer);
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
    List<OrdinalData> numericDataList = [];

    for (var item in transaction) {
      numericDataList.add(
        OrdinalData(domain: item.productName!, measure: item.grossSales!),
      );
    }

    final numericGroupList = [
      OrdinalGroup(
        id: '1',
        data: numericDataList,
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
