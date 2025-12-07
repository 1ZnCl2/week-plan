import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';
import 'package:week_plan/repository/todo_block_repository.dart';
import 'package:week_plan/service/add_schedule_tile_service.dart';
import 'package:week_plan/service/add_todo_block_service.dart';

final copyTodoBlockUsecaseProvider = Provider<
    Future<void> Function(String todoId, DateTime deadline, String categoryName,
        String todoName, int impact, String categoryColor)>((ref) {
  final db = ref.read(firestoreProvider);

  return (todoId, deadline, categoryName, todoName, impact,
      categoryColor) async {
    final service = AddTodoBlockService(TodoBlockRepository(db));

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    final newId = await service.addTodoBlock(
        uid, todoId, deadline, categoryName, todoName, impact, categoryColor);

    debugPrint('$newId');
  };
});
