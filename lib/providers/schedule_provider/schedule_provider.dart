import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/schedule/schedule_model.dart';
import 'package:week_plan/providers/schedule_provider/schedule_repository_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';

final streamScheduleProvider =
    StreamProvider.family<List<ScheduleModel>, DateTime>((ref, weekStart) {
  final repo = ref.watch(scheduleRepositoryProvider);
  final weekEnd = weekStart.add(const Duration(days: 7));
  final uid = ref.watch(uidProvider);

  return repo.watchSchedulesInRange(uid ?? '', weekStart, weekEnd);
});
