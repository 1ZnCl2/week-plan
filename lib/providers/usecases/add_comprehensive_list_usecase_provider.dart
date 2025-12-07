import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/providers/comprehensive_list_provider/editing_text_provider.dart';
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
    final newId = await service.addTodo(ComprehensiveModel(
        id: '', uid: uid, content_name: '', date: date, is_completed: false));

    if (newId == '') {
      debugPrint('$newId');
      return;
    }
    debugPrint('$newId');

    ref.read(editingItemProvider.notifier).state = newId;
  };
});
