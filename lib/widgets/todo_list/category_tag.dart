import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';

class CategoryTag extends StatelessWidget {
  final String categoryName;
  final Color color;

  const CategoryTag({
    super.key,
    required this.categoryName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
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
      ),
    );
  }
}
