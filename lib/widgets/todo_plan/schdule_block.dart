import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/weekly_todo_screen/impact_provider.dart';
import 'package:week_plan/widgets/todo_list/category_tag.dart';

class ScheduleBlock extends ConsumerWidget {
  final bool isNull;
  final String title;
  final String category;
  final String categoryColor;
  final DateTime deadline;
  final int impact;

  const ScheduleBlock(
      {super.key,
      required this.isNull,
      required this.title,
      required this.category,
      required this.categoryColor,
      required this.deadline,
      required this.impact});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 12,
      children: [
        Container(
          width: 186,
          height: 140,
          padding: EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: isNull ? AppColors.grey(4) : Color(0xFFA0A0A0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcon.star,
                  color:
                      Color(int.parse(ImpactSelection.returnColorHex(impact)))),
              SizedBox(height: 8),
              Text(
                title,
                style: isNull
                    ? AppFonts.colormediumTitle(size: 16, Color(0xFFA0A0A0))
                    : AppFonts.colormediumTitle(
                        size: 16,
                        AppColors.grey(9),
                      ),
              ),
              CategoryTag(categoryName: category, color: categoryColor),
              SizedBox(
                height: 16,
              ),
              Text(
                DateFormat('MM/dd HH:mm').format(deadline).toString(),
                style: isNull
                    ? AppFonts.colormediumTitle(size: 14, Color(0xFFA0A0A0))
                    : AppFonts.colormediumTitle(
                        size: 14,
                        AppColors.grey(9),
                      ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            GestureDetector(
              child: SvgPicture.asset(
                AppIcon.minusButton,
                colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: isNull ? 0.6 : 1.0),
                  BlendMode.modulate,
                ),
              ),
            ),
            Text('5/5'),
            GestureDetector(
              child: SvgPicture.asset(
                AppIcon.plusButton,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
