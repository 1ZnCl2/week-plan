import 'package:flutter/material.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(24, (hour) {
          return Container(
            width: 189,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text('$hour:00'),
          );
        }),
      ),
    );
  }
}
