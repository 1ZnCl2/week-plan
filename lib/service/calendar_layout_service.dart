import 'dart:ui';

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
  const CalendarLayoutService();

  static const int daysPerWeek = 7;
  static const int hoursPerDay = 24;
  static const double dayColumnWidth = 180;
  static const double timeColumnWidth = 20;
  static const double hourRowHeight = 90;
  static const double timeRowHeight = hourRowHeight;
  static const double calendarBodyHeight = 622;
  static const double comprehensiveListHeight = 122;
  static const double minScheduleTileHeight = 30;
  static const double adjustedCalendarBodyHeight = calendarBodyHeight - 37;

  static double get calendarContentHeight => hourRowHeight * hoursPerDay;
  static double get weekContentWidth =>
      timeColumnWidth + dayColumnWidth * daysPerWeek;

  int weekdayFromDx(double dx) {
    final dayIndex = ((dx - timeColumnWidth) / dayColumnWidth).floor();
    return dayIndex.clamp(0, daysPerWeek - 1).toInt() + 1; // Monday = 1
  }

  DateTime dateFromDxDy(DateTime startDateOfWeek, int weekDay, double dy) {
    final hourValue = dy / hourRowHeight;
    final hour = hourValue.floor().clamp(0, hoursPerDay - 1).toInt();
    final minute = ((hourValue - hour) * 60).floor().clamp(0, 59).toInt();

    return DateTime(
      startDateOfWeek.year,
      startDateOfWeek.month,
      startDateOfWeek.day,
      hour,
      minute,
    ).add(Duration(days: weekDay - 1));
  }

  DateTime dateFromOffset(DateTime startDateOfWeek, Offset offset) {
    return dateFromDxDy(
      startDateOfWeek,
      weekdayFromDx(offset.dx),
      offset.dy,
    );
  }

  Offset offsetFromDateTime(DateTime dateTime) {
    return Offset(
      timeColumnWidth + (dateTime.weekday - 1) * dayColumnWidth,
      dateTime.hour * hourRowHeight + dateTime.minute * hourRowHeight / 60,
    );
  }

  double heightFromDuration(DateTime start, DateTime end) {
    final minutes = end.difference(start).inMinutes;
    final height = minutes * hourRowHeight / 60;
    return height < minScheduleTileHeight ? minScheduleTileHeight : height;
  }

  int minutesFromVerticalDelta(double dy) {
    return (dy / hourRowHeight * 60).round();
  }

  int daysFromHorizontalDelta(double dx) {
    return (dx / dayColumnWidth).round();
  }

  String currentDayName(DayOfWeek day) {
    switch (day) {
      case DayOfWeek.sunday:
        return '\uC77C\uC694\uC77C';
      case DayOfWeek.monday:
        return '\uC6D4\uC694\uC77C';
      case DayOfWeek.tuesday:
        return '\uD654\uC694\uC77C';
      case DayOfWeek.wednesday:
        return '\uC218\uC694\uC77C';
      case DayOfWeek.thursday:
        return '\uBAA9\uC694\uC77C';
      case DayOfWeek.friday:
        return '\uAE08\uC694\uC77C';
      case DayOfWeek.saturday:
        return '\uD1A0\uC694\uC77C';
    }
  }
}
