import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class SprintBox extends StatelessWidget {
  const SprintBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 3, color: AppColors.cyan(2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          TodoCard(title: 'title', category: 'cate'),
        ],
      ),
    );
  }
}
