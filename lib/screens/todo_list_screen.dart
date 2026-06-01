import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/google_auth/google_auth_state_provider.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/sprint_stream_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/editing_card.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/sprint_box.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final isLoggedIn = user != null;

    final todoStreamed = ref.watch(weeklyTodoStreamProvider);
    final sprintStreamed = ref.watch(sprintTodoProvider);
    final categoryStreamed = ref.watch(categoryListStreamProvider);
    final editingId = ref.watch(editingTodoIdProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 266,
          child: Instructor(),
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 800,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddButton(),
                if (isLoggedIn)
                  SprintBox(
                    sprintList: sprintStreamed,
                  ),
                isLoggedIn
                    ? todoStreamed.when(
                        data: (todoList) {
                          final nonSprintList =
                              todoList.where((t) => !t.isSprint).toList();

                          return categoryStreamed.when(
                            data: (categoryList) {
                              return Column(
                                children: [
                                  ...nonSprintList.map(
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
                                              deadline: item.deadline ??
                                                  DateTime.now(),
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
                                  )
                                ],
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (e, _) => Text('$e'),
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (e, _) => Text('$e'),
                      )
                    : SizedBox(
                        height: 120,
                        child: Center(
                          child: Text(
                            '기능을 이용하기 위해서\n우측 상단 아이콘을 눌러 로그인해 주세요.',
                            style: AppFonts.greyTitle(AppColors.grey(7)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
