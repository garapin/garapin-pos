import 'package:armory/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/components/bottom_navigation.dart';
import '../cubit/dashboard_teknisi_cubit.dart';

class DashboardTeknisiPage extends StatelessWidget {
  const DashboardTeknisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardTeknisiCubit, DashboardTeknisiState>(
      builder: (context, state) {
        return Scaffold(
          body: PageStorage(
            bucket: context.read<DashboardTeknisiCubit>().bucket,
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
                      activeIcon:
                          Icon(Icons.home, color: AppColor.appColor.primary)),
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
                onChangePage: context.read<DashboardTeknisiCubit>().changeTab,
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