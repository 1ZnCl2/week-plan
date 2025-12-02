import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.iconPath,
    required this.text,
    required this.id,
    this.gap = 5,
  });

  final String iconPath;
  final String text;
  final double gap;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SvgPicture.asset(
            iconPath,
            color: AppColors.grey(7),
          ),
        ),
        SizedBox(width: gap),
        Text(
          text,
          style: AppFonts.greyTitle(AppColors.grey(7)),
        ),
      ],
    );
  }
}
