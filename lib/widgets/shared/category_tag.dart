import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';

class CategoryTag extends StatelessWidget {
  final String categoryName;
  final String color;

  const CategoryTag({
    super.key,
    required this.categoryName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 22,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color:
            Color(int.parse(CategoryColor.returnTagColorfromColorName(color))),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(10, 0, 0, 0),
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        categoryName,
        style: AppFonts.blackTitle(size: 10),
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
      ),
    );
  }
}
