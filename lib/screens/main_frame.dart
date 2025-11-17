import 'package:flutter/material.dart';
import 'package:week_plan/components/widgets/customed_appbar.dart';

class MainFrame extends StatelessWidget {
  final Widget child;

  const MainFrame({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomedAppBar(), // 항상 보여줄 상단 컴포넌트
      ),
      body: child, // 라우트가 바뀌면 이 부분만 바뀜
    );
  }
}
