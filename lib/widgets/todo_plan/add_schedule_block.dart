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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.grey(4),
        border: Border.all(color: AppColors.grey(6)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '+ 더 가져오기',
        style: AppFonts.colormediumTitle(AppColors.grey(8), size: 14),
      ),
    );
  }
}
