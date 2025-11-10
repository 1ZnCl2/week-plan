import 'package:flutter/material.dart';
import '';

class ScheduleTile extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String title;

  const ScheduleTile({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 90 * (endTime.hour - startTime.hour).toDouble(),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
