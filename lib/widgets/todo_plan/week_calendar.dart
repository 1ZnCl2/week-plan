import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

import 'package:week_plan/providers/comprehensive_list_provider/comprehensive_list_provider.dart';
import 'package:week_plan/providers/google_auth/google_auth_state_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/providers/calendar_interaction_provider.dart';

import 'package:week_plan/service/block_drag_controller.dart';
import 'package:week_plan/service/group_dates.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

import 'package:week_plan/widgets/todo_plan/current_divider.dart';
import 'package:week_plan/widgets/todo_plan/day_timeline_column.dart';
import 'package:week_plan/widgets/todo_plan/drag_overlay_layer.dart';
import 'package:week_plan/widgets/todo_plan/comprehensive_list.dart';
import 'package:week_plan/widgets/todo_plan/temp_schedule_tile.dart';
import 'package:week_plan/widgets/todo_plan/timeline_column.dart';

class WeekCalendar extends ConsumerStatefulWidget {
  const WeekCalendar({super.key});

  @override
  ConsumerState<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends ConsumerState<WeekCalendar> {
  final _dragController = BlockDragController.instance;
  final _calendarBodyKey = GlobalKey();
  static const _layout = CalendarLayoutService();

  @override
  Widget build(
    BuildContext context,
  ) {
    final isLoggedIn = ref.watch(authStateProvider).value != null;
    final weekBase = ref.watch(weekBaseDateProvider);
    final asyncList = ref.watch(comprehensiveListStreamProvider(weekBase));
    final scheduleStreamed = ref.watch(streamScheduleProvider(weekBase));
    final _interactionController =
        ref.watch(calendarInteractionControllerProvider);

    return Column(
      spacing: 9,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: CalendarLayoutService.timeColumnWidth,
          ),
          child: Column(
            spacing: 9,
            children: [
              Row(
                children: DayOfWeek.values.asMap().entries.map((entry) {
                  final index = entry.key;
                  final day = entry.value;
                  final date = weekBase.add(Duration(days: index));

                  return Container(
                    width: CalendarLayoutService.dayColumnWidth,
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
                        '${date.month}/${date.day} ${_layout.currentDayName(day)}',
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
                      children: List.generate(CalendarLayoutService.daysPerWeek,
                          (index) {
                        return ComprehensiveListWidget(
                          isToday: false,
                        );
                      }),
                    );
                  }

                  return Row(
                    children: List.generate(CalendarLayoutService.daysPerWeek,
                        (index) {
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
          height: CalendarLayoutService.calendarBodyHeight - 37,
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        key: _calendarBodyKey,
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        onPanUpdate: (details) {
                          _dragController.updateDrag(details.globalPosition);
                        },
                        onPanEnd: (_) {
                          final dropPos = _localCalendarOffset(
                            _dragController.position,
                          );

                          _interactionController.handleBlockDrop(
                            _dragController.draggingTodoId,
                            dropPos,
                          );
                          _dragController.endDrag();
                        },
                        onTapDown: (details) {
                          _interactionController.handleTapDown(
                              weekBase, details.localPosition);
                        },
                        child: Row(
                          children: [
                            TimelineColumn(),
                            ...List.generate(
                              CalendarLayoutService.daysPerWeek,
                              (_) => DayTimelineColumn(),
                            ),
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

  Offset _localCalendarOffset(Offset globalOffset) {
    final renderBox =
        _calendarBodyKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.globalToLocal(globalOffset) ?? globalOffset;
  }
}
