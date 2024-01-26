import 'package:abditrack_inventory/engine/base/app.dart';
import 'package:abditrack_inventory/routes/routes.dart';
import 'package:abditrack_inventory/themes/themes.dart';
import 'package:abditrack_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Beranda"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            InItemWidget(
              onPressed: () {
                context.pushNamed(RouteNames.createProduct);
              },
              color: Colors.blue,
              title: 'Daftarkan Produk',
              subtitle: 'Daftarkan produk baru',
              total: '',
              icon: Icons.add,
            ),
            const SizedBox(height: 4),
            InItemWidget(
              icon: Icons.arrow_upward,
              onPressed: () {
                context.pushNamed(RouteNames.addProduct);
              },
              color: Colors.green,
              title: 'Barang Masuk',
              subtitle: 'Input barang masuk',
              total: '',
            ),
            const SizedBox(height: 4),
            InItemWidget(
              icon: Icons.arrow_downward,
              onPressed: () {
                context.pushNamed(RouteNames.addToCart);
              },
              color: Colors.red,
              title: 'Barang Keluar',
              subtitle: 'Input barang keluar',
              total: '',
            ),
            InItemWidget(
              icon: Icons.people,
              onPressed: () {
                context.pushNamed(RouteNames.addUser);
              },
              color: Colors.orange,
              title: 'Daftarkan Teknisi',
              subtitle: 'Untuk membuat akun teknisi',
              total: '',
            ),
          ],
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
    return CustomButton(
      borderRadius: BorderRadius.circular(12),
      onPressed: onPressed,
      child: SizedBox(
          height: 80,
          width: baseWidth,
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 10,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12))),
                ),
                SizedBox(
                  width: baseWidth * 0.85,
                  child: ListTile(
                    leading: Icon(icon, size: 40),
                    title: Text(
                      title,
                      style: AppFont.largeBold(context),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: AppFont.medium(context),
                    ),
                    trailing: Text(
                      total,
                      style: AppFont.largeBold(context),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
