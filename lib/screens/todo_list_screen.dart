import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';

import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_provider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/editting_card.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/sprint_box.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Scaffold build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    final isEditting = ref.watch(isEditingProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [MyCustomSlider()],
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            height: 806,
            width: 1260,
            color: AppColors.grey(1),
            child: Row(
              children: [
                Instructor(),
                SizedBox(width: 214),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 15),
                    children: [
                      AddButton(),
                      TodoCard(title: 'title', category: 'category'),
                      isEditting ? EdittingCard() : SizedBox(),
                      SprintBox(),
                      ...todoList.map((item) => TodoCard(
                            title: item['todo_name'],
                            category: item['category'],
                            deadline: item['deadline'],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
