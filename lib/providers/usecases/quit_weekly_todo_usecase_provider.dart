import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

final quitTodoUsecaseProvider =
    Provider<Future<void> Function(String id, bool willQuit)>((ref) {
  final db = ref.read(firestoreProvider);

  return (id, willQuit) async {
    final repo = WeeklyTodoRepository(db);

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    repo.quitTodo(id, willQuit);
  };
});
