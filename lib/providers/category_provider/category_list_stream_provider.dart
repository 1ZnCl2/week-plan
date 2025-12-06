import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/user_provider/user_provider.dart';
import 'package:week_plan/repository/category/category_repository.dart';

final categoryListStreamProvider = StreamProvider<List<CategoryModel>>((ref) {
  final db = ref.read(firestoreProvider);

  final repo = CategoryRepository(db);
  final uid = ref.watch(uidProvider);

  if (uid == null) {
    return const Stream.empty();
  }

  return repo.streamCategories(uid);
});
