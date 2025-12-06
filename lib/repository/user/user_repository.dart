import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/models/user/user_model.dart';
import 'package:week_plan/repository/category/category_repository.dart';

class UserRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  UserRepository(this.auth, this.db);

  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser() async {
    final user = auth.currentUser;
    if (user == null) {
      return;
    }

    final doc = db.collection('users').doc(user.uid);
    final snapshot = await doc.get();

    if (!snapshot.exists) {
      final newUser = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          displayedName: user.displayName ?? '');

      await doc.set(newUser.toJson());
    }
  }

  Future<void> makeUserDocumentIfFirst() async {
    final user = auth.currentUser;

    if (user == null) {
      return;
    }

    final doc = await _ref.doc(user.uid).get();

    if (!doc.exists) {
      await createUser();
    }
  }

  Future<void> ensureUserDocument() async {
    final user = auth.currentUser;
    if (user == null) {
      await Future.delayed(const Duration(milliseconds: 200));
    }

    final updatedUser = auth.currentUser;
    if (updatedUser == null) return;

    final docRef = db.collection('users').doc(updatedUser.uid);
    final doc = await docRef.get();

    if (!doc.exists) {
      final newUser = UserModel(
        uid: updatedUser.uid,
        email: updatedUser.email ?? '',
        displayedName: updatedUser.displayName ?? '',
      );

      await docRef.set(newUser.toJson());

      final defaulCategory = CategoryModel(
          categoryId: '',
          categoryName: '미정',
          colorHex: 'black',
          uid: updatedUser.uid,
          icon: 'icon');

      CategoryRepository(db).addCategory(defaulCategory);
    }
  }

  Future<UserModel?> getUserById(String uid) async {
    final doc = await _ref.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromDocumentSnapshot(doc);
    }
    return null;
  }
}
