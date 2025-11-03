import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/todo_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/todo',
  routes: [
    GoRoute(
      path: '/todo',
      builder: (context, state) => TodoListScreen(),
    ),
    GoRoute(
      path: '/plan',
    ),
  ],
);
