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

    return SizedBox(
      height: 25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: GestureDetector(
              onTap: () async {
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: (selectedDate == DateTime(2099, 12, 31, 23, 59))
                      ? DateTime.now()
                      : selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );

                if (dateTime != null) {
                  ref
                      .read(dateTimePickerProvider.notifier)
                      .selectDate(dateTime);
                }

                final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    hour: 23,
                    minute: 59,
                  ),
                );

                if (timeOfDay != null) {
                  ref
                      .read(dateTimePickerProvider.notifier)
                      .updateTime(timeOfDay);
                }
              },
              child: SvgPicture.asset(AppIcon.blankedCalendar),
            ),
          ),
          Text(
            '${selectedDate.month}/${selectedDate.day} ${selectedDate.hour.toString().padLeft(2, '0')}:${selectedDate.minute.toString().padLeft(2, '0')}',
            style: AppFonts.greyTitle(null, size: 16),
          ),
        ],
      ),
    );
  }
}
