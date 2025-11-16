import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required String scheduleId,
    required String scheduleName,
    required String refId,
    required DateTime startTime,
    required DateTime endTime,
    required bool isAllDay,
    required bool isCompleted,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  factory ScheduleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ScheduleModel(
      scheduleId: doc['schedule_id'],
      scheduleName: doc['schedule_name'],
      refId: doc['ref_id'],
      startTime: (doc['start_time'] as Timestamp).toDate(),
      endTime: (doc['end_time'] as Timestamp).toDate(),
      isAllDay: doc['is_all_day'],
      isCompleted: doc['is_completed'] ?? false,
    );
  }
}
