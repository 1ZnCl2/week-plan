import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';

class SchduleBlock extends StatelessWidget {
  final bool isNull;
  const SchduleBlock({
    super.key,
    required this.isNull,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 140,
      padding: EdgeInsets.only(top: 19, left: 17),
      decoration: BoxDecoration(
        border:
            Border.all(color: isNull ? AppColors.grey(4) : Color(0xFFA0A0A0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.add,
            color: AppColors.grey(4),
          ),
          SizedBox(height: 8),
          Text(
            '웹툰 시나리오 작성',
            style: TextStyle(
              color: isNull ? Color(0xFFA0A0A0) : AppColors.grey(4),
            ),
          ),
        ],
      ),
    );
  }
}
