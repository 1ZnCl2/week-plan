import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(data: (user) {
      if (user != null) {
        return TodoPlanerScreen();
      } else {
        return TodoListScreen();
      }
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      );
    });
  }
}
