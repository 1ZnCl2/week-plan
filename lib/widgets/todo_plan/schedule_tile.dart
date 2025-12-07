import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';

class ScheduleTile extends ConsumerWidget {
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String title;
  final String categoryName;
  final Color textColor;
  final String id;
  final String refId;

  const ScheduleTile({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.title,
    required this.categoryName,
    required this.textColor,
    required this.id,
    required this.refId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTileState = ref.watch(tempTileProvider);

    final editingId = ref.watch(editingScheduleIdProvider);
    final isEditing = editingId == id && tempTileState != null;
    final notifier = ref.watch(tempTileProvider.notifier);
    // final isHovering = ref.watch(hoverScheduleProvider(id));

    final start = isEditing ? tempTileState.start : startTime;
    final end = isEditing ? tempTileState.end : endTime;

    return Positioned(
      top: startTime.hour.toDouble() * 90,
      left: (startTime.weekday.toDouble() - 1) * 180 + 20,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12, top: 29),
            width: 180,
            height: 90 *
                (end.hour + end.minute / 60 - start.hour - start.minute / 60)
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
                  child: Text(
                    title,
                    style: AppFonts.colormediumTitle(
                      size: 16,
                      Color(int.parse(
                          CategoryColor.returnTextColorfromColorName(
                              categoryName))),
                    ),
                  ),
                ),
                Text(
                  '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}~${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
                  style: AppFonts.greyTitle(
                    null,
                    size: 12,
                    bold: AppFonts.light,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 55,
            bottom: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) {
                notifier.startDrag(d.globalPosition.dx, d.globalPosition.dy);
              },
              onPanUpdate: (d) => notifier.updateDrag(
                d.globalPosition.dx,
                d.globalPosition.dy,
              ),
              onPanEnd: (_) => notifier.endDrag(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (d) {
                FocusScope.of(context).unfocus();
                notifier.startResize(d.localPosition.dy);
              },
              onPanUpdate: (d) => notifier.updateStart(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (d) {
                notifier.startResize(d.localPosition.dy);
              },
              onPanUpdate: (d) => notifier.updateEnd(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
          /*   if (isHovering)
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 44,
                width: 44,
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(milliseconds: 150),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppIcon.trash),
                    ),
                    onTap: () {
                      ref.read(deleteScheduleUsecaseProvider)(widget.id);
                    },
                  ),
                ),
              ),
            ), */
        ],
      ),
    );
  }
}
