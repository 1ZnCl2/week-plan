import 'package:flutter/material.dart';

class DayTimelineColumn extends StatelessWidget {
  final istimeshown;
  const DayTimelineColumn({
    super.key,
    required this.istimeshown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(24, (hour) {
        return Container(
          width: 180,
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: istimeshown ? Text('$hour:00') : null,
        );
      }),
    );
  }
}
