import 'package:flutter/material.dart';
import '../../themes/themes.dart';

class FilterButton extends StatelessWidget {
  final String title;

  final bool isActive;
  final void Function()? onPressed;
  const FilterButton({
    super.key,
    required this.title,
    required this.isActive,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: TextButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                width: 1.5,
                color: isActive
                    ? AppColor.appColor.primary
                    : Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              style: AppFont.mediumBold(context)!.copyWith(
                  color: isActive
                      ? AppColor.appColor.primary
                      : Colors.black.withOpacity(0.5)),
            ),
          )),
    );
  }
}
