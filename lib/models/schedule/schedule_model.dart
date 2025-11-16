import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required String scheduleId,
    required String scheduleName,
    required String category,
    required String refId,
    required String uid,
    required Timestamp startTime,
    required Timestamp endTime,
    required bool isAllDay,
    required bool isCompleted,
    required bool isRecurring,
    required bool isSprint,
    required bool isPriority,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  factory ScheduleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ScheduleModel(
      scheduleId: doc['schedule_id'],
      scheduleName: doc['schedule_name'],
      category: doc['category'],
      refId: doc['ref_id'],
      uid: doc['uid'],
      startTime: (doc['start_time'] as Timestamp).toDate(),
      endTime: (doc['end_time'] as Timestamp).toDate(),
      isAllDay: doc['is_all_day'],
      isCompleted: doc['is_completed'] ?? false,
      isRecurring: doc['is_recurring'] ?? false,
      isSprint: doc['is_sprint'] ?? false,
      isPriority: doc['is_priority'] ?? false,
    );
  }
}
