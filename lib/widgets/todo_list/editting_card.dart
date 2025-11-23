import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/widgets/todo_list/add_category_tag.dart';
import 'package:week_plan/widgets/todo_list/category_tag.dart';
import 'package:week_plan/widgets/todo_list/sub_task.dart';

class EdittingCard extends StatelessWidget {
  const EdittingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      AppIcon.star,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 88),
                ],
              ),
              SizedBox(width: 9),
              SizedBox(
                width: 267,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    Text(
                      '할 일을 입력해 주세요.',
                      style: AppFonts.colormediumTitle(AppColors.grey(6)),
                      strutStyle: const StrutStyle(
                        fontSize: 20,
                        height: 1.0,
                        leading: 0,
                        forceStrutHeight: true,
                      ),
                    ),
                    AddCategoryTag(),
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AppIcon.blankedCalendar),
                      ),
                      Text(
                        '00/00 00:00',
                        style: AppFonts.greyTitle(null, size: 16),
                      ),
                    ],
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
