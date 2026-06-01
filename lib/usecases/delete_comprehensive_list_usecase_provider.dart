import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/comprehensive_list_provider/editing_text_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/item_text_controller_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

final deleteComprehensiveListUsecaseProvider =
    Provider<Future<void> Function(String id)>((ref) {
  final db = ref.read(firestoreProvider);

  return (id) async {
    final service = (ComprehensiveListRepository(db));

    if (id == '') {
      debugPrint('uid is null');

      return;
    }

    service.deleteTodo(id);

    ref.read(editingItemProvider.notifier).state = null;
    ref.read(itemTextControllerProvider).clear();
  };
});
