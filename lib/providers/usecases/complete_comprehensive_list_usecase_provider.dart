import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/comprehensive_list_provider/editing_text_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/item_text_controller_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

final completeComprehensiveListUsecaseProvider =
    Provider<Future<void> Function(String id, bool isCompleted)>((ref) {
  final db = ref.read(firestoreProvider);
  final service = (ComprehensiveListRepository(db));

  return (id, isCompleted) async {
    if (id == '') {
      debugPrint('uid is null');

      return;
    }

    service.completeTodo(id, isCompleted);

    ref.read(editingItemProvider.notifier).state = null;
    ref.read(itemTextControllerProvider).clear();
  };
});
