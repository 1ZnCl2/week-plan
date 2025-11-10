import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/widgets/todo_plan/day_timeline_column.dart';
import 'package:week_plan/widgets/todo_plan/schedule_tile.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
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
    default:
      return '';
  }
}

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ScheduleTile(
            startTime: DateTime(2025, 11, 10, 10, 0),
            endTime: DateTime(2025, 11, 10, 13, 0),
            color: AppColors.cyan(2),
            title: '웹툰 기획과 스토리 개발',
          ),
          Column(
            children: [
              Row(
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
              Row(
                children: [
                  DayTimelineColumn(
                    istimeshown: true,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                  DayTimelineColumn(
                    istimeshown: false,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
