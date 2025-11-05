import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class SubTaskAddButton extends StatelessWidget {
  final bool isCompleted;

  const SubTaskAddButton({
    super.key,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 130,
        height: 36,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: AppColors.grey(1),
          border: Border.all(
            color: AppColors.grey(6),
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Text(
          '+ 새 하위 할 일',
          style: AppFonts.greyTitle(size: 14),
        ),
      ),
    );
  }
}

class SubTask extends StatelessWidget {
  final String subTaskName;

  const SubTask({
    super.key,
    required this.subTaskName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        width: 130,
        height: 36,
        color: AppColors.grey(1),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey(5),
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          subTaskName,
          style: AppFonts.greyTitle(size: 14),
        ),
      ),
    );
  }
}
