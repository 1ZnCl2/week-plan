import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/usecases/add_comprehensive_list_usecase_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';

class WeekHandler extends ConsumerWidget {
  const WeekHandler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekHandlerNotifier = ref.watch(weekBaseDateProvider.notifier);

    return Row(
      children: [
        GestureDetector(
            onTap: () {
              weekHandlerNotifier.moveToPreviousWeek();
            },
            child: SvgPicture.asset(AppIcon.chevornLeft)),
        GestureDetector(
          onTap: () {
            weekHandlerNotifier.setBaseDate(DateTime.now());
          },
          child: Container(
            width: 55,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.grey(4),
                borderRadius: BorderRadius.circular(100)),
            child: Text('오늘', style: AppFonts.blackTitle(size: 14)),
          ),
        ),
        GestureDetector(
            onTap: () {
              weekHandlerNotifier.moveToNextWeek();
            },
            child: SvgPicture.asset(AppIcon.chevornRight)),
      ],
    );
  }
}
