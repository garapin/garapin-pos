import 'package:flutter/material.dart';

import '../../../../engine/engine.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/components/background_image.dart';

class CreateNewDatabasePage extends StatelessWidget {
  const CreateNewDatabasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgorundImageWidget(
      child: Container(
        width: 543,
        height: 328,
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 201, 201, 201),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create New Database",
              style: AppFont.largeBold(context)!.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 24),
            Text(
              "Silahkan masukan nama database baru anda",
              style: AppFont.medium(context)!.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Nama Database",
              style: AppFont.large(context)!.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 443,
              height: 42,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Masukan Nama Database',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(58),
                    borderSide: BorderSide(
                      color: Colors.blue, // Warna border
                      width: 1, // Lebar border
                    ),
                  ),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
                height: 48,
                width: baseWidth,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(58),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Create")))),
          ],
        ),
      ),
    );
  }
}
