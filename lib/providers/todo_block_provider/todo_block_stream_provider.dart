import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/models/todo_block/todo_block_model.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';
import 'package:week_plan/repository/todo_block_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

final todoBlocksStreamProvider = StreamProvider<List<TodoBlockModel>>((ref) {
  ref.keepAlive();

  final db = ref.read(firestoreProvider);
  final repo = TodoBlockRepository(db);
  final uid = ref.watch(uidProvider);

  if (uid == null) {
    return const Stream.empty();
  }

  return repo.streamTodoBlocks(uid);
});
