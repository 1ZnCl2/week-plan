import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimePickerProvider =
    StateNotifierProvider<DatePickerWidgetNotifier, DateTime>(
        (ref) => DatePickerWidgetNotifier());

class DatePickerWidgetNotifier extends StateNotifier<DateTime> {
  DatePickerWidgetNotifier() : super(DateTime.now());

  void selectDate(DateTime selectedDate) {
    state = selectedDate;

    debugPrint('selected as a $state');
  }

  void updateTime(TimeOfDay time) {
    state = state.copyWith(
        year: state.year,
        month: state.month,
        day: state.day,
        hour: time.hour,
        minute: time.minute);

    debugPrint('updated as a $state');
  }

  void initializeDate() {
    state = DateTime.now();
  }
}
