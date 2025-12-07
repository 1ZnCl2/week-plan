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

  bool isDateInWeek(DateTime date, DateTime baseWeekStart) {
    final start = _getThisWeekStart(baseWeekStart);
    final end = start.add(const Duration(days: 6));
    // 약간 지저분한데 나중에 고치든지 하자.
    final d = DateTime(date.year, date.month, date.day);

    return !d.isBefore(start) && !d.isAfter(end);
  }
}

final weekBaseDateProvider =
    StateNotifierProvider<WeekBaseDateNotifier, DateTime>((ref) {
  return WeekBaseDateNotifier();
});
