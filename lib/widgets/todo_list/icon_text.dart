import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  IconText({
    Key? key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.spacing = 8.0,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
        ),
        SizedBox(width: spacing),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
