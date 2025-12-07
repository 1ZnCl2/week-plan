import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/timestamp_converter_function.dart';

part 'todo_block_model.freezed.dart';
part 'todo_block_model.g.dart';

@freezed
class TodoBlockModel with _$TodoBlockModel {
  factory TodoBlockModel({
    required String todoBlockId,
    required String todoBlockName,
    required String todoId,
    required String uid,
    required String categoryId,
    required String categoryColor,
    @TimestampConverter() required DateTime deadline,
    required bool isAssigned,
    final String? assignedScheduleId,
    required final int impact,
  }) = _TodoBlockModel;

  factory TodoBlockModel.fromJson(Map<String, dynamic> json) =>
      _$TodoBlockModelFromJson(json);

  factory TodoBlockModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return TodoBlockModel(
      todoBlockId: doc['todoBlockId'],
      todoBlockName: doc['todoBlockName'],
      todoId: doc['todoId'],
      uid: doc['uid'],
      deadline: (doc['deadline'] as Timestamp).toDate(),
      isAssigned: doc['isAssigned'],
      categoryColor: doc['categoryColor'],
      categoryId: doc['categoryId'] ?? '미정',
      impact: doc['impact'] ?? 0,
      assignedScheduleId: doc['assignedScheduleId'] ?? '',
    );
  }
}
