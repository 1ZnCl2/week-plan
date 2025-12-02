import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

class AddComprehensiveListService {
  final ComprehensiveListRepository comRepo;

  AddComprehensiveListService(this.comRepo);
  void addCategory(String uid, String todoName, DateTime date) {
    if (uid == '') {
      return;
    }

    comRepo.addTodo(ComprehensiveModel(
        id: '',
        uid: uid,
        content_name: todoName,
        date: date,
        is_completed: false));
  }
}
