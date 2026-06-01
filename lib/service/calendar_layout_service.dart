enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class CalendarLayoutService {
  int weekdayFromDx(double dx) {
    const double colWidth = 180;
    return (dx / colWidth).toInt() + 1; // Monday = 1
  }

  DateTime dateFromDxDy(DateTime startDateOfWeek, int weekDay, double dy) {
    int hour = (dy / 90).toInt();
    int minute = ((dy / 90 - hour) * 60).toInt();
    int day = startDateOfWeek.day + weekDay - 1;

    final startDateForTile = DateTime(
      startDateOfWeek.year,
      startDateOfWeek.month,
      day,
      hour,
      minute,
    );

    return startDateForTile;
  }

  String currentDayName(DayOfWeek day) {
    switch (day) {
      case DayOfWeek.sunday:
        return '일요일';
      case DayOfWeek.monday:
        return '월요일';
      case DayOfWeek.tuesday:
        return '화요일';
      case DayOfWeek.wednesday:
        return '수요일';
      case DayOfWeek.thursday:
        return '목요일';
      case DayOfWeek.friday:
        return '금요일';
      case DayOfWeek.saturday:
        return '토요일';
    }
  }
}
