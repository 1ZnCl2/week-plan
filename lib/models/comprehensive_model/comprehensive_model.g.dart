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
      content_name: json['content_name'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      is_completed: json['is_completed'] as bool,
    );

Map<String, dynamic> _$$ComprehensiveModelImplToJson(
        _$ComprehensiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'content_name': instance.content_name,
      'date': const TimestampConverter().toJson(instance.date),
      'is_completed': instance.is_completed,
    };
