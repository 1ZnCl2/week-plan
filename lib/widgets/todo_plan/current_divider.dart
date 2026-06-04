import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

class CurrentDivider extends StatelessWidget {
  const CurrentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CalendarLayoutService().offsetFromDateTime(DateTime.now()).dy,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: CalendarLayoutService.weekContentWidth,
            height: 2,
            color: AppColors.cyan(2),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.cyan(2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
