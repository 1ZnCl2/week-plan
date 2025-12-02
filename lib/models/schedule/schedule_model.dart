import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required String? scheduleId,
    required String scheduleName,
    required String refId,
    required String uid,
    required DateTime startTime,
    required DateTime endTime,
    required bool isAllDay,
    required bool isCompleted,
  }) = _ScheduleModel;

  factory ScheduleModel.createWithoutId({
    required String scheduleName,
    required DateTime startTime,
    required DateTime endTime,
    required String uid,
    required bool isAllDay,
    required bool isCompleted,
    String? refId,
  }) {
    return ScheduleModel(
      scheduleId: '', // Repository가 나중에 채움
      scheduleName: scheduleName,
      startTime: startTime,
      endTime: endTime,
      uid: uid,
      isAllDay: isAllDay,
      isCompleted: isCompleted,
      refId: refId ?? '',
    );
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  factory ScheduleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ScheduleModel(
      scheduleId: doc['schedule_id'],
      scheduleName: doc['schedule_name'],
      refId: doc['ref_id'],
      uid: doc['uid'],
      startTime: (doc['start_time'] as Timestamp).toDate(),
      endTime: (doc['end_time'] as Timestamp).toDate(),
      isAllDay: doc['is_all_day'],
      isCompleted: doc['is_completed'] ?? false,
    );
  }
}
