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
      decoration: BoxDecoration(
        color: AppColors.grey(1),
        border: Border.all(width: 1, color: AppColors.grey(4)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.home,
              text: '홈',
            ),
          ),
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.inbox,
              text: '백로그',
            ),
          ),
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.server,
              text: '저장소',
            ),
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
