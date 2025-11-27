import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/usecases/weekly_todo_add_usecase_provider.dart';
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
  late FocusNode _textFieldFocus;

  @override
  void initState() {
    super.initState();
    _textFieldFocus = FocusNode();
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoNameController = ref.read(todoNameControllerProvider);

    return Container(
      width: 488,
      height: 168,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.grey(3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            blurRadius: 12,
          ),
        ],
      ),
      child: /* Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 11,
            height: 165,
            decoration: BoxDecoration(
              color: AppColors.grey(7),
            ),
          ), */
          Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            child: Column(
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
          ),
          SizedBox(width: 9),
          SizedBox(
            width: 277,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                TextField(
                  focusNode: _textFieldFocus,
                  style: AppFonts.blackTitle(),
                  controller: todoNameController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  scrollPhysics: const BouncingScrollPhysics(),
                  scrollPadding: EdgeInsets.zero,
                  decoration: InputDecoration(
                    hintText: '할 일을 입력해 주세요.',
                    hintStyle: AppFonts.colormediumTitle(
                      AppColors.grey(6),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 3),
                  ),
                ),
                AddCategoryTag(),
                SizedBox(height: 6),
                SubTaskAddButton(),
              ],
            ),
          ),
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        AppIcon.check02,
                        color: AppColors.grey(7),
                      ),
                      onTap: () async {
                        debugPrint('weekly Todo is excuted');
                        final addTodo = ref.read(addWeeklyTodoUsecaseProvider);
                        await addTodo(todoNameController.text, '미정');
                      },
                    ),
                    SizedBox(width: 14),
                    GestureDetector(
                      child: SvgPicture.asset(AppIcon.trash),
                      onTap: () {
                        todoNameController.clear();
                        ref.read(isEditingProvider.notifier).state = false;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 63),
                DatePickerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
