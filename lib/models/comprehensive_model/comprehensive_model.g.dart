// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comprehensive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComprehensiveModelImpl _$$ComprehensiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ComprehensiveModelImpl(
      id: json['id'] as String,
      uid: json['uid'] as String,
      contentName: json['contentName'] as String,
      date: DateTime.parse(json['date'] as String),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$ComprehensiveModelImplToJson(
        _$ComprehensiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'contentName': instance.contentName,
      'date': instance.date.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
