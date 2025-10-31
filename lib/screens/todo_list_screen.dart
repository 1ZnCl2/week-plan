import 'package:flutter/material.dart';
import 'package:week_plan/widgets/todo_card.dart';

class TodoListScreen {
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Center(
        child: TodoCard(title: 'title', category: 'category'),
      ),
    );
  }
}
