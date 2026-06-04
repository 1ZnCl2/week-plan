import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';

import 'package:week_plan/repository/schedule_repository.dart';
import 'package:week_plan/repository/todo_block_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

import 'package:week_plan/service/add_schedule_tile_service.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

final addScheduleFromBlockUsecaseProvider =
    Provider<Future<void> Function(String todoId, Offset position)>((ref) {
  final db = ref.read(firestoreProvider);

  return (todoId, position) async {
    final service = AddScheduleTileService(ScheduleRepository(db));
    final blockRepo = TodoBlockRepository(db);
    final todoRepo = WeeklyTodoRepository(db);
    final weekBase = ref.read(weekBaseDateProvider);

    debugPrint('this is $position');

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    const layout = CalendarLayoutService();
    final startTime = layout.dateFromOffset(weekBase, position);

    debugPrint('this is ${startTime.weekday} / $startTime');

    final block = await blockRepo.getRandomUnassignedBlock(todoId);
    if (block == null) {
      return;
    }
    blockRepo.assignTodoBlock(block.todoBlockId);
    todoRepo.assignTodo(todoId);

    final newId = await service.addSchedule(
        uid,
        block.todoBlockName,
        block.todoBlockId,
        block.categoryId,
        block.categoryColor,
        startTime,
        startTime.add(Duration(hours: 1)),
        false,
        false);

    debugPrint('$newId');

    ref.read(editingScheduleIdProvider.notifier).state = newId;
  };
});
