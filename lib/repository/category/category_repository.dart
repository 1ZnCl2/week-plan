import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week_plan/models/category/category_model.dart';

class CategoryRepository {
  final FirebaseFirestore firestore;

  CategoryRepository(this.firestore);

  Stream<List<CategoryModel>> streamCategories(String uid) {
    return firestore
        .collection('categories')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => CategoryModel.fromJson({
              ...doc.data(),
            }),
          )
          .toList();
    });
  }

  Future<String> addCategory(CategoryModel todo) async {
    final docRef = firestore.collection('categories').doc();
    final newTodo = todo.copyWith(categoryId: docRef.id);

    await docRef.set(newTodo.toJson());

    return docRef.id;
  }

  Future<void> updateCategory(
      String id, String categoryName, String colorHex) async {
    await firestore.collection('categories').doc(id).update({
      'categoryName': categoryName,
      'impact': colorHex,
    });
  }

  Future<void> deleteCategory(String id) async {
    await firestore.collection('categories').doc(id).delete();
  }
}
