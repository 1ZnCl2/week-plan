import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/widgets/todo_plan/add_schedule_block.dart';
import 'package:week_plan/widgets/todo_plan/schdule_block.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      decoration: BoxDecoration(
        color: AppColors.grey(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddScheduleBlock(),
          Row(
            children: [
              ScheduleBlock(isNull: false),
              ScheduleBlock(
                isNull: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
