import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String category;
  final bool isCompleted;

  const TodoCard({
    Key? key,
    required this.title,
    required this.category,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      shadowColor: Colors.black26,
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          title,
        ),
        subtitle: Text(category),
      ),
    );
  }
}
