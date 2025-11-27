import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/services/weekly_todo_add_usecase_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_todo_editting_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/todo_name_input_provider.dart';
import 'package:week_plan/widgets/todo_list/add_category_tag.dart';
import 'package:week_plan/widgets/todo_list/category_tag.dart';
import 'package:week_plan/widgets/todo_list/date_picker_widget.dart';
import 'package:week_plan/widgets/todo_list/sub_task.dart';

class EditingCard extends ConsumerStatefulWidget {
  const EditingCard({super.key});

  @override
  ConsumerState<EditingCard> createState() => _EditingCardState();
}

class _EditingCardState extends ConsumerState<EditingCard> {
  @override
  Widget build(BuildContext context) {
    final todoNameController = ref.read(todoNameControllerProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 488,
        height: 165,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.grey(3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(10, 0, 0, 0),
              blurRadius: 12,
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 11,
              height: 165,
              decoration: BoxDecoration(
                color: AppColors.grey(7),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          AppIcon.star,
                          width: 24,
                          height: 24,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(height: 88),
                    ],
                  ),
                  SizedBox(width: 9),
                  SizedBox(
                    width: 287,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        TextField(
                          style: AppFonts.blackTitle(),
                          controller: todoNameController,
                          readOnly: false,
                          decoration: InputDecoration(
                            hintText: '할 일을 입력해 주세요.',
                            hintStyle: AppFonts.colormediumTitle(
                              AppColors.grey(6),
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 3),
                          ),
                        ),
                        AddCategoryTag(),
                        SizedBox(height: 6),
                        SubTaskAddButton(),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              AppIcon.check02,
                              color: AppColors.grey(7),
                            ),
                            onTap: () {
                              ref.read(addWeeklyTodoUsecaseProvider);
                            },
                          ),
                          SizedBox(width: 14),
                          GestureDetector(
                            child: SvgPicture.asset(AppIcon.trash),
                            onTap: () {
                              todoNameController.clear();
                              ref.read(isEditingProvider.notifier).state =
                                  false;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 63),
                      DatePickerWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
