import 'package:abditrack_inventory/engine/engine.dart';
import 'package:abditrack_inventory/modules/homepage/cubit/homepage_cubit.dart';
import 'package:abditrack_inventory/modules/transaction/list_transaction/view/transaction_card.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomepageCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Beranda"),
        ),
        body: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            return ContainerStateHandler(
              refresherOptions: cubit.defaultRefresh,
              loading: Center(
                child: CircularProgressIndicator(),
              ),
              status: DataStateStatus.success,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InItemWidget(
                            onPressed: () {
                              context.pushNamed(RouteNames.createProduct);
                            },
                            color: const Color.fromARGB(255, 25, 85, 135),
                            title: 'Daftarkan Produk',
                            subtitle: 'Daftarkan produk baru',
                            total: '',
                            icon: Icons.devices,
                          ),
                          const SizedBox(width: 4),
                          InItemWidget(
                            icon: Icons.build,
                            onPressed: () {
                              context.pushNamed(RouteNames.addUser);
                            },
                            color: Color.fromARGB(255, 197, 91, 21),
                            title: 'Daftarkan Teknisi',
                            subtitle: 'Untuk membuat akun teknisi',
                            total: '',
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InItemWidget(
                            icon: Icons.check,
                            onPressed: () {
                              context.pushNamed(RouteNames.addProduct);
                            },
                            color: Color.fromARGB(255, 49, 107, 50),
                            title: 'Barang Masuk',
                            subtitle: 'Input barang masuk',
                            total: '',
                          ),
                          const SizedBox(width: 4),
                          InItemWidget(
                            icon: Icons.exit_to_app,
                            onPressed: () {
                              context.pushNamed(RouteNames.addToCart);
                            },
                            color: AppColor.appColor.primary,
                            title: 'Barang Keluar',
                            subtitle: 'Input barang keluar',
                            total: '',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InItemWidget(
                            icon: Icons.fire_truck,
                            onPressed: () {
                              context
                                  .pushNamed(RouteNames.listVehicleInstalled);
                            },
                            color: const Color.fromARGB(255, 154, 141, 24),
                            title: 'Daftar Kendaraan',
                            subtitle: 'Input barang masuk',
                            total: '',
                          ),
                          const SizedBox(width: 4),
                          InItemWidget(
                            icon: Icons.shop,
                            onPressed: () {
                              context.pushNamed(RouteNames.listCustomer);
                            },
                            color: Color.fromARGB(255, 60, 60, 58),
                            title: 'Daftar Mitra',
                            subtitle: '',
                            total: '',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Perlu dikonfirmasi Anda",
                        style: AppFont.largeBold(context),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<HomepageCubit, HomepageState>(
                        builder: (context, state) {
                          return ContainerStateHandler(
                            loading: const SizedBox(),
                            status: state.status,
                            emptyOptions: EmptyOptions(
                                customEmpty: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              height: 70,
                              width: baseWidth,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  "Belum ada yang perlu dikonfirmasi",
                                  style: AppFont.large(context),
                                ),
                              ),
                            )),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.listTransaction.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return TransactionCard(
                                    data: state.listTransaction[index]);
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class InItemWidget extends StatelessWidget {
  final Color color;
  final String title;
  final dynamic Function()? onPressed;
  final String subtitle;
  final String total;
  final IconData icon;
  const InItemWidget({
    super.key,
    this.onPressed,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.total,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        borderRadius: BorderRadius.circular(12),
        onPressed: onPressed,
        child: SizedBox(
            height: 140,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 140,
                    width: 8,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 40, color: color),
                        const SizedBox(height: 12),
                        Text(
                          title,
                          style: AppFont.mediumBold(context)!
                              .copyWith(color: color),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 140,
                      width: 8,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
