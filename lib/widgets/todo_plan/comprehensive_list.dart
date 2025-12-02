import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/models/comprehensive_model/comprehensive_model.dart';
import 'package:week_plan/providers/comprehensive_list_provider/hover_list_block_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/is_adding_list_text_provider.dart';
import 'package:week_plan/providers/usecases/add_comprehensive_list_usecase_provider.dart';
import 'package:week_plan/widgets/todo_list/icon_text.dart';
import 'package:week_plan/widgets/todo_plan/editable_icon_text.dart';

class ComprehensiveListWidget extends ConsumerWidget {
  final bool isToday;
  final DateTime today;
  final List<ComprehensiveModel> items;

  const ComprehensiveListWidget({
    super.key,
    required this.isToday,
    required this.today,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = ref.watch(hoverListBlockProvider(today));

    return MouseRegion(
      onEnter: (_) {
        ref.read(hoverListBlockProvider(today).notifier).state = true;
      },
      onExit: (_) {
        ref.read(hoverListBlockProvider(today).notifier).state = false;
      },
      child: Container(
        width: 180,
        height: 122,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          color: isToday ? Color(0xFF91BFF6) : AppColors.grey(3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...items.map((item) {
                final isDone = item.is_completed;

                return EditableIconText(
                  iconPath: isDone ? AppIcon.check02 : AppIcon.square,
                  text: item.content_name,
                  itemId: item.id,
                );
              }),
              if (items.length < 3 && isHovering)
                GestureDetector(
                  onTap: () {
                    ref.read(addComprehensiveListUsecaseProvider)(today);
                  },
                  child: Container(
                    height: 24,
                    width: 160,
                    child: Icon(
                      Icons.add,
                      size: 24,
                      color: AppColors.grey(7),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey(4).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
            ]),
      ),
    );
  }
}
