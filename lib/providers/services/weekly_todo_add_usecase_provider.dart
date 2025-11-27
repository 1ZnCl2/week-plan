import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_provider.dart';
import 'package:week_plan/repository/user/user_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';
import 'package:week_plan/service/todo_list_screen/add_weekly_todo_service.dart';

final addWeeklyTodoUsecaseProvider =
    Provider<Future<void> Function(String, String)>((ref) {
  return (todoName, category) async {
    final service = AddWeeklyTodoService(
      WeeklyTodoRepository(),
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
    ref.read(isEditingProvider.notifier).state = false;
  };
});
