import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/repository/schedule_repository.dart';

final deleteScheduleUsecaseProvider =
    Provider<Future<void> Function(String id)>((ref) {
  final db = ref.read(firestoreProvider);

  return (id) async {
    final repo = ScheduleRepository(db);

    if (id == '') {
      debugPrint('uid is null');

      return;
    }

    await repo.deleteSchedule(id);

    ref.read(editingScheduleIdProvider.notifier).state = null;
    ref.read(scheduleTileNameController).clear();
  };
});
