import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';

class WeeklyTodoRepository {
  final FirebaseFirestore firestore;

  WeeklyTodoRepository(this.firestore);

  Stream<List<WeeklyTodoModel>> streamWeeklyTodos(String uid) {
    return firestore
        .collection('weekly_todos')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => WeeklyTodoModel.fromJson({
              ...doc.data(),
            }),
          )
          .toList();
    });
  }

  Future<String> addTodo(WeeklyTodoModel todo) async {
    final docRef = firestore.collection('weekly_todos').doc();
    final newTodo = todo.copyWith(todoId: docRef.id);

    await docRef.set(newTodo.toJson());

    return docRef.id;
  }

  Future<void> updateTodo(String id, String todoName, String category,
      DateTime deadline, int impact, bool isSprint) async {
    await firestore.collection('weekly_todos').doc(id).update({
      'todoName': todoName,
      'deadline': Timestamp.fromDate(deadline),
      'category': category,
      'impact': impact,
      'isSprint': isSprint,
    });
  }

  Future<void> completeTodo(String id, bool isCompleted) async {
    await firestore.collection('weekly_todos').doc(id).update({
      'isCompleted': !isCompleted,
      'isSprint': false,
    });
  }

  Future<void> deleteTodo(String id) async {
    await firestore.collection('weekly_todos').doc(id).delete();
  }
}
