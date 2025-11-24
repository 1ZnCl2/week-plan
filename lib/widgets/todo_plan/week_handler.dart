import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';

class WeekHandler extends StatelessWidget {
  const WeekHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(child: SvgPicture.asset(AppIcon.chevornLeft)),
        GestureDetector(
          child: Container(
            width: 55,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.grey(4),
                borderRadius: BorderRadius.circular(100)),
            child: Text('오늘', style: AppFonts.blackTitle(size: 14)),
          ),
        ),
        GestureDetector(child: SvgPicture.asset(AppIcon.chevornRight)),
      ],
    );
  }
}
