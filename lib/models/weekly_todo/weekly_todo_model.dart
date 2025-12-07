import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/timestamp_converter_function.dart';

part 'weekly_todo_model.freezed.dart';
part 'weekly_todo_model.g.dart';

@freezed
class WeeklyTodoModel with _$WeeklyTodoModel {
  // 이후에 categoryId만 참조하도록 바꾸기
  factory WeeklyTodoModel({
    required String todoId,
    required String todoName,
    required String category,
    required String categoryColor,
    required String uid,
    required bool isCompleted,
    required bool isSprint,
    required bool doesQuit,
    required int blockCount,
    bool? includingSubtask,
    String? refId,
    int? impact,
    @TimestampConverter() DateTime? deadline,
  }) = _WeeklyTodoModel;

  factory WeeklyTodoModel.createWithoutId({
    required String todoName,
    required String category,
    required String categoryColor,
    required String uid,
    required bool isCompleted,
    required bool isSprint,
    required bool doesQuit,
    required int blockCount,
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
      doesQuit: doesQuit,
      impact: impact,
      todoName: todoName,
      blockCount: blockCount,
      categoryColor: categoryColor,
    );
  }

  factory WeeklyTodoModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyTodoModelFromJson(json);

  factory WeeklyTodoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return WeeklyTodoModel(
      todoName: doc['todo_name'] ?? '',
      todoId: doc['todo_id'],
      category: doc['category'],
      categoryColor: doc['categoryColor'],
      uid: doc['uid'],
      impact: doc['impact'],
      deadline: (doc['deadline'] as Timestamp).toDate(),
      isCompleted: doc['is_completed'],
      blockCount: doc['blockCount'] ?? 1,
      isSprint: doc['is_sprint'] ?? false,
      doesQuit: doc['does_quit'] ?? false,
      includingSubtask: doc['including_subtask'] ?? false,
      refId: doc['ref_id'] ?? '',
    );
  }
}
