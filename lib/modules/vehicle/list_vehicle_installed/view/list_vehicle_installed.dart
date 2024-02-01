import 'package:abditrack_inventory/modules/vehicle/list_vehicle_installed/cubit/list_vehicle_installed_cubit.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes.dart';
import '../../../../themes/themes.dart';
import '../../../installed_vehicle/cubit/installed_vehicle_cubit.dart';

class ListVehicleInsalledPage extends StatelessWidget {
  const ListVehicleInsalledPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListVehicleInstalledCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Vehicle Terpasang"),
      ),
      body: BlocBuilder<ListVehicleInstalledCubit, ListVehicleInstalledState>(
        builder: (context, state) {
          return ContainerStateHandler(
            refresherOptions: cubit.defaultRefresh,
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              itemCount: state.vehicle.length,
              itemBuilder: (context, index) {
                var item = state.vehicle[index];
                return ListTile(
                  onTap: () {
                    context.pushNamed(RouteNames.installedVehicle, extra: {
                      "id": item.vehicleNo,
                      "type": TypeInstalledBy.vehicleNo
                    });
                  },
                  leading: const Icon(Icons.fire_truck),
                  title: Text(item.vehicleName ?? ""),
                  subtitle: Text(item.vehicleNo ?? ""),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: AppColor.appColor.primary.withOpacity(0.2)),
                    child: Center(
                        child: Text(item.mitraName ?? "",
                            style: AppFont.whiteLarge(context)!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.appColor.primary,
                            ))),
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
