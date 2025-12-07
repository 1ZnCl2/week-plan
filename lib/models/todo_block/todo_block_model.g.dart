// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoBlockModelImpl _$$TodoBlockModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoBlockModelImpl(
      todoBlockId: json['todoBlockId'] as String,
      todoBlockName: json['todoBlockName'] as String,
      todoId: json['todoId'] as String,
      uid: json['uid'] as String,
      categoryId: json['categoryId'] as String,
      deadline:
          const TimestampConverter().fromJson(json['deadline'] as Timestamp),
      isAssigned: json['isAssigned'] as bool,
      assignedScheduleId: json['assignedScheduleId'] as String?,
    );

Map<String, dynamic> _$$TodoBlockModelImplToJson(
        _$TodoBlockModelImpl instance) =>
    <String, dynamic>{
      'todoBlockId': instance.todoBlockId,
      'todoBlockName': instance.todoBlockName,
      'todoId': instance.todoId,
      'uid': instance.uid,
      'categoryId': instance.categoryId,
      'deadline': const TimestampConverter().toJson(instance.deadline),
      'isAssigned': instance.isAssigned,
      'assignedScheduleId': instance.assignedScheduleId,
    };
