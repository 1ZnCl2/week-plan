import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_controller_provider.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';
import 'package:week_plan/service/add_weekly_todo_service.dart';

final deleteWeeklyTodoUsecaseProvider =
    Provider<Future<void> Function(String, String)>((ref) {
  final db = ref.read(firestoreProvider);
  return (todoName, category) async {
    final service = AddWeeklyTodoService(
      WeeklyTodoRepository(db),
    );

    final uid = ref.read(uidProvider);
    if (uid == null) {
      return;
    }
    final deadline = ref.read(dateTimePickerProvider);
    final impact = 3;

    service.addWeeklyTodo(uid, todoName, category, deadline, impact);

    // 초기화라는 것을 합니다.
    ref.read(dateTimePickerProvider.notifier).initializeDate();
    ref.read(todoNameControllerProvider).clear();
    ref.read(isEditingTodoCardProvider.notifier).state = false;
  };
});
