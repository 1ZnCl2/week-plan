import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/timestamp_converter_function.dart';

part 'weekly_todo_model.freezed.dart';
part 'weekly_todo_model.g.dart';

@freezed
class WeeklyTodoModel with _$WeeklyTodoModel {
  factory WeeklyTodoModel({
    required String todoId,
    required String todoName,
    required String category,
    required String uid,
    required bool isCompleted,
    required bool isSprint,
    bool? includingSubtask,
    String? refId,
    int? impact,
    @TimestampConverter() DateTime? deadline,
  }) = _WeeklyTodoModel;

  factory WeeklyTodoModel.createWithoutId({
    required String todoName,
    required String category,
    required String uid,
    required bool isCompleted,
    required bool isSprint,
    bool? includingSubtask,
    String? refId,
    int? impact,
    DateTime? deadline,
  }) {
    return WeeklyTodoModel(
      todoId: '',
      category: category,
      uid: uid,
      isCompleted: isCompleted,
      isSprint: isSprint,
      impact: impact,
      todoName: todoName,
    );
  }

  factory WeeklyTodoModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyTodoModelFromJson(json);

  factory WeeklyTodoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return WeeklyTodoModel(
      todoName: doc['todo_name'] ?? '',
      todoId: doc['todo_id'],
      category: doc['category'],
      uid: doc['uid'],
      impact: doc['impact'],
      deadline: (doc['deadline'] as Timestamp).toDate(),
      isCompleted: doc['is_completed'],
      isSprint: doc['is_sprint'] ?? false,
      includingSubtask: doc['including_subtask'] ?? false,
      refId: doc['ref_id'] ?? '',
    );
  }
}
