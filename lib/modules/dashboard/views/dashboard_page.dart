import 'package:abditrack_inventory/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../engine/base/app.dart';
import '../../../widgets/widgets.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = baseWidth;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: PageStorage(
            bucket: context.read<DashboardCubit>().bucket,
            child: state.currentScreen,
          ),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomNavigation(
                items: [
                  BottomNavigationItemData(
                      label: 'Beranda',
                      icon: const Icon(Icons.home),
                      activeIcon: Icon(
                        Icons.home,
                        color: AppColor.appColor.primary,
                      )),
                  BottomNavigationItemData(
                      label: 'Produk',
                      icon: const Icon(Icons.store),
                      activeIcon: Icon(
                        Icons.store,
                        color: AppColor.appColor.primary,
                      )),
                  BottomNavigationItemData(
                      label: 'Keranjang',
                      icon: const Icon(Icons.shopping_bag_outlined),
                      activeIcon: Icon(
                        Icons.shopping_bag,
                        color: AppColor.appColor.primary,
                      )),
                  BottomNavigationItemData(
                      label: 'Transaksi',
                      icon: const Icon(Icons.outbond),
                      activeIcon: Icon(Icons.outbond,
                          color: AppColor.appColor.primary)),
                  BottomNavigationItemData(
                      label: 'Profile',
                      icon: const Icon(Icons.person),
                      activeIcon:
                          Icon(Icons.person, color: AppColor.appColor.primary))
                ],
                onChangePage: context.read<DashboardCubit>().changeTab,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Colors.grey,
                currentPage: state.currentTab,
              ),
            ],
          ),
        );
      },
    );
  }
}

// class DashboardPage extends GetResponsiveView<DashboardController> {
//   DashboardPage({super.key}) : super(alwaysUseBuilder: false);
//
//   @override
//   Widget? phone() {
//     return Obx(() {
//       return Scaffold(
//         body: PageStorage(
//           bucket: controller.bucket,
//           child: controller.currentScreen.value,
//         ),
//         bottomNavigationBar: BottomAppBar(
//           notchMargin: 5,
//           shape: const CircularNotchedRectangle(),
//           clipBehavior: Clip.antiAlias,
//           child: BottomNavigationBar(
//             currentIndex: controller.currentTab.value,
//             unselectedItemColor: Colors.grey,
//             selectedItemColor: Colors.blueAccent,
//             onTap: controller.changeTab,
//             type: BottomNavigationBarType.fixed,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.cancel),
//                 label: 'Beranda',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.cancel),
//                 label: 'Profil',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.cancel),
//                 label: 'Produk',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.cancel),
//                 label: 'Galeri',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.cancel),
//                 label: 'Kontak',
//               ),
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: controller.onClickProduct,
//         ),
//         resizeToAvoidBottomInset: false,
//       );
//     });
//   }
//
//   @override
//   Widget? desktop() {
//     return const Scaffold(
//       body: Center(child: Icon(Icons.key)),
//     );
//   }
// }