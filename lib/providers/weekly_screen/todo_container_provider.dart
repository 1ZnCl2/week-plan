import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoContainerHandleProvider extends StateNotifier<bool> {
  TodoContainerHandleProvider() : super(true);

  void toggleHandler() {
    state = !state;
  }
}

final todoContainerHandleProvider =
    StateNotifierProvider<TodoContainerHandleProvider, bool>(
        (ref) => TodoContainerHandleProvider());
