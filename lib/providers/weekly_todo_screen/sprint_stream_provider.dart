import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';

final sprintTodoProvider = Provider<List<WeeklyTodoModel>>((ref) {
  final list = ref.watch(weeklyTodoStreamProvider).value ?? [];
  final baseWeek = ref.watch(weekBaseDateProvider);
  return list.where((todo) {
    final deadline =
        normalizeDate(todo.deadline ?? DateTime(2199, 12, 31, 23, 59));
    return isDateInWeek(baseWeek, deadline);
  }).toList();
});

DateTime normalizeDate(DateTime d) => DateTime(d.year, d.month, d.day);

bool isDateInWeek(DateTime target, DateTime baseWeekStart) {
  final start = normalizeDate(baseWeekStart);
  final end = start.add(const Duration(days: 6));
  final t = normalizeDate(target);

  return !t.isBefore(start) && !t.isAfter(end);
}
