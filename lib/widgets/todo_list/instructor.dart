import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/components/widgets/category_button.dart';
import 'package:week_plan/widgets/todo_list/icon_text.dart';

class Instructor extends StatelessWidget {
  const Instructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 728,
      width: 266,
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: AppColors.grey(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconText(
            iconPath: AppIcon.home,
            text: '홈',
          ),
          SizedBox(height: 16),
          IconText(
            iconPath: AppIcon.inbox,
            text: '백로그',
          ),
          SizedBox(height: 16),
          IconText(
            iconPath: AppIcon.server,
            text: '저장소',
          ),
          SizedBox(height: 8),
          Divider(
            color: AppColors.grey(4),
            thickness: 1,
          ),
          SizedBox(height: 8),
          Text(
            '카테고리 +',
            style: AppFonts.greyTitle(size: 16),
          ),
          CategoryButton(
            categoryName: '공부',
            color: AppColors.cyan(1),
            onPressed: () {},
          ),
          CategoryButton(
            categoryName: '일상',
            color: AppColors.mint(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
