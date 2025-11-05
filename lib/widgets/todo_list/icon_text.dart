import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.iconPath,
    required this.text,
  });

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: AppColors.grey(7),
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: AppFonts.greyTitle(),
        ),
      ],
    );
  }
}
