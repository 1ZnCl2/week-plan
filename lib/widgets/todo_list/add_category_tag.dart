import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';

// 삭제해도 되는 위젯이지만 혹시 몰라서 남겨 놓음.
// 조금 더 매끄러운 사용자 흐름을 위해 언젠간 쓸 수도...

class AddCategoryTag extends StatelessWidget {
  const AddCategoryTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 22,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey(4),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(10, 0, 0, 0),
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        '+',
        style: AppFonts.blackTitle(size: 14),
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
      ),
    );
  }
}
