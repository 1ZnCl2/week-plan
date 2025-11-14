import 'package:flutter/material.dart';
import 'package:week_plan/components/widgets/view_slider.dart';
import 'package:week_plan/widgets/todo_list/add_button.dart';
import 'package:week_plan/widgets/todo_list/instructor.dart';
import 'package:week_plan/widgets/todo_list/todo_card.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomSlider(),
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
