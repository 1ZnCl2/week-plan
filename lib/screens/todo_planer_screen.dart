import 'package:flutter/material.dart';
import 'package:week_plan/widgets/todo_plan/week_calendar.dart';
import 'package:week_plan/components/widgets/view_slider.dart';

class TodoPlanerScreen extends StatelessWidget {
  const TodoPlanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyCustomSlider(),
          WeekCalendar(),
        ],
      ),
    );
  }
}
