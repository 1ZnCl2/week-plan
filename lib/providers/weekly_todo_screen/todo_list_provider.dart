import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoListNotifier, List>(
  (ref) => TodoListNotifier(),
);

class TodoListNotifier extends StateNotifier<List<WeeklyTodoModel>> {
  TodoListNotifier() : super([]);

  void addItemtoList(List<WeeklyTodoModel> newItems) {
    state = [...state, ...newItems];
  }

  void subtractItemtoList(WeeklyTodoModel targetItem) {
    state = [...state];
  }
}
