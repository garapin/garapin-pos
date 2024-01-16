import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(BuildContext context,
    {String? title,
    String? content,
    void Function()? cancel,
    void Function()? ok}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Dialog tidak dapat ditutup dengan mengetuk di luar dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? 'Konfirmasi'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content ?? 'Apakah Anda yakin ingin melanjutkan?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(onPressed: cancel, child: const Text('Batal')),
          TextButton(child: const Text('Ya'), onPressed: ok),
        ],
      );
    },
  );
}
