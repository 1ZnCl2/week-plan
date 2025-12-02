import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/providers/comprehensive_list_provider/editing_text_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/item_text_controller_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

final addComprehensiveListUsecaseProvider =
    Provider<Future<void> Function(DateTime)>((ref) {
  final db = ref.read(firestoreProvider);

  return (date) async {
    final service = (ComprehensiveListRepository(db));

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    final itemName = ref.read(itemTextControllerProvider).text;

    service.addTodo(ComprehensiveModel(
        id: '',
        uid: uid,
        content_name: itemName,
        date: date,
        is_completed: false));

    // 초기화라는 것을 합니다.
    ref.read(editingItemProvider.notifier).state = null;
    ref.read(itemTextControllerProvider).clear();
  };
});
