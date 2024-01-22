import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../engine/base/app.dart';
import '../../themes/themes.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationItemData> items;
  final Function(int index) onChangePage;
  final Color? selectedColor;
  final Color? unselectedColor;
  final int currentPage;
  final String? centerTitle;

  const BottomNavigation({
    super.key,
    required this.items,
    required this.onChangePage,
    this.selectedColor,
    this.unselectedColor,
    required this.currentPage,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    double width = baseWidth;

    List<Widget> list = List.generate(
      items.length,
      (index) => _ItemNavigation(
        data: items[index],
        index: index,
        onChangePage: onChangePage,
        isSelected: currentPage == index,
        selectedColor: selectedColor,
        unselectedColor: unselectedColor,
      ),
    );

    if (list.length % 2 == 0) {
      int indexInsert = (list.length / 2).floor();
      Widget additional = const SizedBox.shrink();
      // if (centerTitle != null && centerTitle!.isNotEmpty) {
      //   additional = SizedBox(
      //     width: width,
      //     height: width * 0.15,
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(height: width * 0.01),
      //         const Expanded(
      //           child: Center(
      //             child: Icon(Icons.menu, color: Colors.transparent),
      //           ),
      //         ),
      //         FittedBox(
      //           child: Text(
      //             '$centerTitle',
      //             style:
      //                 AppFont.medium(context)?.copyWith(color: unselectedColor),
      //           ),
      //         ),
      //         SizedBox(height: width * 0.01),
      //       ],
      //     ),
      //   );
      // }
      // list.insert(indexInsert, Expanded(child: additional));
    }
    return BottomAppBar(
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
    );
  }
}

class _ItemNavigation extends StatelessWidget {
  final BottomNavigationItemData data;
  final int index;
  final Function(int index) onChangePage;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;

  const _ItemNavigation({
    Key? key,
    required this.data,
    required this.index,
    required this.onChangePage,
    required this.isSelected,
    this.selectedColor,
    this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (kIsWeb) width = baseWidth;

    TextStyle? style =
        AppFont.medium(context)?.copyWith(color: unselectedColor);
    if (isSelected) {
      style = AppFont.medium(context)?.copyWith(color: selectedColor);
    }

    Widget finalIcon = Builder(
      builder: (ctx) {
        return isSelected ? data.activeIcon ?? data.icon : data.icon;
      },
    );

    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isSelected) onChangePage(index);
        },
        child: SizedBox(
          width: width,
          height: width * 0.15,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.01),
              Expanded(
                child: Center(child: finalIcon),
              ),
              FittedBox(child: Text(data.label, style: style)),
              SizedBox(height: width * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItemData {
  final String label;
  final Widget icon;
  final Widget? activeIcon;

  BottomNavigationItemData({
    required this.label,
    required this.icon,
    this.activeIcon,
  });
}
