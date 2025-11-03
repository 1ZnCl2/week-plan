import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';
import '../../components/color_manage.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final Color color;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.categoryName,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        shadowColor: const Color.fromARGB(10, 0, 0, 0),
        backgroundColor: AppColors.grey(2),
      ),
      onPressed: onPressed,
      child: Text(
        categoryName,
        style: AppFonts.blackTitle(size: 16).copyWith(
          color: AppColors.grey(9),
        ),
      ),
    );
  }
}
