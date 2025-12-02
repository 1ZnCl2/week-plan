import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeekBaseDateNotifier extends StateNotifier<DateTime> {
  WeekBaseDateNotifier() : super(_getThisWeekStart(DateTime.now()));

  static DateTime _getThisWeekStart(DateTime date) {
    final weekday = date.weekday;
    final diff = weekday - DateTime.monday;
    return DateTime(date.year, date.month, date.day)
        .subtract(Duration(days: diff));
  }

  void moveToNextWeek() {
    state = state.add(const Duration(days: 7));
  }

  void moveToPreviousWeek() {
    state = state.subtract(const Duration(days: 7));
  }

  /// 임의의 날짜를 받아 "그 날짜 기준 주"로 이동
  void setBaseDate(DateTime date) {
    state = _getThisWeekStart(date);
  }
}

final weekBaseDateProvider =
    StateNotifierProvider<WeekBaseDateNotifier, DateTime>((ref) {
  return WeekBaseDateNotifier();
});
