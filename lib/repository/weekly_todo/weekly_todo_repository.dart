import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';

class WeeklyTodoRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<WeeklyTodoModel>> syncWeeklyTodo(String UId) async {
    final snapshot = await firestore
        .collection('weekly_todos')
        .where('uid', isEqualTo: UId)
        .get();

    return snapshot.docs
        .map((doc) => WeeklyTodoModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> addTodo(WeeklyTodoModel todo) async {
    final docRef = firestore.collection('weekly_todos').doc();
    final newTodo = todo.copyWith(todoId: docRef.id);

    await docRef.set(newTodo.toJson());
  }

  Future<void> deleteTodo(String id) async {
    await firestore.collection('weekly_todos').doc(id).delete();
  }
}
