import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import '';

class ScheduleTile extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String title;
  final Color textColor;

  const ScheduleTile({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.title,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: startTime.hour.toDouble() * 90 + 44,
      left: (startTime.weekday.toDouble() - 1) * 180,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 29),
        width: 180,
        height: 90 *
            (endTime.hour +
                    endTime.minute / 60 -
                    startTime.hour -
                    startTime.minute / 60)
                .toDouble(),
        decoration: BoxDecoration(
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: SvgPicture.asset(
                AppIcon.square,
              ),
            ),
            SizedBox(height: 13),
            SizedBox(
              width: 114,
              child: Flexible(
                child: Text(
                  title,
                  style: AppFonts.colormediumTitle(
                    size: 16,
                    textColor,
                  ),
                ),
              ),
            ),
            Text(
              '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}~${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
              style: AppFonts.greyTitle(
                null,
                size: 12,
                bold: AppFonts.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
