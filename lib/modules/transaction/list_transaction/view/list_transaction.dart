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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterButton(
                        onPressed: () {
                          cubit.changeStatus("ALL");
                        },
                        title: 'Semua',
                        isActive: cubit.statusTransaction.text == "ALL"
                            ? true
                            : false),
                    FilterButton(
                        onPressed: () {
                          cubit.changeStatus("SUCCESS");
                        },
                        title: 'Sukses',
                        isActive: cubit.statusTransaction.text == "SUCCESS"
                            ? true
                            : false),
                    FilterButton(
                        onPressed: () {
                          cubit.changeStatus("PROCESS");
                        },
                        title: 'Proses',
                        isActive: cubit.statusTransaction.text == "PROCESS"
                            ? true
                            : false),
                    FilterButton(
                        onPressed: () {
                          cubit.changeStatus("CANCELLED");
                        },
                        title: 'Batal',
                        isActive: cubit.statusTransaction.text == "CANCELLED"
                            ? true
                            : false),
                  ],
                ),
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
