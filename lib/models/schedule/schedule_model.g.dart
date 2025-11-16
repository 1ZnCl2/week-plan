// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      scheduleId: json['scheduleId'] as String,
      scheduleName: json['scheduleName'] as String,
      category: json['category'] as String,
      refId: json['refId'] as String,
      uid: json['uid'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      isAllDay: json['isAllDay'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isRecurring: json['isRecurring'] as bool,
      isSprint: json['isSprint'] as bool,
      isPriority: json['isPriority'] as bool,
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'scheduleName': instance.scheduleName,
      'category': instance.category,
      'refId': instance.refId,
      'uid': instance.uid,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isAllDay': instance.isAllDay,
      'isCompleted': instance.isCompleted,
      'isRecurring': instance.isRecurring,
      'isSprint': instance.isSprint,
      'isPriority': instance.isPriority,
    };
