import 'package:flutter/material.dart';

class SchduleBlock extends StatelessWidget {
  const SchduleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
    );
  }
}
