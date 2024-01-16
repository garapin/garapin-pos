import 'package:flutter/material.dart';

class VerticalDottedLine extends StatelessWidget {
  final double width;
  final Color? color;
  final double? padding;

  const VerticalDottedLine({
    Key? key,
    this.width = 1,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorDotted = color ?? Theme.of(context).textTheme.bodyMedium?.color;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          const dashHeight = 4.0;
          final dashWidth = width;
          final dashCount = (boxHeight / (2 * dashHeight)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: colorDotted),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
