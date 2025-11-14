import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';
import 'package:flutter/widgets.dart';

final GoRouter router = GoRouter(
  initialLocation: '/todo',
  routes: [
    GoRoute(
      path: '/todo',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: TodoListScreen(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/plan',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: TodoPlanerScreen(),
        transitionsBuilder: (context, animation, secondary, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
  ],
);

class RouterRoots {
  static const String todoList = '/todo';
  static const String todoPlanner = '/plan';
}
