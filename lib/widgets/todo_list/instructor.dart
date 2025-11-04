import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/widgets/todo_list/icon_text.dart';

class Instructor extends StatelessWidget {
  const Instructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 728,
      width: 266,
      padding: const EdgeInsets.all(16.0),
      color: AppColors.grey(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconText(
            iconPath: AppIcon.inbox,
            text: '백로그',
          ),
          IconText(
            iconPath: AppIcon.server,
            text: '저장소',
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
