import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String category;
  final bool isCompleted;

  const TodoCard({
    Key? key,
    required this.title,
    required this.category,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      shadowColor: const Color.fromARGB(7, 0, 0, 0),
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? AppColors.green() : AppColors.grey(9),
        ),
        title: Text(
          title,
          style: AppFonts.blackTitle(size: 20),
        ),
      ),
    );
  }
}
