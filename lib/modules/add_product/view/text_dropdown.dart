import 'package:abditrack_inventory/data/models/base/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextDropdownWidget extends StatefulWidget {
  final List<Product> catalog;
  final TextEditingController controller;
  const TextDropdownWidget(
      {super.key, required this.catalog, required this.controller});

  @override
  State<TextDropdownWidget> createState() => _TextDropdownWidgetState();
}

class _TextDropdownWidgetState extends State<TextDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          label: Text("Pilih atau input nama barang"),
          suffixIcon: PopupMenuButton(
            icon: Icon(Icons.arrow_drop_down_circle),
            itemBuilder: (context) {
              return widget.catalog
                  .map((e) => PopupMenuItem(
                      onTap: () {
                        setState(() {
                          widget.controller.text = e.name.toString();
                        });
                      },
                      child: Text(e.name.toString())))
                  .toList();
              // PopupMenuItem(
              //   child: Text("data"),
              //   onTap: () {
              //     setState(() {
              //       controller.text = "data";
              //     });
              //   },
              // )
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
