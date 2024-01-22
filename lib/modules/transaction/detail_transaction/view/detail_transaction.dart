import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/cubit/detail_transaction_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/detail_transaction/widget/full_image_network.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../resources/resources.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/empty_image.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailTransactionCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: cubit.getRoleUser() == "TEKNISI"
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: SizedBox(
                width: 300,
                child: Center(
                  child: Text(
                    "UPDATE PEMASANGAN SELESAI",
                    style: AppFont.whiteLarge(context)!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          : null,
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
                        if (state.showImageType == ShowImageType.instalation) {
                          return (state.transaction!.instalationImage!.isEmpty)
                              ? const EmptyImageWidget()
                              : InkWell(
                                  onTap: () {
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
                                  child: CarouselSlider.builder(
                                    itemCount: state
                                        .transaction?.instalationImage?.length,
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: ImageLoad(
                                                width: baseWidth,
                                                imageUrl: Environment.showUrlImage(
                                                    path: state.transaction!
                                                            .instalationImage![
                                                        itemIndex]),
                                                fit: BoxFit.contain,
                                                errorWidget: Resources
                                                    .images.armor
                                                    .image(
                                                        color: Colors.grey))),
                                    options: CarouselOptions(
                                      height: 300,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 1,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                );
                        } else {
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
                                        path:
                                            state.transaction?.signatureImage ??
                                                ""),
                                    fit: BoxFit.cover,
                                    errorWidget: const EmptyImageWidget())),
                          );
                        }
                      }),
                      Text(
                        "Pilih Gambar Yang tampil",
                        style: AppFont.largeBold(context),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          FilterButton(
                              title: "Gambar pemasangan",
                              isActive: state.showImageType ==
                                      ShowImageType.instalation
                                  ? true
                                  : false,
                              onPressed: () {
                                cubit.showTypeImage(ShowImageType.instalation);
                              }),
                          FilterButton(
                              title: "Tanda Tangan",
                              isActive:
                                  state.showImageType == ShowImageType.signature
                                      ? true
                                      : false,
                              onPressed: () {
                                cubit.showTypeImage(ShowImageType.signature);
                              }),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.transaction?.noSuratJalan ?? "",
                            style: AppFont.largePrimary(context)!
                                .copyWith(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color:
                                    AppColor.appColor.warning.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              state.transaction?.statusTransaction ?? "-",
                              style: AppFont.smallBold(context)!
                                  .copyWith(color: AppColor.appColor.warning),
                            ),
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
                      Text(
                        "Daftar Barang Dibawa",
                        style: AppFont.largeBold(context),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.item.length,
                        itemBuilder: (context, index) {
                          var item = state.item[index];
                          return Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.appColor.primary),
                                      child: Text(
                                        (index + 1).toString(),
                                        style: AppFont.whiteLarge(context),
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
                                          style: AppFont.largeBold(context),
                                        ),
                                        Text(
                                          "IMEI ${item.imei} | SN ${item.noSn}",
                                          style: AppFont.medium(context),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            color: AppColor.appColor.primary
                                                .withOpacity(0.2)),
                                        child: Center(
                                            child: Text(
                                                item.status?.toUpperCase() ??
                                                    "",
                                                style:
                                                    AppFont.whiteLarge(context)!
                                                        .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColor.appColor.primary,
                                                ))))
                                  ])));
                        },
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
