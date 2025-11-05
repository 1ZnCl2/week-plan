import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final Color color;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 3),
          Text(
            categoryName,
            style: AppFonts.blackTitle(size: 14),
          ),
        ],
      ),
    );
  }
}
