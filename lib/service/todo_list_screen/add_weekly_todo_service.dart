import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/repository/user/user_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

class AddWeeklyTodoService {
  final WeeklyTodoRepository todoRepo;
  final UserRepository userRepo;

  AddWeeklyTodoService(this.todoRepo, this.userRepo);

  void addWeeklyTodo(String Uid, String todoName, String category,
      DateTime deadline, int impact) {
    if (Uid == '') {
      return;
    }

    todoRepo.addTodo(WeeklyTodoModel(
        todoId: '',
        todoName: todoName,
        category: category,
        uid: Uid,
        isCompleted: false,
        isSprint: false));
  }
}
