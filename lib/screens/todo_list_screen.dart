import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/editing_card.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/sprint_box.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Scaffold build(BuildContext context, WidgetRef ref) {
    final todoStreamed = ref.watch(weeklyTodoStreamProvider);
    final isEditing = ref.watch(isEditingTodoCardProvider);

    return Scaffold(
      body: Row(
        spacing: 217,
        children: [
          SizedBox(
            width: 266,
            child: Column(
              spacing: 17,
              children: [
                MyCustomSlider(),
                Instructor(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AddButton(),
                if (isEditing) EditingCard(),
                SprintBox(),
                todoStreamed.when(
                  data: (todoList) => Column(
                    children: [
                      ...todoList.map(
                        (item) => TodoCard(
                          title: item.todoName,
                          category: item.category,
                          deadline: item.deadline,
                        ),
                      ),
                    ],
                  ),
                  loading: () => CircularProgressIndicator(),
                  error: (e, _) => Text('$e'),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    /*    Container(
            height: 806,
            width: 1260,
            color: AppColors.grey(1),
          ),
        ],
      ),
    );*/
  }
}
