// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      uid: json['uid'] as String,
      colorHex: json['colorHex'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'uid': instance.uid,
      'colorHex': instance.colorHex,
      'icon': instance.icon,
    };
