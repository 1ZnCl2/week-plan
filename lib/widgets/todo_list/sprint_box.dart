import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/editing_todo_id_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';
import 'package:week_plan/widgets/todo_list/editing_card.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class SprintBox extends ConsumerWidget {
  final List sprintList;

  const SprintBox({super.key, required this.sprintList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoStreamed = ref.watch(weeklyTodoStreamProvider);
    final categoryStreamed = ref.watch(categoryListStreamProvider);
    final editingId = ref.watch(editingTodoIdProvider);

    return Container(
      width: 500,
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 3, color: AppColors.cyan(2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: todoStreamed.when(
          data: (todoList) {
            final sprintList = todoList.where((t) => t.isSprint).toList();

            return categoryStreamed.when(
              data: (categoryList) {
                return sprintList.map(
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
                            deadline: item.deadline ?? DateTime.now(),
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
                ).toList();
              },
              loading: () => [CircularProgressIndicator()],
              error: (e, _) => [Text('$e')],
            );
          },
          loading: () => [CircularProgressIndicator()],
          error: (e, _) => [Text('$e')],
        ),
      ),
    );
  }
}
