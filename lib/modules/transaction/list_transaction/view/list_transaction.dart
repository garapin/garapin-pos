import 'package:abditrack_inventory/modules/transaction/list_transaction/cubit/list_transaction_cubit.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../engine/helpers/options.dart';
import 'transaction_card.dart';

class ListTransactionPage extends StatelessWidget {
  const ListTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListTransactionCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SizedBox(
              height: 40,
              child: BlocBuilder<ListTransactionCubit, ListTransactionState>(
                builder: (context, state) {
                  return ContainerStateHandler(
                    status: DataStateStatus.success,
                    loading: FilterTransaction(
                        cubit: cubit, status: state.filterStatus),
                    errorOptions: ErrorOptions(
                        customError: FilterTransaction(
                            cubit: cubit, status: state.filterStatus)),
                    emptyOptions: EmptyOptions(
                        customEmpty: FilterTransaction(
                            cubit: cubit, status: state.filterStatus)),
                    child: FilterTransaction(
                        cubit: cubit, status: state.filterStatus),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ListTransactionCubit, ListTransactionState>(
              builder: (context, state) {
                return ContainerStateHandler(
                  status: state.status,
                  refresherOptions: RefresherOptions(
                    controller: cubit.refreshController,
                    onRefresh: cubit.refreshData,
                  ),
                  loading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.listTransaction.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 1),
                            child: CustomButton(
                              onPressed: () {
                                context.pushNamed(RouteNames.detailTransaction,
                                    extra: state.listTransaction[index].id);
                              },
                              child: TransactionCard(
                                data: state.listTransaction[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterTransaction extends StatelessWidget {
  const FilterTransaction({
    required this.status,
    super.key,
    required this.cubit,
  });

  final ListTransactionCubit cubit;
  final String status;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterButton(
              onPressed: () {
                cubit.changeStatus("ALL");
              },
              title: 'Semua',
              isActive: status == "ALL" ? true : false),
          FilterButton(
              onPressed: () {
                cubit.changeStatus("SUCCESS");
              },
              title: 'Sukses',
              isActive: status == "SUCCESS" ? true : false),
          FilterButton(
              onPressed: () {
                cubit.changeStatus("PROCESS");
              },
              title: 'Proses',
              isActive: status == "PROCESS" ? true : false),
          FilterButton(
              onPressed: () {
                cubit.changeStatus("CANCELLED");
              },
              title: 'Batal',
              isActive: status == "CANCELLED" ? true : false),
        ],
      ),
    );
  }
}
