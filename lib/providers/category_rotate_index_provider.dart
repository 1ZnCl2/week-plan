import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/models/category/category_model.dart';

class CategoryRotationState {
  final int index;
  final String name;

  CategoryRotationState({required this.index, required this.name});

  CategoryRotationState copyWith({int? index, String? name}) {
    return CategoryRotationState(
      index: index ?? this.index,
      name: name ?? this.name,
    );
  }
}

class CategoryRotateIndexNotifier extends StateNotifier<CategoryRotationState> {
  CategoryRotateIndexNotifier()
      : super(CategoryRotationState(index: 0, name: ''));

  void rotate(int listLength, String newName) {
    final newIndex = (state.index + 1) % listLength;
    state = state.copyWith(index: newIndex, name: newName);
  }
}

final categoryRotateIndexProvider =
    StateNotifierProvider<CategoryRotateIndexNotifier, CategoryRotationState>(
  (ref) => CategoryRotateIndexNotifier(),
);
