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
      padding: const EdgeInsets.symmetric(
        vertical: 72,
        horizontal: 27,
      ),
      color: AppColors.grey(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          IconText(
            iconPath: AppIcon.home,
            text: '홈',
          ),
          IconText(
            iconPath: AppIcon.inbox,
            text: '백로그',
          ),
          IconText(
            iconPath: AppIcon.server,
            text: '저장소',
          ),
          Divider(
            color: AppColors.grey(4),
            thickness: 1,
          ),
          Text(
            '카테고리 +',
            style: AppFonts.greyTitle(null, size: 16),
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
