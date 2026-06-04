import 'package:flutter/material.dart';
import 'package:week_plan/widgets/shared/customed_appbar.dart';
import 'package:week_plan/widgets/shared/view_slider.dart';

class MainFrame extends StatelessWidget {
  final Widget child;

  const MainFrame({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomedAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const MyCustomSlider(),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
