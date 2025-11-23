import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class AddScheduleBlock extends StatelessWidget {
  const AddScheduleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.grey(1),
        border: Border.all(color: AppColors.grey(5)),
      ),
      child: Text(
        '+ 더 가져오기',
        style: AppFonts.colormediumTitle(AppColors.grey(8), size: 14),
      ),
    );
  }
}
