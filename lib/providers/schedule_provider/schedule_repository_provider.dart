import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/repository/schedule_repository.dart';

final scheduleRepositoryProvider = Provider((ref) {
  final db = ref.watch(firestoreProvider);
  return ScheduleRepository(db);
});
