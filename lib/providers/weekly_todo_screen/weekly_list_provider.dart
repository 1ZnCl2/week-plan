import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';

// 이후에 UI에서 사용하는 provider는 이걸로 통일하도록 수정하자. >> 아니야 얘 쓰면 반영이 안 된다. 하지 말자.
// 정적인 리스트!
final weeklyTodoListProvider = Provider<List<WeeklyTodoModel>>((ref) {
  final streamed = ref.watch(weeklyTodoStreamProvider);

  return streamed.value ?? [];
});
