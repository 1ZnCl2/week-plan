import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/weekly_list_provider.dart';
import 'package:week_plan/repository/todo_block_repository.dart';
import 'package:week_plan/service/add_todo_block_service.dart';

final sprintAutoCreatorProvider = Provider((ref) {
  ref.listen<List<WeeklyTodoModel>>(
    weeklyTodoListProvider,
    (previous, nextSprints) async {
      final firestore = ref.watch(firestoreProvider);
      final repo = TodoBlockRepository(firestore);
      final service = AddTodoBlockService(repo);
      final uid = ref.read(uidProvider);

      for (final todo in nextSprints) {
        if (todo.isSprint) {
          final hasBlock = await repo.hasBlock(todo.todoId);
          if (!hasBlock) {
            await service.addTodoBlock(
                uid ?? '',
                todo.todoId,
                todo.deadline ?? DateTime(2099, 12, 31, 23, 59),
                todo.category,
                todo.todoName,
                todo.impact ?? 0);
          }
        }
      }
    },
  );
});
