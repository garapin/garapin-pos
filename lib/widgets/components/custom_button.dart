import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final Color? splashColor;
  final Color? highlightColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.customBorder,
    this.splashColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Padding(padding: padding ?? EdgeInsets.zero, child: child),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: borderRadius,
                customBorder: customBorder,
                splashColor: splashColor,
                highlightColor: highlightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
