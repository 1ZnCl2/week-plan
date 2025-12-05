import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';

final completeScheduleUsecaseProvider =
    Provider<Future<void> Function(String id, bool isCompleted)>((ref) {
  final db = ref.read(firestoreProvider);

  return (id, isCompleted) async {
    final repo = ScheduleRepository(db);

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    repo.completeSchedule(id, isCompleted);
  };
});
