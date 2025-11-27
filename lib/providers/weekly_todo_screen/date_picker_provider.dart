import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimePickerProvider =
    StateNotifierProvider<DatePickerWidgetNotifier, DateTime>(
        (ref) => DatePickerWidgetNotifier());

class DatePickerWidgetNotifier extends StateNotifier<DateTime> {
  DatePickerWidgetNotifier() : super(DateTime.now());

  void selectDate(DateTime selectedDate) {
    state = selectedDate;
  }

  void updateTime(TimeOfDay time) {
    state = state.copyWith(hour: time.hour, minute: time.minute);
  }

  void initializeDate() {
    state = DateTime.now();
  }
}
