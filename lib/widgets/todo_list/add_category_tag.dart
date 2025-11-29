import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';

class AddCategoryTag extends ConsumerWidget {
  const AddCategoryTag({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          ref.read(isEditingCategoryProvider.notifier).state = 2;
          debugPrint(
              'current state is? ${ref.read(isEditingCategoryProvider)}');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.grey(4),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(10, 0, 0, 0),
                    blurRadius: 12,
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Text(
                    '+ 새 카테고리',
                    style:
                        AppFonts.colormediumTitle(size: 14, AppColors.grey(7)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
