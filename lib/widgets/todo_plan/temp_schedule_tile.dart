import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/temp_schedule_tile_state_provider.dart';

class TempScheduleTile extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(tempTileProvider.notifier);
    return Positioned(
      top: startTime.hour.toDouble() * 90 +
          startTime.minute.toDouble() * 90 / 60,
      left: (startTime.weekday.toDouble() - 1) * 180 + 20,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) =>
                  notifier.startResize(d.localPosition.dy, startTime),
              onPanUpdate: (d) => notifier.updateStart(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 14, top: 12),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) =>
                  notifier.startResize(d.localPosition.dy, endTime),
              onPanUpdate: (d) => notifier.updateEnd(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
        ],
      ),
    );
  }
}
