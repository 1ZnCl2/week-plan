import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/widgets/todo_list/category_tag.dart';
import 'package:week_plan/widgets/todo_list/sub_task.dart';

class TodoCard extends StatelessWidget {
  static final defaultDeadline = DateTime(2999, 12, 31, 23, 59);

  final String title;
  final String category;
  final String id;
  final DateTime? deadline;
  final bool isCompleted;

  const TodoCard({
    super.key,
    required this.title,
    required this.category,
    required this.id,
    this.deadline,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 488,
        height: 165,
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
        ),
        child: Stack(
          children: [
            Container(
              width: 11,
              height: 165,
              decoration: BoxDecoration(
                color: AppColors.grey(7),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(AppIcon.square),
                        onTap: () {},
                      ),
                      SizedBox(height: 88),
                    ],
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
                          strutStyle: const StrutStyle(
                            fontSize: 20,
                            height: 1.0,
                            leading: 0,
                            forceStrutHeight: true,
                          ),
                        ),
                        CategoryTag(
                          categoryName: category,
                          color: AppColors.cyan(1),
                        ),
                        SizedBox(height: 6),
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
                        deadline != null
                            ? DateFormat('MM/dd HH:mm')
                                .format(deadline!)
                                .toString()
                            : '00/00 23:59',
                        style: AppFonts.greyTitle(null, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
