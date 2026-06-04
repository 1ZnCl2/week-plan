import 'package:flutter/material.dart';
import 'package:week_plan/service/calendar_layout_service.dart';

class DayTimelineColumn extends StatelessWidget {
  const DayTimelineColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(CalendarLayoutService.hoursPerDay, (hour) {
        return Container(
          width: CalendarLayoutService.dayColumnWidth,
          height: CalendarLayoutService.hourRowHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
        );
      }),
    );
  }
}
