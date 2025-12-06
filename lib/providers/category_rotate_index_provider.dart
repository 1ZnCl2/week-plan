import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/category/category_model.dart';

class CategoryRotateIndexNotifier extends StateNotifier<int> {
  CategoryRotateIndexNotifier() : super(0);

  void rotate(int listLength) {
    if (listLength == 0) return;
    state = (state + 1) % listLength;
  }
}

final categoryRotateIndexProvider =
    StateNotifierProvider<CategoryRotateIndexNotifier, int>(
        (ref) => CategoryRotateIndexNotifier());
