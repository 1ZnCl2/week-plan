import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/category_provider/category_name_contoller_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';
import 'package:week_plan/repository/category/category_repository.dart';
import 'package:week_plan/service/add_category_service.dart';

final updateCategoryUsecaseProvider =
    Provider<Future<void> Function(String)>((ref) {
  debugPrint('add todo usecase is excuted');

  return (id) async {
    final repo = CategoryRepository();

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    final categoryName = ref.read(categoryNameControllerProvider).text;
    final categoryColor = ref.read(categoryColorProvider).name;

    repo.updateCategory(
      id,
      categoryName,
      'icon',
    );

    // 초기화라는 것을 합니다.
    ref.read(categoryNameControllerProvider).clear();
    ref.read(isEditingCategoryProvider.notifier).state = 1;
  };
});
