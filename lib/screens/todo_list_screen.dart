import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/google_auth/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Scaffold build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [MyCustomSlider()],
          ),
          Center(
            child: Row(
              children: [
                Instructor(),
                SizedBox(width: 214),
                Column(
                  children: [
                    AddButton(),
                    SizedBox(height: 15),
                    TodoCard(title: 'title', category: 'category'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
