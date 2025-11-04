import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String category;
  final bool isCompleted;

  const TodoCard({
    Key? key,
    required this.title,
    required this.category,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 488,
      height: 165,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.grey(3),
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
        children: [
          GestureDetector(
            child: SvgPicture.asset(AppIcon.square),
            onTap: () {},
          ),
          SizedBox(width: 9),
          Text(
            title,
            style: AppFonts.blackTitle(),
          ),
          SizedBox(width: 186),
          GestureDetector(
            child: SvgPicture.asset(
              AppIcon.stopCircle,
              color: AppColors.grey(2),
            ),
            onTap: () {},
          ),
          SizedBox(width: 14),
          SvgPicture.asset(AppIcon.pencil),
        ],
      ),
    );
  }
}
