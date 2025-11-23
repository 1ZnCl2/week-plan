import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class AddCategoryTag extends StatelessWidget {
  const AddCategoryTag({
    super.key,
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
        color: AppColors.grey(4),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(10, 0, 0, 0),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(
        Icons.add,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}
