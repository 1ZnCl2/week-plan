import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/widgets/todo_list/icon_text.dart';

class ComprehensiveListWidget extends StatelessWidget {
  final bool isToday;
  final String title;
  const ComprehensiveListWidget({
    super.key,
    required this.isToday,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 122,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isToday ? Color(0xFF91BFF6) : AppColors.grey(3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconText(
            iconPath: AppIcon.square,
            text: title,
            gap: 7,
          )
        ],
      ),
    );
  }
}
