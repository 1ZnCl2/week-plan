import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/repository/category/category_repository.dart';

class AddCategoryService {
  final CategoryRepository cateRepo;

  AddCategoryService(this.cateRepo);
  Future<String> addCategory(
      String uid, String categoryName, String icon, String colorHex) async {
    if (uid == '') {
      return '';
    }

    final newId = await cateRepo.addCategory(CategoryModel(
        categoryId: '',
        categoryName: categoryName,
        uid: uid,
        colorHex: colorHex,
        icon: icon));

    return newId;
  }
}
