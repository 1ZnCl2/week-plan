import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/usecases/add_category_usecase_provider.dart';
import 'package:week_plan/providers/category_provider/category_name_contoller_provider.dart';
import 'package:week_plan/providers/usecases/delete_category_usecase_provider.dart';
import 'package:week_plan/providers/usecases/update_category_usecase_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';

class EditingCategoryButton extends ConsumerStatefulWidget {
  final String color;
  final String id;
  final String name;

  const EditingCategoryButton(
      {super.key, required this.id, this.color = 'black', required this.name});

  @override
  ConsumerState<EditingCategoryButton> createState() =>
      _EditingCategoryTagState();
}

class _EditingCategoryTagState extends ConsumerState<EditingCategoryButton> {
  late FocusNode _textFieldFocus;

  @override
  void initState() {
    super.initState();
    _textFieldFocus = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryNameControllerProvider).text = widget.name;
    });
  }

  @override
  void dispose() {
    _textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryNameController = ref.watch(categoryNameControllerProvider);
    return Row(
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(int.parse(
                      CategoryColor.returnTagColorfromColorName(widget.color))),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 3),
              IntrinsicWidth(
                child: TextField(
                  focusNode: _textFieldFocus,
                  style: AppFonts.colormediumTitle(size: 14, AppColors.grey(9)),
                  controller: categoryNameController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  scrollPhysics: const BouncingScrollPhysics(),
                  scrollPadding: EdgeInsets.zero,
                  expands: false,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    ref.read(updateCategoryUsecaseProvider)(widget.id);
                  },
                  decoration: InputDecoration(
                    hintText: '이름',
                    hintStyle: AppFonts.colormediumTitle(
                      size: 14,
                      AppColors.grey(4),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(deleteCategoryUsecaseProvider)(widget.id);
                  ref.read(isEditingCategoryProvider.notifier).state = 1;
                },
                child: SvgPicture.asset(AppIcon.x03),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
