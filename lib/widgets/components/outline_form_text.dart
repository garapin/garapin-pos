import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../themes/themes.dart';

class OutlineFormText extends StatelessWidget {
  final TextInputType? keyboardType;
  final String name;
  final String hintText;
  final String? initialValue;
  final String? label;
  final String? suffixText;
  final bool readOnly;
  final int? maxLength;
  final bool obscureText;
  final String? Function(String?)? validator;
  const OutlineFormText({
    super.key,
    required this.name,
    required this.hintText,
    this.label,
    this.obscureText = false,
    this.initialValue,
    this.suffixText,
    this.keyboardType,
    this.readOnly = false,
    this.validator,
    this.maxLength,
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
        FormBuilderTextField(
          obscureText: obscureText,
          readOnly: readOnly,
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          maxLength: maxLength,
          name: name,
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
