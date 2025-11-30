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
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .snapshots()
        .map((query) => query.docs
            .map((e) => ScheduleModel.fromDocumentSnapshot(e))
            .toList());
  }
}
