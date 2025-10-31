import 'package:flutter/material.dart';
import '../components/color_manage.dart';

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
      ),
      onPressed: onPressed,
      child: Text(
        categoryName,
        style: TextStyle(color: AppColors.grey(9)),
      ),
    );
  }
}
