import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/main_frame.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:week_plan/screens/main_frame.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(authStateProvider).value;

  return GoRouter(
    initialLocation: '/todo',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainFrame(child: child);
        },
        routes: [
          GoRoute(
            path: '/todo',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const TodoListScreen(),
              transitionsBuilder: _fade,
            ),
          ),
          GoRoute(
            path: '/plan',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const TodoPlanerScreen(),
              transitionsBuilder: _fade,
            ),
          ),
        ],
      ),
    ],
  );
});

Widget _fade(context, animation, secondary, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

class RouterRoots {
  static const String todoList = '/todo';
  static const String todoPlanner = '/plan';
}
