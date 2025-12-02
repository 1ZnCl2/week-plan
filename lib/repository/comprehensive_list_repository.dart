import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';

class ComprehensiveListRepository {
  final FirebaseFirestore firestore;
  ComprehensiveListRepository(this.firestore);

  Stream<List<ComprehensiveModel>> watchComprehensiveListInRange(
      String uid, DateTime start, DateTime end) {
    debugPrint('watching Lists');
    return firestore
        .collection('comprehensive_lists')
        .where('uid', isEqualTo: uid)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .snapshots()
        .map((query) => query.docs
            .map((e) => ComprehensiveModel.fromDocumentSnapshot(e))
            .toList());
  }

  Future<String?> addTodo(ComprehensiveModel todo) async {
    final docRef = firestore.collection('comprehensive_lists').doc();
    final newTodo = todo.copyWith(id: docRef.id);

    await docRef.set(newTodo.toJson());
    return docRef.id;
  }

  Future<void> deleteTodo(String id) async {
    await firestore.collection('comprehensive_lists').doc(id).delete();
  }

  Future<void> updateTodo(String text, String id) async {
    await firestore
        .collection('comprehensive_lists')
        .doc(id)
        .update({'content_name': text});
  }

  Future<void> completeTodo(String id, bool isCompleted) async {
    await firestore
        .collection('comprehensive_lists')
        .doc(id)
        .update({'is_completed': !isCompleted});
  }
}
