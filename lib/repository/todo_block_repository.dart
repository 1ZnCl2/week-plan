import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week_plan/models/todo_block/todo_block_model.dart';

class TodoBlockRepository {
  final FirebaseFirestore firestore;

  TodoBlockRepository(this.firestore);

  Stream<List<TodoBlockModel>> streamTodoBlocks(String uid) {
    return firestore
        .collection('todo_blocks')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => TodoBlockModel.fromJson({
              ...doc.data(),
            }),
          )
          .toList();
    });
  }

  Future<bool> hasBlock(String todoId) async {
    final snapshot = await firestore
        .collection('todo_blocks')
        .where('todoId', isEqualTo: todoId)
        .limit(1)
        .get();

    debugPrint('${snapshot.docs.isNotEmpty}');
    return snapshot.docs.isNotEmpty;
  }

  Future<String> addTodoBlock(TodoBlockModel todo) async {
    final docRef = firestore.collection('todo_blocks').doc();
    final newTodo = todo.copyWith(todoBlockId: docRef.id);

    await docRef.set(newTodo.toJson());

    return docRef.id;
  }

  Future<void> updateTodoBlock(
      String id, String text, DateTime deadline, String categoryName) async {
    await firestore.collection('todo_blocks').doc(id).update({
      'todoName': text,
      'startTime': Timestamp.fromDate(deadline),
      'categoryId': categoryName,
    });
  }

  Future<void> assignTodoBlock(String id) async {
    await firestore
        .collection('todo_blocks')
        .doc(id)
        .update({'isAssigned': true});
  }

  Future<List<TodoBlockModel>> getBlocksByTodoId(String todoId) async {
    final snapshot = await firestore
        .collection('todo_blocks')
        .where('todoId', isEqualTo: todoId)
        .get();

    return snapshot.docs
        .map((doc) => TodoBlockModel.fromDocumentSnapshot(doc))
        .toList();
  }

  Future<int> countBlocksByTodoId(String todoId) async {
    final snapshot = await firestore
        .collection('todo_blocks')
        .where('todoId', isEqualTo: todoId)
        .get();

    return snapshot.size;
  }

  Future<TodoBlockModel?> getRandomUnassignedBlock(String todoId) async {
    final blocks = await getBlocksByTodoId(todoId);

    final unassigned = blocks.where((b) => !b.isAssigned).toList();
    if (unassigned.isEmpty) return null;

    unassigned.shuffle();
    return unassigned.first;
  }

  Future<void> deleteSchedule(String id) async {
    await firestore.collection('schedules').doc(id).delete();
  }

  Future<void> completeSchedule(String id, bool presentBool) async {
    await firestore.collection('schedules').doc(id).update({
      'isCompleted': !presentBool,
    });
  }
}
