import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/weekly_todo_screen/date_picker_provider.dart';

class DatePickerWidget extends ConsumerStatefulWidget {
  const DatePickerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DatePickerWidgetState();
}

class _DatePickerWidgetState extends ConsumerState<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(dateTimePickerProvider);

    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            final DateTime? dateTime = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            );

            final TimeOfDay? timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(
                hour: 23,
                minute: 59,
              ),
            );

            if (dateTime != null) {
              ref
                  .read(dateTimePickerProvider.notifier)
                  .selectDate(selectedDate);
            }

            if (timeOfDay != null) {
              ref.read(dateTimePickerProvider.notifier).updateTime(timeOfDay);
            }
          },
          child: SvgPicture.asset(AppIcon.blankedCalendar),
        ),
        Text(
          '${selectedDate.month}/${selectedDate.day} ${selectedDate.hour}:${selectedDate.minute}',
          style: AppFonts.greyTitle(null, size: 16),
        ),
      ],
    );
  }
}
