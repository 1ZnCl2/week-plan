import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/models/weekly_todo/weekly_todo_model.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_list_provider.dart';
import 'package:week_plan/repository/weekly_todo/weekly_todo_repository.dart';

class AddButton extends ConsumerWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return GestureDetector(
      onTap: () {
        ref.read(isEditingProvider.notifier).state = true;
      },
      child: Container(
        width: 488,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.grey(2),
          border: Border.all(
            color: AppColors.grey(3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(10, 0, 0, 0),
              blurRadius: 12,
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: AppColors.grey(7),
        ),
      ),
    );
  }
}
