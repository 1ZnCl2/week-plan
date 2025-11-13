import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';

class CurrentDivider extends StatelessWidget {
  const CurrentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DateTime.now().hour.toDouble() * 90 +
          DateTime.now().minute.toDouble() * 1.5,
      child: Container(
        width: 1260,
        height: 2,
        color: AppColors.cyan(2),
      ),
    );
  }
}
