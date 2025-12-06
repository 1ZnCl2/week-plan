import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/category_provider/editing_category_id_provider.dart';

class CategoryButton extends ConsumerWidget {
  final String categoryName;
  final Color color;
  final String id;

  const CategoryButton({
    super.key,
    required this.id,
    required this.categoryName,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(editingCategoryIdProvider.notifier).state = id;
      },
      child: Container(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 3),
            Text(
              categoryName,
              style: AppFonts.blackTitle(size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
