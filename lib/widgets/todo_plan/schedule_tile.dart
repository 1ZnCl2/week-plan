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
  final String color;
  final String title;
  final String categoryName;
  final String id;

  const ScheduleTile({
    super.key,
    required this.color,
    required this.title,
    required this.categoryName,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTileState = ref.watch(tempTileProvider);
    final editingId = ref.watch(editingScheduleIdProvider);

    // final isHovering = ref.watch(hoverScheduleProvider(id));

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, top: 29),
          width: 180,
          height: 90,
          decoration: BoxDecoration(
            color: Color(int.parse(
                CategoryColor.returnBackgroundColorfromColorName(color))),
            border: Border.all(
              color: Color(
                  int.parse(CategoryColor.returnTextColorfromColorName(color))),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
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
                    Color(int.parse(CategoryColor.returnTextColorfromColorName(
                        categoryName))),
                  ),
                ),
              ),
              /*    Text(
                  '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}~${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
                  style: AppFonts.greyTitle(
                    null,
                    size: 12,
                    bold: AppFonts.light,
                  ),
                ), */
            ],
          ),
        ),
      ],
    );
  }
}
