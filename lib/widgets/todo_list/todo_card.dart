import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/widgets/todo_list/category_tag.dart';
import 'package:week_plan/widgets/todo_list/sub_task.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String category;
  final bool isCompleted;

  const TodoCard({
    super.key,
    required this.title,
    required this.category,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 11,
          height: 165,
          decoration: BoxDecoration(
            color: AppColors.grey(7),
          ),
        ),
        Container(
          width: 488,
          height: 165,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.grey(3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(10, 0, 0, 0),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: SvgPicture.asset(AppIcon.square),
                onTap: () {},
              ),
              SizedBox(width: 9),
              SizedBox(
                width: 307,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    Text(
                      title,
                      style: AppFonts.blackTitle(),
                    ),
                    CategoryTag(
                      categoryName: category,
                      color: AppColors.cyan(1),
                    ),
                    SubTaskAddButton(),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          AppIcon.stopCircle,
                          color: AppColors.grey(7),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 14),
                      SvgPicture.asset(AppIcon.pencil),
                    ],
                  ),
                  SizedBox(height: 63),
                  Text(
                    '11/05 23:59',
                    style: AppFonts.greyTitle(size: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
