import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';

class CurrentDivider extends StatelessWidget {
  const CurrentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DateTime.now().hour.toDouble() * 90 +
          DateTime.now().minute.toDouble() * 1.5,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 1260,
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
