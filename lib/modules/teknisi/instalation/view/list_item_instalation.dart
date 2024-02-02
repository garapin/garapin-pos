import 'dart:developer';
import 'package:armory/modules/teknisi/instalation/cubit/list_item_instalation_cubit.dart';
import 'package:armory/routes/routes.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../engine/base/app.dart';
import '../../../../engine/helpers/color_status.dart';
import '../../../../themes/themes.dart';

class ListItemInstalation extends StatelessWidget {
  const ListItemInstalation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListItemInstalationCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
            onPressed: () {
              if (cubit.sendSelectedListCart().isEmpty) {
                ShowNotify.error(context,
                    msg:
                        "Belum pilih barang yang akan di pasang pada kendaraan");
              } else {
                context.pushNamed(RouteNames.processInstalationItem,
                    extra: cubit.sendSelectedListCart());
              }
            },
            label: SizedBox(
                width: 300,
                child: Center(
                    child: Text(
                  "PASANG",
                  style: AppFont.whiteLarge(context),
                )))),
      ),
      appBar: AppBar(
        title: const Text("Device Tersedia"),
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
                    log(state.item[index].status.toString());
                    if (state.item[index].status == "IN") {
                      cubit.selectedItem(state.item[index]);
                    } else {
                      ShowNotify.error(context, msg: "Barang sudah terpasang");
                    }
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
                          (state.item[index].status!.toUpperCase() ==
                                  "INSTALLED")
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
                                color: statusItemColor(
                                    state.item[index].status!.toUpperCase())),
                            child: Center(
                                child: Text(
                                    state.item[index].status?.toUpperCase() ??
                                        "",
                                    style:
                                        AppFont.whiteLarge(context)!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.appColor.background,
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
