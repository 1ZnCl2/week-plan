import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/timestamp_converter_function.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required String? scheduleId,
    required String scheduleName,
    required String refId,
    required String uid,
    required String categoryId,
    required String categoryColor,
    @TimestampConverter() required DateTime startTime,
    @TimestampConverter() required DateTime endTime,
    required bool isAllDay,
    required bool isCompleted,
  }) = _ScheduleModel;

  factory ScheduleModel.createWithoutId(
      {required String scheduleName,
      required DateTime startTime,
      required DateTime endTime,
      required String uid,
      required bool isAllDay,
      required bool isCompleted,
      required String categoryColor,
      required String? refId,
      required String categoryId}) {
    return ScheduleModel(
      scheduleId: '', // Repository가 나중에 채움
      scheduleName: scheduleName,
      startTime: startTime,
      endTime: endTime,
      uid: uid,
      isAllDay: isAllDay,
      isCompleted: isCompleted,
      categoryColor: categoryColor,
      refId: refId ?? '',
      categoryId: categoryId ?? '미정',
    );
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  factory ScheduleModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ScheduleModel(
      scheduleId: doc['scheduleId'],
      scheduleName: doc['scheduleName'],
      refId: doc['refId'],
      uid: doc['uid'],
      startTime: (doc['startTime'] as Timestamp).toDate(),
      endTime: (doc['endTime'] as Timestamp).toDate(),
      isAllDay: doc['isAllDay'],
      categoryColor: doc['categoryColor'] ?? 'black',
      isCompleted: doc['isCompleted'] ?? false,
      categoryId: doc['categoryId'] ?? '미정',
    );
  }
}
