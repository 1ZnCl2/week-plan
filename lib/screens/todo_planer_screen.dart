import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/widgets/category_button.dart';
import 'package:week_plan/widgets/todo_plan/week_calendar.dart';
import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/widgets/todo_plan/week_handler.dart';
import 'package:week_plan/providers/weekly-screen/todo_container_provider.dart';
import 'package:week_plan/widgets/todo_plan/todo_container.dart';

class TodoPlanerScreen extends ConsumerWidget {
  const TodoPlanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(todoContainerHandleProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 1260,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomSlider(),
                CategoryButton(
                    categoryName: 'categoryName',
                    color: AppColors.cyan(1),
                    onPressed: () {}),
                WeekHandler(),
              ],
            ),
          ),
          SizedBox(
            height: 11,
          ),
          SizedBox(
            width: 1280,
            child: Stack(
              children: [
                WeekCalendar(),
                Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(todoContainerHandleProvider.notifier)
                              .toggleHandler();
                        },
                        child: Container(
                          width: 192,
                          height: 32,
                          color: AppColors.grey(3),
                        ),
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 250),
                        child: isOpen ? TodoContainer() : SizedBox.shrink(),
                      ),
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
