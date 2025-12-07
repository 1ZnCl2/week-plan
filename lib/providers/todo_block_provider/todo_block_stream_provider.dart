import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/todo_block/todo_block_model.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/todo_block_repository.dart';

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
