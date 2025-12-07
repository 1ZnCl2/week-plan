import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

final comprehensiveListStreamProvider =
    StreamProvider.family<List<ComprehensiveModel>, DateTime>(
        (ref, DateTime weekBase) {
  ref.keepAlive();

  final db = ref.read(firestoreProvider);
  final repo = ComprehensiveListRepository(db);
  final uid = ref.watch(uidProvider);

  if (uid == null) {
    return const Stream.empty();
  }

  return repo.watchComprehensiveListInRange(
      uid, weekBase, weekBase.add(Duration(days: 7)));
});
