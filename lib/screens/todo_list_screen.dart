import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/sprint_box.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Scaffold build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
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
                  spacing: 15,
                  children: [
                    AddButton(),
                    SprintBox(),
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
