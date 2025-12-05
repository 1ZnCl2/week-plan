import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/timestamp_converter_function.dart';

part 'comprehensive_model.freezed.dart';
part 'comprehensive_model.g.dart';

@freezed
class ComprehensiveModel with _$ComprehensiveModel {
  factory ComprehensiveModel({
    required String id,
    required String uid,
    required String content_name,
    @TimestampConverter() required DateTime date,
    required bool is_completed,
  }) = _ComprehensiveModel;

  factory ComprehensiveModel.fromJson(Map<String, dynamic> json) =>
      _$ComprehensiveModelFromJson(json);

  factory ComprehensiveModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ComprehensiveModel(
      id: doc['id'],
      uid: doc['uid'],
      content_name: doc['content_name'],
      date: (doc['date'] as Timestamp).toDate(),
      is_completed: doc['is_completed'] ?? false,
    );
  }
}
