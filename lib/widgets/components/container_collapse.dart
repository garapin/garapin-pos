import 'package:flutter/material.dart';

import '../../engine/base/app.dart';

class ContainerCollapse extends StatefulWidget {
  final String title;
  final Widget child;
  final TextStyle? titleStyle;

  const ContainerCollapse({
    Key? key,
    required this.title,
    required this.child,
    this.titleStyle,
  }) : super(key: key);

  @override
  State<ContainerCollapse> createState() => _ContainerCollapseState();
}

class _ContainerCollapseState extends State<ContainerCollapse> {
  bool _isCollapse = false;
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: baseWidth * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: baseWidth * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: widget.titleStyle),
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: InkWell(
                  onTap: () => setState(() {
                    _isCollapse = !_isCollapse;
                    _turns += 1.0 / 2.0;
                  }),
                  customBorder: const CircleBorder(),
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 500),
                    turns: _turns,
                    child: Padding(
                      padding: EdgeInsets.all(baseWidth * 0.02),
                      child: Icon(
                        Icons.expand_more,
                        size: baseWidth * 0.08,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: AnimatedCrossFade(
            firstChild: SizedBox(height: baseWidth * 0.02),
            secondChild: Padding(
              padding: EdgeInsets.all(baseWidth * 0.04),
              child: widget.child,
            ),
            crossFadeState: _isCollapse
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ],
    );
  }
}
