// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyTodoModelImpl _$$WeeklyTodoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyTodoModelImpl(
      todoId: json['todoId'] as String,
      todoName: json['todoName'] as String,
      category: json['category'] as String,
      uid: json['uid'] as String,
      isCompleted: json['isCompleted'] as bool,
      isSprint: json['isSprint'] as bool,
      includingSubtask: json['includingSubtask'] as bool?,
      refId: json['refId'] as String?,
      impact: (json['impact'] as num?)?.toInt(),
      deadline: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['deadline'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$WeeklyTodoModelImplToJson(
        _$WeeklyTodoModelImpl instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'todoName': instance.todoName,
      'category': instance.category,
      'uid': instance.uid,
      'isCompleted': instance.isCompleted,
      'isSprint': instance.isSprint,
      'includingSubtask': instance.includingSubtask,
      'refId': instance.refId,
      'impact': instance.impact,
      'deadline': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deadline, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
