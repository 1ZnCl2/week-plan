import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/main_frame.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/todo',
    routes: [
      GoRoute(
        path: '/todo',
        builder: (context, state) => MainFrame(child: const TodoListScreen()),
      ),
      GoRoute(
          path: '/plan',
          builder: (context, state) =>
              MainFrame(child: const TodoPlanerScreen())),
    ],
  );
});

/* Widget _fade(context, animation, secondary, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
} */

class RouterRoots {
  static const String todoList = '/todo';
  static const String todoPlanner = '/plan';
}
