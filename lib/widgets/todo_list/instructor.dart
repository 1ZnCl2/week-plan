import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/components/widgets/category_button.dart';
import 'package:week_plan/providers/category_provider/category_color_provider.dart';
import 'package:week_plan/providers/category_provider/category_list_stream_provider.dart';
import 'package:week_plan/providers/category_provider/editing_category_id_provider.dart';
import 'package:week_plan/providers/weekly_todo_screen/is_editing_category_provider.dart';
import 'package:week_plan/widgets/todo_list/add_category_button.dart';
import 'package:week_plan/widgets/todo_list/editing_category_button.dart';
import 'package:week_plan/widgets/todo_list/icon_text.dart';

class Instructor extends ConsumerWidget {
  const Instructor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditingCategory = ref.watch(isEditingCategoryProvider);
    final categoryStreamed = ref.watch(categoryListStreamProvider);
    final editingId = ref.watch(editingCategoryIdProvider);

    return Container(
      height: 728,
      width: 266,
      padding: const EdgeInsets.symmetric(
        vertical: 72,
        horizontal: 27,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey(1),
        border: Border.all(width: 1, color: AppColors.grey(4)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.home,
              text: '홈',
              id: '',
            ),
          ),
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.inbox,
              text: '백로그',
              id: '',
            ),
          ),
          GestureDetector(
            child: IconText(
              iconPath: AppIcon.server,
              text: '저장소',
              id: '',
            ),
          ),
          Divider(
            color: AppColors.grey(4),
            thickness: 1,
          ),
          Row(
            children: [
              Text(
                '카테고리',
                style: AppFonts.greyTitle(null, size: 16),
              ),
              isEditingCategory == 0
                  ? GestureDetector(
                      child: SvgPicture.asset(AppIcon.pencil),
                      onTap: () {
                        ref.read(isEditingCategoryProvider.notifier).state = 1;
                      },
                    )
                  : GestureDetector(
                      child: SvgPicture.asset(AppIcon.check02),
                      onTap: () => ref
                          .read(isEditingCategoryProvider.notifier)
                          .state = 0,
                    ),
            ],
          ),
          categoryStreamed.when(
            data: (categoryList) {
              return Column(
                spacing: 7,
                children: [
                  ...categoryList.map((item) => item.categoryId == editingId
                      ? EditingCategoryButton(
                          id: item.categoryId,
                          name: item.categoryName,
                          color: item.colorHex,
                        )
                      : CategoryButton(
                          id: item.categoryId,
                          categoryName: item.categoryName,
                          color: Color(int.parse(
                              CategoryColor.returnTagColorfromColorName(
                                  item.colorHex))))),
                  if (isEditingCategory != 0 && categoryList.length < 5)
                    AddCategoryButton(),
                ],
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (e, _) => Text('$e'),
          ),
        ],
      ),
    );
  }
}
