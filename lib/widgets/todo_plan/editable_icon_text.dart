import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/comprehensive_list_provider/editing_text_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/hover_item_provider.dart';
import 'package:week_plan/providers/comprehensive_list_provider/item_text_controller_provider.dart';
import 'package:week_plan/providers/usecases/add_comprehensive_list_usecase_provider.dart';
import 'package:week_plan/providers/usecases/delete_comprehensive_list_usecase_provider.dart';
import 'package:week_plan/providers/usecases/update_comprehensive_list_usecase.dart';
import 'package:week_plan/repository/comprehensive_list_repository.dart';

class EditableIconText extends ConsumerWidget {
  final String itemId;
  final String text;
  final String iconPath;

  const EditableIconText({
    super.key,
    required this.itemId,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editingId = ref.watch(editingItemProvider);
    final isEditing = editingId == itemId;
    final controller = ref.watch(itemTextControllerProvider);
    final isHovering = ref.watch(hoverItemProvider(itemId));

    if (isEditing) {
      controller.text = text;

      return Row(
        children: [
          SizedBox(
            width: 120,
            child: TextField(
              controller: controller,
              autofocus: true,
              onSubmitted: (value) {
                ref.read(updateComprehensiveListUsecaseProvider)(
                    itemId, controller.text);
              },
              onTapOutside: (_) {
                ref.read(editingItemProvider.notifier).state = null;
              },
              decoration: InputDecoration(
                hintText: '새 할 일',
                hintStyle: AppFonts.greyTitle(AppColors.grey(7), size: 16),
                border: InputBorder.none,
              ),
              style: AppFonts.greyTitle(AppColors.grey(9), size: 16),
            ),
          ),
          GestureDetector(
            child: SvgPicture.asset(AppIcon.x03),
            onTap: () {},
          ),
        ],
      );
    }

    return MouseRegion(
      onEnter: (_) {
        ref.read(hoverItemProvider(itemId).notifier).state = true;
      },
      onExit: (_) {
        ref.read(hoverItemProvider(itemId).notifier).state = false;
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.text = text;
              ref.read(editingItemProvider.notifier).state = itemId;
            },
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {}, child: SvgPicture.asset(iconPath)),
                SizedBox(width: 7),
                Expanded(
                  child: Text(
                    text,
                    style: AppFonts.greyTitle(AppColors.grey(9), size: 16),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          if (isHovering)
            Positioned(
              right: 0,
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 150),
                child: GestureDetector(
                  child: SvgPicture.asset(AppIcon.trash),
                  onTap: () {
                    ref.read(deleteComprehensiveListUsecaseProvider)(itemId);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
