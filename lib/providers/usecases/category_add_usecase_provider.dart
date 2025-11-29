import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/category_name_contoller_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_controller_provider.dart';
import 'package:week_plan/repository/category/category_repository.dart';
import 'package:week_plan/service/add_category_service.dart';

final categoryAddUsecaseProvider =
    Provider<Future<void> Function(String, String)>((ref) {
  debugPrint('add todo usecase is excuted');

  return (categoryName, color) async {
    final service = AddCategoryService(CategoryRepository());

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    service.addCategory(
      uid,
      categoryName,
      'icon',
      color,
    );

    // 초기화라는 것을 합니다.
    ref.read(categoryNameControllerProvider).clear();
    ref.read(isEditingCategoryProvider.notifier).state = 1;
  };
});
