import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../themes/themes.dart';

class OutlineFormDropdown extends StatelessWidget {
  final Key uniqueKey;
  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  final String? suffixText;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem<dynamic>> items;
  final bool enabled;
  const OutlineFormDropdown({
    super.key,
    required this.name,
    required this.hintText,
    required this.items,
    this.label,
    this.initialValue,
    this.suffixText,
    this.validator,
    this.enabled = true,
    required this.uniqueKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${label}", style: AppFont.largeBold(context)),
              )
            : const SizedBox(),
        label != null ? const SizedBox(height: 8) : const SizedBox(),
        FormBuilderDropdown(
          enabled: enabled,
          key: UniqueKey(),
          validator: validator,
          initialValue: initialValue,
          name: name,
          items: items,
          decoration: InputDecoration(
            suffixText: suffixText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(58),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintStyle: const TextStyle(fontSize: 16),
            filled: true,
            fillColor: const Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
