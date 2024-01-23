import 'dart:developer';

import 'package:abditrack_inventory/modules/teknisi/instalation/cubit/list_item_instalation_cubit.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../engine/base/app.dart';
import '../../../../themes/themes.dart';

class ListItemInstalation extends StatelessWidget {
  const ListItemInstalation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListItemInstalationCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (cubit.sendSelectedListCart().isEmpty) {
              ShowNotify.error(context,
                  msg: "Belum pilih barang yang akan di pasang pada kendaraan");
            } else {
              context.pushNamed(RouteNames.processInstalationItem,
                  extra: cubit.sendSelectedListCart());
            }
          },
          label: Container(
              width: 300,
              child: Center(
                  child: Text(
                "PASANG",
                style: AppFont.whiteLarge(context),
              )))),
      appBar: AppBar(
        title: const Text("Pilih Barang dan dipasang"),
      ),
      body: BlocBuilder<ListItemInstalationCubit, ListItemInstalationState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemCount: state.item.length,
              itemBuilder: (context, index) {
                return CustomButton(
                  borderRadius: BorderRadius.circular(16),
                  onPressed: () {
                    cubit.selectedItem(state.item[index]);
                  },
                  child: Container(
                    width: baseWidth,
                    height: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          (state.item[index].status == "INSTALLED")
                              ? SizedBox()
                              : Checkbox(
                                  value: state.selectedItem
                                          .contains(state.item[index])
                                      ? true
                                      : false,
                                  onChanged: (val) {
                                    log("message");
                                  }),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.item[index].noProduct ?? "",
                                style: AppFont.largeBold(context),
                              ),
                              SizedBox(
                                width: baseWidth * 0.5,
                                child: Text(
                                  "IMEI ${state.item[index].imei} | SN ${state.item[index].noSn}",
                                  style: AppFont.medium(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color:
                                    AppColor.appColor.primary.withOpacity(0.2)),
                            child: Center(
                                child: Text(
                                    state.item[index].status?.toUpperCase() ??
                                        "",
                                    style:
                                        AppFont.whiteLarge(context)!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.appColor.primary,
                                    ))),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
