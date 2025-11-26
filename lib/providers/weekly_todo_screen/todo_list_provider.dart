import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoListNotifier, List>(
  (ref) => TodoListNotifier(),
);

class TodoListNotifier extends StateNotifier<List<WeeklyTodoModel>> {
  TodoListNotifier() : super([]);

  void addItemtoList(WeeklyTodoModel newItem) {
    state = [...state, newItem];
  }

  void subtractItemtoList(WeeklyTodoModel targetItem) {
    state = [...state];
  }
}
