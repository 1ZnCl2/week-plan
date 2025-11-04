import 'package:flutter/material.dart';
import 'package:week_plan/components/color_manage.dart';

class AddButton extends StatelessWidget {
  //final VoidCallback onPressed;

  const AddButton({
    Key? key,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 488,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.grey(2),
          border: Border.all(
            color: AppColors.grey(3),
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(10, 0, 0, 0),
              blurRadius: 12,
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: AppColors.grey(7),
        ),
      ),
    );
  }
}
