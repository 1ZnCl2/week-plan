import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/widgets/category_button.dart';
import 'package:week_plan/widgets/todo_plan/week_calendar.dart';
import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/widgets/todo_plan/week_handler.dart';

class TodoPlanerScreen extends StatelessWidget {
  const TodoPlanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 1260,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomSlider(),
                CategoryButton(
                    categoryName: 'categoryName',
                    color: AppColors.cyan(1),
                    onPressed: () {}),
                WeekHandler(),
              ],
            ),
          ),
          SizedBox(
            height: 11,
          ),
          SizedBox(width: 1280, child: WeekCalendar()),
        ],
      ),
    );
  }
}
