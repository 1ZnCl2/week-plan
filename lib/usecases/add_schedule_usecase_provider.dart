import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';
import 'package:week_plan/service/add_schedule_tile_service.dart';

final addScheduleUsecaseProvider = Provider<Future<void> Function()>((ref) {
  final db = ref.read(firestoreProvider);

  return () async {
    final service = AddScheduleTileService(ScheduleRepository(db));

    final uid = ref.read(uidProvider);

    if (uid == null) {
      debugPrint('uid is null');

      return;
    }
    final scheduleState = ref.read(tempTileProvider);

    if (scheduleState == null) {
      debugPrint('schedule state is null');
      return;
    }

    final newId = await service.addSchedule(uid, '', '', 'black', '미정',
        scheduleState.start, scheduleState.end, false, false);

    debugPrint('$newId');

    ref.read(editingScheduleIdProvider.notifier).state = newId;
  };
});
