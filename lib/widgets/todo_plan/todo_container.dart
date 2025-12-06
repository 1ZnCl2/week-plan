import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/models/category/category_model.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_stream_provider.dart';
import 'package:week_plan/widgets/todo_plan/add_schedule_block.dart';
import 'package:week_plan/widgets/todo_plan/schdule_block.dart';

class TodoContainer extends ConsumerWidget {
  const TodoContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoStreamed = ref.watch(weeklyTodoStreamProvider);
    final categoryStreamed = ref.watch(categoryListStreamProvider);

    return Container(
      height: 275,
      width: 1280,
      decoration: BoxDecoration(
        color: AppColors.grey(3),
      ),
      padding: EdgeInsets.only(left: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddScheduleBlock(),
          SizedBox(
            height: 8,
          ),
          todoStreamed.when(
            data: (todoList) {
              return categoryStreamed.when(
                data: (categoryList) {
                  return Row(
                    spacing: 45,
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
                          return ScheduleBlock(
                              isNull: false,
                              title: item.todoName,
                              category: category.categoryName,
                              categoryColor: category.colorHex,
                              deadline: item.deadline ??
                                  DateTime(2999, 12, 31, 23, 59),
                              impact: item.impact ?? 0);
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
    );
  }
}
