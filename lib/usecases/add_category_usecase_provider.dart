import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/category_provider/editing_category_id_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/category/category_repository.dart';
import 'package:week_plan/service/add_category_service.dart';

final addCategoryUsecaseProvider = Provider<Future<void> Function()>((ref) {
  final db = ref.read(firestoreProvider);

  return () async {
    final service = AddCategoryService(CategoryRepository(db));

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    final existing = ref.read(categoryListStreamProvider).value ?? [];
    final color = pickUnusedColor(existing);

    final newId = await service.addCategory(
      uid,
      '',
      'icon',
      color.name,
    );

    ref.read(editingCategoryIdProvider.notifier).state = newId;
  };
});
