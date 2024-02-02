import 'package:armory/data/models/base/instalation_vehicle.dart';
import 'package:armory/data/models/base/item.dart';
import 'package:armory/modules/installed_vehicle/cubit/installed_vehicle_cubit.dart';
import 'package:armory/modules/product_detail/view/product_detail.dart';
import 'package:armory/themes/themes.dart';
import 'package:armory/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../engine/base/app.dart';
import '../../../engine/configs/environment.dart';
import '../../../resources/resources.dart';
import '../../transaction/detail_transaction/widget/full_image_network.dart';
import 'full_image_installed.dart';

class InstalledVehicle extends StatelessWidget {
  const InstalledVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InstalledVehicleCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kendaraan"),
      ),
      body: BlocBuilder<InstalledVehicleCubit, InstalledVehicleState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            status: state.status,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: CarouselSlider.builder(
                        itemCount: state.instalationVehicle.isEmpty
                            ? 0
                            : state.instalationVehicle.first.instalationImages
                                    ?.length ??
                                0,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            CustomButton(
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
                                    child: FullImageInstalled(
                                        image: state.instalationVehicle
                                            .map((e) =>
                                                e.instalationImages ??
                                                []) // Jika instalationImages null, gunakan list kosong
                                            .expand((images) => images)
                                            .toList()),
                                  );
                                });
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: ImageLoad(
                                  width: baseWidth,
                                  imageUrl: Environment.showUrlImage(
                                      path: state.instalationVehicle.first
                                              .instalationImages?[itemIndex] ??
                                          ""),
                                  fit: BoxFit.contain,
                                  errorWidget: Resources.images.armor
                                      .image(color: Colors.grey))),
                        ),
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    (state.instalationVehicle.isEmpty)
                        ? const SizedBox()
                        : VehicleWidget(item: state.instalationVehicle[0]),
                    const SizedBox(height: 24),
                    Text(
                      "Device Terpasang",
                      style: AppFont.largeBold(context),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.instalationVehicle.length,
                      itemBuilder: (context, index) {
                        var item = state.instalationVehicle[index];
                        return ItemWidget(
                          item: Item(
                              noProduct: item.noProduct ?? "",
                              name: item.name?.toUpperCase() ?? "",
                              imei: item.imei,
                              noSn: item.noSn,
                              status: item.status),
                          index: index,
                        );
                      },
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
}

class VehicleWidget extends StatelessWidget {
  const VehicleWidget({
    super.key,
    required this.item,
  });

  final InstalationVehicle item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: baseWidth,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Kendaraan",
            style: AppFont.largeBold(context),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.fire_truck,
                size: 46,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Kendaraan : ${item.vehicleName}",
                    style: AppFont.large(context),
                  ),
                  Text(
                    "No Lambung : ${item.vehicleNo}",
                    style: AppFont.large(context),
                  ),
                  Text(
                    "Memory : ${item.memory}",
                    style: AppFont.large(context),
                  ),
                  Text(
                    "Odo Meter : ${item.odoMeter}",
                    style: AppFont.large(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
