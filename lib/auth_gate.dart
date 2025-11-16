import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:week_plan/screens/todo_list_screen.dart';
import 'package:week_plan/screens/todo_planer_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 로그인됨 → HomePage
        if (snapshot.hasData) {
          return const TodoPlanerScreen();
        }

        // 로그인 안 됨 → LoginPage
        return const TodoListScreen();
      },
    );
  }
}
