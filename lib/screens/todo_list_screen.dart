import 'package:flutter/material.dart';
import 'package:week_plan/widgets/add_button.dart';
import 'package:week_plan/widgets/todo_card.dart';

class TodoListScreen extends StatelessWidget {
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주간 할 일'),
      ),
      body: Center(
        child: Column(
          children: [
            AddButton(),
            TodoCard(title: 'title', category: 'category'),
          ],
        ),
      ),
    );
  }
}
