import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/todo_block/todo_block_model.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/repository/todo_block_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

class AddTodoBlockService {
  final TodoBlockRepository blockRepo;

  AddTodoBlockService(this.blockRepo);

  Future<String> addTodoBlock(String uid, String todoId, DateTime deadline,
      String categoryId, String todoBlockName, int impact) async {
    if (uid == '') {
      return '';
    }

    final newId = await blockRepo.addTodoBlock(TodoBlockModel(
        todoId: todoId,
        uid: uid,
        deadline: deadline,
        todoBlockName: todoBlockName,
        todoBlockId: '',
        categoryId: categoryId,
        isAssigned: false,
        impact: impact));

    return newId;
  }
}
