import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';

final updateScheduleUsecaseProvider = Provider<Future<void> Function()>((ref) {
  final db = ref.read(firestoreProvider);

  return () async {
    final repo = ScheduleRepository(db);

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }

    final scheduleName = ref.read(scheduleTileNameController).text;
    final scheduleState = ref.read(tempTileProvider);

    final editingId = ref.read(editingScheduleIdProvider);

    if (scheduleState == null) {
      return;
    }
    if (editingId != '' && editingId != null) {
      await repo.updateSchedule(
          editingId, scheduleName, scheduleState.start, scheduleState.end);
    }

    // 초기화라는 것을 합니다.
    ref.read(isEditingScheduleTileProvider.notifier).state = false;
    ref.read(scheduleTileNameController).clear();
    ref.read(tempTileProvider.notifier).clear();
  };
});
