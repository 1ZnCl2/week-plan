import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/category_provider/category_name_contoller_provider.dart';
import 'package:week_plan/providers/category_provider/editing_category_id_provider.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_controller_provider.dart';
import 'package:week_plan/repository/category/category_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

final deleteCategoryUsecaseProvider =
    Provider<Future<void> Function(String)>((ref) {
  final db = ref.read(firestoreProvider);
  return (todoId) async {
    final repo = CategoryRepository(db);

    final uid = ref.read(uidProvider);
    if (uid == null) {
      return;
    }

    repo.deleteCategory(todoId);

    // 초기화라는 것을 합니다.
    ref.read(categoryNameControllerProvider).clear();
    ref.read(editingCategoryIdProvider.notifier).state = null;
    ref.read(isEditingCategoryProvider.notifier).state = 1;
  };
});
