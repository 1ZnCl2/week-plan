import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/schedule/schedule_model.dart';

class ScheduleRepository {
  final FirebaseFirestore firestore;

  ScheduleRepository(this.firestore);

  Stream<List<ScheduleModel>> streamSchedules(String uid) {
    return firestore
        .collection('schedules')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => ScheduleModel.fromJson({
              ...doc.data(),
            }),
          )
          .toList();
    });
  }

  Stream<List<ScheduleModel>> watchSchedulesInRange(
      String uid, DateTime start, DateTime end) {
    return firestore
        .collection('schedules')
        .where('uid', isEqualTo: uid)
        .where('startTime', isLessThan: Timestamp.fromDate(end))
        .where('startTime', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .snapshots()
        .map((query) => query.docs
            .map((e) => ScheduleModel.fromDocumentSnapshot(e))
            .where((event) => event.endTime.isAfter(start)) // 끝나는 시간으로 필터
            .toList());
  }

  Future<String?> addSchedule(ScheduleModel todo) async {
    final docRef = firestore.collection('schedules').doc();
    final newTodo = todo.copyWith(scheduleId: docRef.id);

    await docRef.set(newTodo.toJson());

    return docRef.id;
  }

  Future<void> updateSchedule(
      String id, String text, DateTime startTime, DateTime endTime) async {
    await firestore.collection('schedules').doc(id).update({
      'scheduleName': text,
      'startTime': Timestamp.fromDate(startTime),
      'endTime': Timestamp.fromDate(endTime),
    });
  }

  Future<void> deleteSchedule(String id) async {
    await firestore.collection('schedules').doc(id).delete();
  }
}
