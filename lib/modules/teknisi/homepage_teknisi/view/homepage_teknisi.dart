import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/teknisi/homepage_teknisi/cubit/home_page_teknisi_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/view/transaction_card.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/components/container_state_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes.dart';
import '../../../../widgets/widgets.dart';

class HomePageTeknisiPage extends StatelessWidget {
  const HomePageTeknisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageTeknisiCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
      ),
      body: BlocBuilder<HomePageTeknisiCubit, HomePageTeknisiState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: Center(
              child: CircularProgressIndicator(),
            ),
            refresherOptions: cubit.defaultRefresh,
            emptyOptions: EmptyOptions(
              customEmpty: const RequestInstalationWidget(
                isEmpty: true,
                lengthData: '0',
              ),
            ),
            status: state.status,
            child: Column(
              children: [
                RequestInstalationWidget(
                  isEmpty: false,
                  lengthData: state.listTransaction.length.toString(),
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.listTransaction.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CustomButton(
                        onPressed: () {
                          context
                              .pushNamed(RouteNames.detailTransaction, extra: {
                            "id_transaction": state.listTransaction[index].id
                          });
                        },
                        child: TransactionCard(
                          data: state.listTransaction[index],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class RequestInstalationWidget extends StatelessWidget {
  final String lengthData;
  final bool isEmpty;
  const RequestInstalationWidget(
      {super.key, required this.isEmpty, required this.lengthData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: baseWidth,
          decoration: BoxDecoration(
              color: isEmpty
                  ? Colors.grey
                  : AppColor.appColor.warning.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 36,
            ),
            title: Text(
              isEmpty
                  ? "Tidak ada permintaan pemasangan"
                  : "Ada $lengthData permintaan pasang barang",
              style: AppFont.largeBold(context)!.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              isEmpty ? "Belum ada tugas" : "Konfirmasi dan Proses Pemasangan",
              style: AppFont.largeBold(context)!.copyWith(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
