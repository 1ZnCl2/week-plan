import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/todo',
  routes: [
    GoRoute(
      path: '/todo',
      builder: (context, state) => TodoListScreen(),
    ),
    GoRoute(
      path: '/plan',
      builder: (context, state) => TodoPlanerScreen(),
    ),
  ],
);

class RouterRoots {
  static const String todoList = '/todo';
  static const String todoPlanner = '/plan';
}
