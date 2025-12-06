import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_controller_provider.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

final updateWeeklyTodoUsecaseProvider =
    Provider<Future<void> Function(String, String)>((ref) {
  final db = ref.read(firestoreProvider);

  return (todoName, category) async {
    final repo = WeeklyTodoRepository(db);

    final uid = ref.read(uidProvider);
    final deadline = ref.read(dateTimePickerProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    final id = ref.read(editingTodoIdProvider);

    final impact = 3;

    if (id == '' || id == null) {
      return;
    }

    repo.updateTodo(id, todoName, category, deadline, impact);

    // 초기화라는 것을 합니다.
    ref.read(dateTimePickerProvider.notifier).initializeDate();
    ref.read(todoNameControllerProvider).clear();
    ref.read(editingTodoIdProvider.notifier).state = null;
  };
});
