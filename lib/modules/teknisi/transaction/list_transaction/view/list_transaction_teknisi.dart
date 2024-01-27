import 'package:abditrack_inventory/modules/teknisi/transaction/list_transaction/cubit/list_transaction_teknisi_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/view/transaction_card.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../engine/helpers/options.dart';
import '../../../../../routes/routes.dart';
import '../../../../../widgets/components/empty_widget_image.dart';

class ListTransactionTeknisiPage extends StatelessWidget {
  const ListTransactionTeknisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListTransactionTeknisiCubit>();
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
              child: BlocBuilder<ListTransactionTeknisiCubit,
                  ListTransactionTeknisiState>(
                builder: (context, state) {
                  return BlocBuilder<ListTransactionTeknisiCubit,
                      ListTransactionTeknisiState>(
                    builder: (context, state) {
                      return ContainerStateHandler(
                          loading: FilterTransaksiTeknisi(
                              cubit: cubit, status: state.filterStatus),
                          status: DataStateStatus.success,
                          errorOptions: ErrorOptions(
                              customError: FilterTransaksiTeknisi(
                                  cubit: cubit, status: state.filterStatus)),
                          emptyOptions: EmptyOptions(
                              customEmpty: FilterTransaksiTeknisi(
                                  cubit: cubit, status: state.filterStatus)),
                          child: FilterTransaksiTeknisi(
                              cubit: cubit, status: state.filterStatus));
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ListTransactionTeknisiCubit,
                ListTransactionTeknisiState>(
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
                  emptyOptions: EmptyOptions(
                      customEmpty: const EmptyImageData(
                    text: "Data Transaksi Kosong",
                  )),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listTransaction.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 1),
                            child: CustomButton(
                              onPressed: () {
                                context.pushNamed(RouteNames.detailTransaction,
                                    extra: {
                                      "id_transaction":
                                          state.listTransaction[index].id
                                    });
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

class FilterTransaksiTeknisi extends StatelessWidget {
  const FilterTransaksiTeknisi({
    super.key,
    required this.cubit,
    required this.status,
  });

  final ListTransactionTeknisiCubit cubit;
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
          FilterButton(
              onPressed: () {
                cubit.changeStatus("REQUEST");
              },
              title: 'Permintaan Keluar',
              isActive: status == "REQUEST" ? true : false),
          FilterButton(
              onPressed: () {
                cubit.changeStatus("REQUEST_RETURN");
              },
              title: 'Permintaan Retur',
              isActive: status == "REQUEST_RETURN" ? true : false),
        ],
      ),
    );
  }
}
