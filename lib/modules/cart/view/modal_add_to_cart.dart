import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/themes/themes.dart';

Future<void> modalAddToCart(BuildContext context,
    {TextEditingController? controller,
    void Function()? onSubmit,
    void Function()? onCancel}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Kuantitas'),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          textAlign: TextAlign.center,
          style: AppFont.large(context)!.copyWith(fontSize: 20),
          decoration: InputDecoration(hintText: 'Masukan Kuantitas'),
        ),
        actions: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(38),
            child: SizedBox(
                height: 40,
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                  child: const Text('Cancel'),
                )),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(38),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: onSubmit, child: const Text("Submit")),
            ),
          )
        ],
      );
    },
  );
}
