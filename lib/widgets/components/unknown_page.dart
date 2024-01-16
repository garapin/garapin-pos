import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 Halaman Tidak Ditemukan',
          style: AppFont.largeBold(context),
        ),
      ),
    );
  }
}
