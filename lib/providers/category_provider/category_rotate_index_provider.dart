import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryRotationState {
  final int index;
  final String name;
  final String color;

  CategoryRotationState(
      {required this.index, required this.name, required this.color});

  CategoryRotationState copyWith({int? index, String? name, String? color}) {
    return CategoryRotationState(
      index: index ?? this.index,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

class CategoryRotateIndexNotifier extends StateNotifier<CategoryRotationState> {
  CategoryRotateIndexNotifier()
      : super(CategoryRotationState(index: 0, name: '미정', color: 'black'));

  void rotate(int listLength, String newName, String color) {
    final newIndex = (state.index + 1) % listLength;
    state = state.copyWith(index: newIndex, name: newName, color: color);
  }
}

final categoryRotateIndexProvider =
    StateNotifierProvider<CategoryRotateIndexNotifier, CategoryRotationState>(
  (ref) => CategoryRotateIndexNotifier(),
);
