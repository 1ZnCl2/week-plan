// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      scheduleId: json['scheduleId'] as String?,
      scheduleName: json['scheduleName'] as String,
      refId: json['refId'] as String,
      uid: json['uid'] as String,
      categoryId: json['categoryId'] as String,
      categoryColor: json['categoryColor'] as String,
      startTime:
          const TimestampConverter().fromJson(json['startTime'] as Timestamp),
      endTime:
          const TimestampConverter().fromJson(json['endTime'] as Timestamp),
      isAllDay: json['isAllDay'] as bool,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'scheduleName': instance.scheduleName,
      'refId': instance.refId,
      'uid': instance.uid,
      'categoryId': instance.categoryId,
      'categoryColor': instance.categoryColor,
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'endTime': const TimestampConverter().toJson(instance.endTime),
      'isAllDay': instance.isAllDay,
      'isCompleted': instance.isCompleted,
    };
