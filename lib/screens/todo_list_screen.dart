import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/week_base_date_provider.dart';
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
    final categoryStreamed = ref.watch(categoryListStreamProvider);
    final editingId = ref.watch(editingTodoIdProvider);
    final weekBase = ref.watch(weekBaseDateProvider);

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
                SprintBox(),
                todoStreamed.when(
                  data: (todoList) {
                    return categoryStreamed.when(
                      data: (categoryList) {
                        return Column(
                          children: [
                            ...todoList.map(
                              (item) {
                                final category = categoryList.firstWhere(
                                  (c) => c.categoryName == item.category,
                                  orElse: () => CategoryModel(
                                    categoryId: 'none',
                                    categoryName: '미정',
                                    uid: '',
                                    colorHex: 'black',
                                    icon: '',
                                  ),
                                );
                                return editingId == item.todoId
                                    ? EditingCard(
                                        id: item.todoId,
                                        todoName: item.todoName,
                                        impact: item.impact ?? 0,
                                        deadline:
                                            item.deadline ?? DateTime.now(),
                                      )
                                    : TodoCard(
                                        id: item.todoId,
                                        title: item.todoName,
                                        category: category.categoryName,
                                        categoryColor: category.colorHex,
                                        deadline: item.deadline,
                                        isCompleted: item.isCompleted,
                                        impact: item.impact ?? 0,
                                        doesQuit: item.doesQuit,
                                      );
                              },
                            ),
                          ],
                        );
                      },
                      loading: () => CircularProgressIndicator(),
                      error: (e, _) => Text('$e'),
                    );
                  },
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
