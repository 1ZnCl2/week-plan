import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimePickerProvider =
    StateNotifierProvider<DatePickerWidgetNotifier, DateTime>(
        (ref) => DatePickerWidgetNotifier());

class DatePickerWidgetNotifier extends StateNotifier<DateTime> {
  DatePickerWidgetNotifier() : super(DateTime.now());

  void selectDate(DateTime selectedDate) {
    state = selectedDate;
  }

  void initializeDate() {
    state = DateTime.now();
  }
}
