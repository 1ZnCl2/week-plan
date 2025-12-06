import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

class AddWeeklyTodoService {
  final WeeklyTodoRepository todoRepo;

  AddWeeklyTodoService(this.todoRepo);

  Future<String> addWeeklyTodo(String uid, String todoName, String category,
      DateTime deadline, int impact) async {
    if (uid == '') {
      return '';
    }

    final newId = await todoRepo.addTodo(WeeklyTodoModel(
        todoId: '',
        todoName: todoName,
        category: category,
        uid: uid,
        deadline: deadline,
        impact: impact,
        isCompleted: false,
        isSprint: false,
        doesQuit: false));

    return newId;
  }
}
