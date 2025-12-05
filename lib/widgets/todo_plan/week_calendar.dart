import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/comprehensive_list_provider/comprehensive_list_provider.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_provider.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/usecases/add_comprehensive_list_usecase_provider.dart';
import 'package:week_plan/providers/usecases/add_schedule_usecase_provider.dart';
import 'package:week_plan/providers/usecases/delete_schedule_usecase_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/service/group_dates.dart';
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
    final weekBase = ref.watch(weekBaseDateProvider);
    final asyncList = ref.watch(comprehensiveListStreamProvider(weekBase));
    final scheduleStreamed = ref.watch(streamScheduleProvider(weekBase));
    final isEditingSchedule = ref.watch(isEditingScheduleTileProvider);
    final editingId = ref.watch(editingScheduleIdProvider);

    return Column(
      spacing: 9,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            spacing: 9,
            children: [
              Row(
                children: DayOfWeek.values.asMap().entries.map((entry) {
                  final index = entry.key;
                  final day = entry.value;

                  final date = weekBase.add(Duration(days: index));

                  return Container(
                    width: 180,
                    height: 44,
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey(3),
                    ),
                    child: Center(
                      child: Text(
                        '${date.month}/${date.day} ${currentDayName(day)}',
                        style: AppFonts.blackTitle(
                          size: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              asyncList.when(
                data: (list) {
                  final grouped = groupByDate(list);

                  return Row(
                    children: List.generate(7, (index) {
                      final date = weekBase.add(Duration(days: index));
                      final key = DateTime(date.year, date.month, date.day);
                      final itemsForThisDay = grouped[key] ?? [];

                      return ComprehensiveListWidget(
                        isToday: false,
                        today: date,
                        items: itemsForThisDay,
                      );
                    }),
                  );
                },
                loading: () => CircularProgressIndicator(),
                error: (e, st) => Text('에러: $e'),
              ),
            ],
          ),
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
                        onTap: () {},
                        onTapDown: (details) {
                          if (editingId != null) {
                            debugPrint('present id is : $editingId');
                            ref.read(deleteScheduleUsecaseProvider)(editingId);
                          }
                          final localOffset =
                              details.localPosition; // Offset(dx, dy)
                          final dx = localOffset.dx;
                          final dy = localOffset.dy;
                          final day = weekdayFromDx(dx);
                          final tempStartTime = dateFromDxDy(weekBase, day, dy);
                          ref
                              .read(tempTileProvider.notifier)
                              .create(tempStartTime);
                          ref.read(addScheduleUsecaseProvider)();
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
                      ...scheduleStreamed.when(
                        data: (list) {
                          return list.map((item) {
                            return TempScheduleTile(
                              color: AppColors.cyan(3),
                              textColor: const Color(0xFF407283),
                              title: item.scheduleName,
                              id: item.scheduleId ?? '',
                              startTime: item.startTime,
                              endTime: item.endTime,
                              isCompleted: item.isCompleted,
                            );
                          }).toList();
                        },
                        loading: () => [const CircularProgressIndicator()],
                        error: (e, st) => [Text('에러: $e')],
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 10, 15, 0),
                        endTime: DateTime(2025, 11, 11, 18, 0),
                        color: AppColors.cyan(2),
                        textColor: Color(0xFF407283),
                        title: 'sample1',
                        id: '',
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 11, 15, 0),
                        endTime: DateTime(2025, 11, 11, 18, 0),
                        color: AppColors.cyan(3),
                        textColor: Color(0xFF407283),
                        title: '컴퓨터 구조',
                        id: '',
                      ),
                      ScheduleTile(
                        startTime: DateTime(2025, 11, 10, 10, 0),
                        endTime: DateTime(2025, 11, 10, 13, 0),
                        color: AppColors.cyan(3),
                        textColor: Color(0xFF407283),
                        title: '웹툰 기획과 스토리 개발',
                        id: '',
                      ),
                      CurrentDivider(),
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
