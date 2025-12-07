import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/sprint_stream_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_controller_provider.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';
import 'package:week_plan/service/add_weekly_todo_service.dart';

final addWeeklyTodoUsecaseProvider = Provider<Future<void> Function()>((ref) {
  debugPrint('add todo usecase is excuted');
  final db = ref.read(firestoreProvider);

  return () async {
    final service = AddWeeklyTodoService(
      WeeklyTodoRepository(db),
    );

    final uid = ref.read(uidProvider);
    final deadline = ref.read(dateTimePickerProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    debugPrint('current deadline : $deadline');
    final impact = 3;

    final newId = await service.addWeeklyTodo(
        uid, '', '미정', DateTime(2099, 12, 31, 23, 59), impact);

    ref.read(editingTodoIdProvider.notifier).state = newId;
  };
});
