import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

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
          Text(
            '백로그',
            style: AppFonts.greyTitle(size: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Here you can manage your tasks efficiently and stay organized throughout the week.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
