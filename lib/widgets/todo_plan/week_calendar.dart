import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

import 'package:week_plan/providers/comprehensive_list_provider/comprehensive_list_provider.dart';
import 'package:week_plan/providers/google_auth/google_auth_state_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_provider.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

import 'package:week_plan/usecases/add_schedule_from_block_provider.dart';
import 'package:week_plan/usecases/add_schedule_usecase_provider.dart';
import 'package:week_plan/usecases/delete_schedule_usecase_provider.dart';

import 'package:week_plan/service/block_drag_controller.dart';
import 'package:week_plan/service/group_dates.dart';

import 'package:week_plan/widgets/todo_plan/current_divider.dart';
import 'package:week_plan/widgets/todo_plan/day_timeline_column.dart';
import 'package:week_plan/widgets/todo_plan/drag_overlay_layer.dart';
import 'package:week_plan/widgets/todo_plan/comprehensive_list.dart';
import 'package:week_plan/widgets/todo_plan/temp_schedule_tile.dart';
import 'package:week_plan/widgets/todo_plan/timeline_column.dart';

class WeekCalendar extends ConsumerStatefulWidget {
  @override
  ConsumerState<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends ConsumerState<WeekCalendar> {
  final _dragController = BlockDragController.instance;
  @override
  Widget build(
    BuildContext context,
  ) {
    final isLoggedIn = ref.watch(authStateProvider).value != null;
    final weekBase = ref.watch(weekBaseDateProvider);
    final asyncList = ref.watch(comprehensiveListStreamProvider(weekBase));
    final scheduleStreamed = ref.watch(streamScheduleProvider(weekBase));
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
                        '${date.month}/${date.day} ${CalendarLayoutService().currentDayName(day)}',
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
                  if (isLoggedIn) {
                    return Row(
                      children: List.generate(7, (index) {
                        return ComprehensiveListWidget(
                          isToday: false,
                        );
                      }),
                    );
                  }

                  return Row(
                    children: List.generate(7, (index) {
                      final date = weekBase.add(Duration(days: index));
                      final key = DateTime(date.year, date.month, date.day);
                      final itemsForThisDay = grouped[key] ?? [];
                      if (date == DateTime.now()) {
                        return ComprehensiveListWidget(
                          isToday: true,
                          today: date,
                          items: itemsForThisDay,
                        );
                      }

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
                        onPanUpdate: (details) {
                          _dragController.updateDrag(details.globalPosition);
                        },
                        onPanEnd: (details) {
                          final todoId = _dragController.draggingTodoId;
                          final dropPos = _dragController.position;

                          ref.read(addScheduleFromBlockUsecaseProvider)(
                              todoId ?? '', dropPos);
                          _dragController.endDrag();
                        },
                        onTapDown: (details) {
                          if (editingId != null) {
                            ref.read(deleteScheduleUsecaseProvider)(editingId);
                          }
                          final localOffset =
                              details.localPosition; // Offset(dx, dy)
                          final dx = localOffset.dx;
                          final dy = localOffset.dy;
                          final day = CalendarLayoutService().weekdayFromDx(dx);
                          final tempStartTime = CalendarLayoutService()
                              .dateFromDxDy(weekBase, day, dy);
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
                              categoryName: item.categoryId,
                              title: item.scheduleName,
                              id: item.scheduleId ?? '',
                              startTime: item.startTime,
                              endTime: item.endTime,
                              isCompleted: item.isCompleted,
                              color: item.categoryColor,
                            );
                          }).toList();
                        },
                        loading: () => [const CircularProgressIndicator()],
                        error: (e, st) => [Text('에러: $e')],
                      ),
                      CurrentDivider(),
                      DragOverlayLayer(controller: _dragController),
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
