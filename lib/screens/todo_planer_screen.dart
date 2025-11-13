import 'package:flutter/material.dart';
import 'package:week_plan/widgets/todo_plan/week_calendar.dart';

class TodoPlanerScreen extends StatelessWidget {
  const TodoPlanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WeekCalendar(),
      ),
    );
  }
}
