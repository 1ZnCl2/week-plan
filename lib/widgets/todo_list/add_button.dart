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
    return ElevatedButton(
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: AppColors.grey(7),
      ),
    );
  }
}
