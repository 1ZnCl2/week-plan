import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'comprehensive_model.freezed.dart';
part 'comprehensive_model.g.dart';

@freezed
class ComprehensiveModel with _$ComprehensiveModel {
  factory ComprehensiveModel({
    required String id,
    required String uid,
    required String contentName,
    required DateTime date,
    required bool isCompleted,
  }) = _ComprehensiveModel;

  factory ComprehensiveModel.fromJson(Map<String, dynamic> json) =>
      _$ComprehensiveModelFromJson(json);

  factory ComprehensiveModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ComprehensiveModel(
      id: doc['id'],
      uid: doc['uid'],
      contentName: doc['content_name'],
      date: (doc['date'] as Timestamp).toDate(),
      isCompleted: doc['is_completed'] ?? false,
    );
  }
}
