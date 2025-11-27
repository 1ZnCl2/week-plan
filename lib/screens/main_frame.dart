import 'package:flutter/material.dart';
import 'package:week_plan/components/widgets/customed_appbar.dart';

class MainFrame extends StatelessWidget {
  final Widget child;

  const MainFrame({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(), // 불변하는 상단 컴포넌트

      body: child, // 라우트가 바뀔 때 교체되는 부분
    );
  }
}
