import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
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
      UserRepository(),
    );

    final Uid = ref.read(uidProvider);
    if (Uid == null) {
      return;
    }

    service.addWeeklyTodo(Uid, todoName, category, deadline);

    // Provider 상태 업데이트
    ref.read(todoListProvider.notifier).addItemtoList();
    ref.read(isEditingProvider.notifier).state = false;
  };
});
