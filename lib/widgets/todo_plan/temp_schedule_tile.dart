import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';

class TempScheduleTile extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String title;
  final Color textColor;

  const TempScheduleTile({
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
      top: startTime.hour.toDouble() * 90 +
          startTime.minute.toDouble() * 90 / 60,
      left: (startTime.weekday.toDouble() - 1) * 180 + 20,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 12),
        width: 180,
        height: 90 *
            (endTime.hour +
                    endTime.minute / 60 -
                    startTime.hour -
                    startTime.minute / 60)
                .toDouble(),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppColors.grey(4), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 13),
            Row(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    AppIcon.square,
                  ),
                ),
                SizedBox(
                  width: 114,
                  child: Text(
                    title,
                    style: AppFonts.colormediumTitle(
                      size: 16,
                      textColor,
                    ),
                  ),
                ),
              ],
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
