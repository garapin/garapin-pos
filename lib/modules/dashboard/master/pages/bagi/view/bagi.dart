import 'package:flutter/material.dart';

import '../../../../../../engine/base/app.dart';
import '../../../../../../themes/themes.dart';

class BagiPage extends StatelessWidget {
  const BagiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 26),
            width: baseWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bagi - Bagi",
                      style: AppFont.largeBold(context),
                    ),
                    TextButton(
                        onPressed: () {}, child: Text("Create New Template"))
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 16),
            ])));
  }
}
