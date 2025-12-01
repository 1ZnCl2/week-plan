import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';

class TempScheduleTile extends ConsumerStatefulWidget {
  const TempScheduleTile(
      {super.key,
      required this.color,
      required this.textColor,
      required this.title});

  final Color color;
  final String title;
  final Color textColor;

  @override
  ConsumerState<TempScheduleTile> createState() => _TempScheduleTileState();
}

class _TempScheduleTileState extends ConsumerState<TempScheduleTile> {
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
    final notifier = ref.watch(tempTileProvider.notifier);
    final tempTileState = ref.watch(tempTileProvider);
    final scheduleNameController = ref.watch(scheduleTileNameController);

    return Positioned(
      top: tempTileState!.start.hour.toDouble() * 90 +
          tempTileState!.start.minute.toDouble() * 90 / 60,
      left: (tempTileState.start.weekday.toDouble() - 1) * 180 + 20,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, top: 12),
            width: 180,
            height: 90 *
                (tempTileState.end.hour +
                        tempTileState.end.minute / 60 -
                        tempTileState.start.hour -
                        tempTileState.start.minute / 60)
                    .toDouble(),
            decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(color: AppColors.grey(4), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IntrinsicWidth(
                      child: SizedBox(
                        width: 130,
                        child: TextField(
                          focusNode: _textFieldFocus,
                          style: AppFonts.colormediumTitle(AppColors.grey(8),
                              size: 16),
                          readOnly: !notifier.isEdited(),
                          controller: scheduleNameController,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          scrollPhysics: const BouncingScrollPhysics(),
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration(
                            hintText: '새 일정',
                            hintStyle: AppFonts.colormediumTitle(
                                AppColors.grey(6),
                                size: 16),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        notifier.clear();
                        ref.read(isEditingScheduleTileProvider.notifier).state =
                            false;
                      },
                      child: SvgPicture.asset(
                        AppIcon.square,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${tempTileState.start.hour.toString().padLeft(2, '0')}:${tempTileState.start.minute.toString().padLeft(2, '0')}~${tempTileState.end.hour.toString().padLeft(2, '0')}:${tempTileState.end.minute.toString().padLeft(2, '0')}',
                  style: AppFonts.greyTitle(
                    null,
                    size: 12,
                    bold: AppFonts.light,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              top: 50,
              bottom: 14,
              child: Container(
                color: Colors.red.withOpacity(0.3),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanStart: (d) => notifier.startDrag(
                      d.globalPosition.dx, d.globalPosition.dy),
                  onPanUpdate: (d) => notifier.updateDrag(
                    d.globalPosition.dx,
                    d.globalPosition.dy,
                  ),
                  onPanEnd: (_) => notifier.endDrag(),
                ),
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) => notifier.startResize(d.localPosition.dy),
              onPanUpdate: (d) => notifier.updateStart(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) => notifier.startResize(d.localPosition.dy),
              onPanUpdate: (d) => notifier.updateEnd(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
        ],
      ),
    );
  }
}
