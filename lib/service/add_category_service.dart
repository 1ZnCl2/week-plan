import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/repository/category/category_repository.dart';
import 'package:week_plan/repository/user/user_repository.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

class AddCategoryService {
  final CategoryRepository cateRepo;

  AddCategoryService(this.cateRepo);
  void addCategory(
      String uid, String categoryName, String icon, String colorHex) {
    if (uid == '') {
      return;
    }

    cateRepo.addCategory(CategoryModel(
        categoryId: '',
        categoryName: categoryName,
        uid: uid,
        colorHex: colorHex,
        icon: icon));
  }
}
