import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/installed_vehicle/cubit/installed_vehicle_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/cubit/detail_transaction_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/widget/full_image_network.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../themes/themes.dart';
import '../../../../widgets/components/empty_image.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailTransactionCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          BlocBuilder<DetailTransactionCubit, DetailTransactionState>(
        builder: (context, state) {
          return ContainerStateHandler(
            status: state.status,
            loading: const SizedBox(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Builder(
                builder: (BuildContext context) {
                  if (cubit.getRoleUser() == "TEKNISI") {
                    return Builder(builder: (context) {
                      if (state.transaction?.statusTransaction == "PROCESS") {
                        return ButtonProcessStatus(
                          cubit: cubit,
                          state: state,
                        );
                      } else if (state.transaction?.statusTransaction ==
                          "REQUEST_RETURN") {
                        return ButtonRequestReturnStatus(
                          cubit: cubit,
                        );
                      } else if (state.transaction?.statusTransaction ==
                          "REQUEST") {
                        return requestStatusButton(context, state, cubit);
                      } else {
                        return const SizedBox();
                      }
                    });
                  } else if (cubit.getRoleUser() == "ADMIN") {
                    return Builder(
                      builder: (BuildContext context) {
                        if (state.transaction?.statusTransaction ==
                            "REQUEST_RETURN") {
                          return FloatingActionButton.extended(
                              backgroundColor: AppColor.appColor.success,
                              onPressed: () {
                                popUpDialog(context,
                                    title:
                                        'Terima retur atau pengembalian barang',
                                    subtitle:
                                        'Anda akan menerima retur ${state.transaction?.noSuratJalan} dan mengembalikan barang ke gudang, lanjutkan?',
                                    yes: () {
                                  cubit.updateStatusItemRetur(
                                      statusItem: 'IN',
                                      statusTransaction: 'SUCCESS');
                                  context.pop();
                                }, no: () {
                                  context.pop();
                                });
                              },
                              label: SizedBox(
                                width: baseWidth - 100,
                                child: Center(
                                    child: Text(
                                  "TERIMA RETUR",
                                  style: AppFont.whiteLarge(context),
                                )),
                              ));
                        } else if (state.transaction?.statusTransaction ==
                            "REQUEST") {
                          return FloatingActionButton.extended(
                              backgroundColor: AppColor.appColor.warning,
                              onPressed: () {
                                popUpDialog(context,
                                    title: 'Batalkan Transaksi',
                                    subtitle:
                                        'Anda akan membatalkan transaksi ${state.transaction?.noSuratJalan} dan mengembalikan stok barang, lanjutkan?',
                                    yes: () {
                                  cubit.updateStatusItemRetur(
                                      statusItem: 'IN',
                                      statusTransaction: 'CANCELLED');
                                  context.pop();
                                }, no: () {
                                  context.pop();
                                });
                              },
                              label: SizedBox(
                                width: baseWidth - 100,
                                child: Center(
                                    child: Text(
                                  "BATALKAN",
                                  style: AppFont.whiteLarge(context),
                                )),
                              ));
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          );
        },
      ),
      appBar: AppBar(title: const Text("Detail Transaksi")),
      body: BlocBuilder<DetailTransactionCubit, DetailTransactionState>(
        builder: (context, state) {
          return ContainerStateHandler(
              refresherOptions: cubit.defaultRefresh,
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              status: state.status,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        return CustomButton(
                          onPressed: () {
                            showModalBottomSheet(
                                showDragHandle: true,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: baseHeight - 200,
                                    child: FullImageNetworkWidget(
                                      transaction: state.transaction!,
                                    ),
                                  );
                                });
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: ImageLoad(
                                  height: 300,
                                  width: baseWidth,
                                  imageUrl: Environment.showUrlImage(
                                      path: state.transaction?.signatureImage ??
                                          ""),
                                  fit: BoxFit.cover,
                                  errorWidget: const EmptyImageWidget())),
                        );
                      }),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: AppColor.appColor.warning.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          state.transaction?.statusTransaction ?? "-",
                          style: AppFont.smallBold(context)!
                              .copyWith(color: AppColor.appColor.warning),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.transaction?.noSuratJalan ?? "",
                            style: AppFont.largePrimary(context)!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                      Text(
                        state.transaction?.updated
                                ?.toddMMMyyyyHHmm()
                                .toString() ??
                            "",
                        style: AppFont.largePrimary(context)!
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      const Divider(thickness: 2),
                      const SizedBox(height: 8),
                      Text("Tujuan Transaksi",
                          style: AppFont.smallBold(context)),
                      const SizedBox(height: 2),
                      Text(
                        state.transaction?.transactionPurpose ?? "",
                        style: AppFont.large(context),
                      ),
                      const SizedBox(height: 12),
                      Text("Catatan", style: AppFont.smallBold(context)),
                      const SizedBox(height: 2),
                      Text(
                        state.transaction?.notes ?? "",
                        style: AppFont.large(context),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Teknisi yang bertugas",
                                  style: AppFont.smallBold(context)),
                              const SizedBox(height: 2),
                              Text(
                                state.transaction?.teknisi!
                                        .map((e) => e.username)
                                        .toList()
                                        .join(", ") ??
                                    "-",
                                style: AppFont.large(context),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Transaksi Dibuat Oleh",
                                  style: AppFont.smallBold(context)),
                              const SizedBox(height: 2),
                              Text(
                                state.transaction?.createdBy ?? "",
                                style: AppFont.large(context),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 8),
                      const Divider(thickness: 2),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          FilterButton(
                              title: "Barang",
                              isActive: state.showItemType == ShowItemType.bring
                                  ? true
                                  : false,
                              onPressed: () {
                                cubit.showItemType(ShowItemType.bring);
                              }),
                          FilterButton(
                              title: "Kendaraan",
                              isActive:
                                  state.showItemType == ShowItemType.installed
                                      ? true
                                      : false,
                              onPressed: () {
                                cubit.showItemType(ShowItemType.installed);
                              }),
                        ],
                      ),
                      (state.showItemType == ShowItemType.bring)
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.item.length,
                              itemBuilder: (context, index) {
                                var item = state.item[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                        RouteNames.installedVehicle,
                                        extra: {
                                          "id": item.idProductItem,
                                          "type": TypeInstalledBy.idProductItem
                                        });
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Row(children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColor
                                                      .appColor.primary),
                                              child: Text(
                                                (index + 1).toString(),
                                                style:
                                                    AppFont.whiteLarge(context),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.noProduct ?? "",
                                                  style: AppFont.largeBold(
                                                      context),
                                                ),
                                                Text(
                                                  "IMEI ${item.imei} | SN ${item.noSn}",
                                                  style:
                                                      AppFont.medium(context),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                                height: 30,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32),
                                                    color: AppColor
                                                        .appColor.primary
                                                        .withOpacity(0.2)),
                                                child: Center(
                                                    child: Text(
                                                        item.status
                                                                ?.toUpperCase() ??
                                                            "",
                                                        style:
                                                            AppFont.whiteLarge(
                                                                    context)!
                                                                .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColor
                                                              .appColor.primary,
                                                        ))))
                                          ]))),
                                );
                              },
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 12);
                              },
                              itemCount: state.listInstalationVehicle.length,
                              itemBuilder: (context, index) {
                                var instalation =
                                    state.listInstalationVehicle[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                        RouteNames.installedVehicle,
                                        extra: {
                                          "id": instalation.vehicleNo,
                                          "type": TypeInstalledBy.vehicleNo
                                        });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    width: baseWidth,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kendaraan ${instalation.vehicleName ?? ""}",
                                                  style: AppFont.mediumBold(
                                                      context),
                                                ),
                                                Text(
                                                  instalation.created!
                                                      .toddMMMyyyyHHmm(),
                                                  style: AppFont.small(context),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                  color: AppColor
                                                      .appColor.warning
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Text(
                                                instalation.status ?? "-",
                                                style:
                                                    AppFont.smallBold(context)!
                                                        .copyWith(
                                                            color: AppColor
                                                                .appColor
                                                                .warning),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(thickness: 1),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nama Barang ${instalation.name ?? ""}",
                                              style: AppFont.medium(context),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "Kode Barang ${instalation.noProduct ?? ""}",
                                              style: AppFont.medium(context),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "Imei ${instalation.imei ?? ""}",
                                              style: AppFont.medium(context),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "Serial Number ${instalation.noSn ?? ""}",
                                              style: AppFont.medium(context),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "No Lambung ${instalation.vehicleNo ?? ""}",
                                              style: AppFont.medium(context),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      const SizedBox(height: 80)
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  FloatingActionButton requestStatusButton(BuildContext context,
      DetailTransactionState state, DetailTransactionCubit cubit) {
    return FloatingActionButton.extended(
        backgroundColor: AppColor.appColor.success,
        onPressed: () {
          popUpDialog(context,
              title: 'Proses Transaksi',
              subtitle:
                  'Proses Transaksi ${state.transaction?.noSuratJalan} dan lakukan pemasangan barang',
              yes: () {
            cubit.updateTransaction("PROCESS");
            context.pop();
          }, no: () {
            context.pop();
          });
        },
        label: SizedBox(
          width: baseWidth - 100,
          child: Center(
              child: Text(
            "PROSES TRANSAKSI",
            style: AppFont.whiteLarge(context),
          )),
        ));
  }
}

class ButtonRequestReturnStatus extends StatelessWidget {
  const ButtonRequestReturnStatus({
    super.key,
    required this.cubit,
  });

  final DetailTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        heroTag: "tag1",
        backgroundColor: AppColor.appColor.success,
        onPressed: () {
          popUpDialog(context,
              title: "Batalkan Retur Barang",
              subtitle:
                  "Anda akan batalkan retur dan barang bisa dipasang kembali pada kendaraan",
              yes: () {
            cubit.updateTransaction("PROCESS");
            context.pop();
          }, no: () {
            context.pop();
          });
        },
        label: SizedBox(
          width: baseWidth - 100,
          child: Center(
            child: Text(
              "BATALKAN RETUR BARANG",
              style: AppFont.whiteLarge(context)!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}

class ButtonProcessStatus extends StatelessWidget {
  const ButtonProcessStatus({
    super.key,
    required this.state,
    required this.cubit,
  });
  final DetailTransactionState state;
  final DetailTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: FloatingActionButton.extended(
                heroTag: "tag1",
                backgroundColor: AppColor.appColor.success,
                onPressed: () {
                  popUpDialog(context,
                      title: state.item
                              .where((element) => element.status == "OUT")
                              .isEmpty
                          ? "Selesaikan Transaksi"
                          : "Ada barang sisa, selesaikan dan retur barang",
                      subtitle:
                          "Selesaikan transaksi, jika ada barang sisa, silakan kembalikan dan request retur, lanjutkan?",
                      yes: () {
                    cubit.updateTransaction(state.item
                            .where((element) => element.status == "OUT")
                            .isEmpty
                        ? "SUCCESS"
                        : "REQUEST_RETURN");
                    context.pop();
                  }, no: () {
                    context.pop();
                  });
                },
                label: SizedBox(
                  child: Center(
                    child: Text(
                      "Selesaikan Transaksi",
                      style: AppFont.whiteLarge(context)!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FloatingActionButton.extended(
                heroTag: "tag2",
                onPressed: () {
                  context
                      .pushNamed(RouteNames.listItemInstalation,
                          extra: cubit.params["id_transaction"])
                      .then((value) => cubit.initData());
                },
                label: SizedBox(
                  child: Center(
                    child: Text(
                      "Pasang Barang",
                      style: AppFont.whiteLarge(context)!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> popUpDialog(BuildContext context,
    {required String title,
    required String subtitle,
    required void Function() yes,
    required void Function() no}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: AppFont.largeBold(context),
        ),
        content: Text(
          subtitle,
          style: AppFont.medium(context),
        ),
        actions: [
          TextButton(
              onPressed: yes,
              child: Text(
                "YA",
                style: AppFont.largeBold(context)!
                    .copyWith(color: AppColor.appColor.success),
              )),
          TextButton(
            onPressed: no,
            child: Text(
              "BATAL",
              style: AppFont.largeBold(context)!
                  .copyWith(color: const Color.fromARGB(255, 99, 99, 99)),
            ),
          )
        ],
      );
    },
  );
}
