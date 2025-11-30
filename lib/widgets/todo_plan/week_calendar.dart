import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/is_adding_schedule_tile_provider.dart';
import 'package:week_plan/providers/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/widgets/todo_plan/current_divider.dart';
import 'package:week_plan/widgets/todo_plan/day_timeline_column.dart';
import 'package:week_plan/widgets/todo_plan/schedule_tile.dart';
import 'package:week_plan/widgets/todo_plan/comprehensive_list.dart';
import 'package:week_plan/widgets/todo_plan/temp_schedule_tile.dart';
import 'package:week_plan/widgets/todo_plan/timeline_column.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

int weekdayFromDx(double dx) {
  const double colWidth = 180;
  return (dx / colWidth).toInt() + 1; // Monday = 1
}

DateTime dateFromDxDy(DateTime startDateOfWeek, int weekDay, double dy) {
  const double halfHourHeight = 45;
  int hour = (dy / 90).toInt();
  int minute = ((dy / 90 - hour) * 60).toInt();
  int day = startDateOfWeek.day + weekDay - 1;

  final startDateForTile = DateTime(
    startDateOfWeek.year,
    startDateOfWeek.month,
    day,
    hour,
    minute,
  );

  return startDateForTile;
}

String currentDayName(DayOfWeek day) {
  switch (day) {
    case DayOfWeek.sunday:
      return '일요일';
    case DayOfWeek.monday:
      return '월요일';
    case DayOfWeek.tuesday:
      return '화요일';
    case DayOfWeek.wednesday:
      return '수요일';
    case DayOfWeek.thursday:
      return '목요일';
    case DayOfWeek.friday:
      return '금요일';
    case DayOfWeek.saturday:
      return '토요일';
  }
}

class WeekCalendar extends ConsumerWidget {
  const WeekCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAddingScheduleTile = ref.watch(isAddingScheduleTileProvider);
    final tempStartTime = ref.watch(tempTileProvider);

    return Column(
      spacing: 9,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: DayOfWeek.values.map((day) {
              return Container(
                width: 180,
                height: 44,
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 69,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey(3),
                ),
                child: Center(
                  child: Text(
                    currentDayName(day),
                    style: AppFonts.blackTitle(
                      size: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            ComprehensiveListWidget(
              isToday: true,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
            ComprehensiveListWidget(
              isToday: false,
              title: '오늘의 할 일',
            ),
          ],
        ),
        SizedBox(
          height: 622,
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: (details) {
                          final localOffset =
                              details.localPosition; // Offset(dx, dy)
                          final dx = localOffset.dx;
                          final dy = localOffset.dy;
                          final day = weekdayFromDx(dx);
                          final tempStartTime =
                              dateFromDxDy(DateTime(2025, 12, 1), day, dy);

                          ref
                              .read(tempTileProvider.notifier)
                              .create(tempStartTime);
                          ref
                              .read(isAddingScheduleTileProvider.notifier)
                              .state = true;

                          print("x: $dx, y: $dy");
                        },
                        child: Row(
                          children: [
                            TimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                            DayTimelineColumn(),
                          ],
                        ),
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 10, 15, 0),
                        endTime: DateTime(2025, 11, 11, 18, 0),
                        color: AppColors.cyan(2),
                        textColor: Color(0xFF407283),
                        title: 'sample1',
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 11, 15, 0),
                        endTime: DateTime(2025, 11, 11, 18, 0),
                        color: AppColors.cyan(3),
                        textColor: Color(0xFF407283),
                        title: '컴퓨터 구조',
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 10, 10, 0),
                        endTime: DateTime(2025, 11, 10, 13, 0),
                        color: AppColors.cyan(3),
                        textColor: Color(0xFF407283),
                        title: '웹툰 기획과 스토리 개발',
                      ),
                      CurrentDivider(),
                      if (tempStartTime != null && isAddingScheduleTile)
                        TempScheduleTile(
                            startTime: tempStartTime.start,
                            endTime: tempStartTime.end,
                            color: AppColors.grey(1),
                            title: '새 일정 타일',
                            textColor: AppColors.grey(8)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
