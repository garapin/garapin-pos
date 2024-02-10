import 'package:flutter/material.dart';

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
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
        child: TextButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                  width: 1.5,
                  color: isActive
                      ? Theme.of(context).primaryColor
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            )),
      ),
    );
  }
}
