import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

class ScheduleTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // final isHovering = ref.watch(hoverScheduleProvider(id));

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, top: 29),
          width: CalendarLayoutService.dayColumnWidth,
          height: CalendarLayoutService.hourRowHeight,
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
