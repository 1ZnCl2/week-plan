import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';

import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';

import 'package:week_plan/service/calendar_layout_service.dart';

import 'package:week_plan/usecases/add_schedule_from_block_provider.dart';
import 'package:week_plan/usecases/add_schedule_usecase_provider.dart';
import 'package:week_plan/usecases/delete_schedule_usecase_provider.dart';

final calendarInteractionControllerProvider =
    Provider<CalendarInteractionController>((ref) {
  return CalendarInteractionController(ref);
});

class CalendarInteractionController {
  CalendarInteractionController(this.ref);

  final Ref ref;
  static const _layout = CalendarLayoutService();

  void handleTapDown(DateTime weekBase, Offset localOffset) {
    final editingId = ref.read(editingScheduleIdProvider);

    if (editingId != null) {
      ref.read(deleteScheduleUsecaseProvider)(editingId);
    }

    final startTime = _layout.dateFromOffset(weekBase, localOffset);
    ref.read(tempTileProvider.notifier).create(startTime);
    ref.read(addScheduleUsecaseProvider)();
  }

  Future<void> handleBlockDrop(String? todoId, Offset localOffset) async {
    if (todoId == null || todoId.isEmpty) return;

    await ref.read(addScheduleFromBlockUsecaseProvider)(todoId, localOffset);
  }
}
