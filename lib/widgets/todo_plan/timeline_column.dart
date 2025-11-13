import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class TimelineColumn extends StatelessWidget {
  const TimelineColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(24, (hour) {
        return Container(
          width: 20,
          height: 90,
          decoration: BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide(
              color: AppColors.grey(2),
              width: 0.5,
            )),
          ),
          child: Text(
            '$hour',
            style: AppFonts.colormediumTitle(AppColors.grey(6), size: 12),
            textAlign: TextAlign.end,
          ),
        );
      }),
    );
  }
}
