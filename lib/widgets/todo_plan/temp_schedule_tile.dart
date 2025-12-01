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
      required this.startTime,
      required this.color,
      required this.endTime,
      required this.textColor,
      required this.title});

  final DateTime startTime;
  final DateTime endTime;
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
    final scheduleNameController = ref.watch(scheduleTileNameController);

    return Positioned(
      top: widget.startTime.hour.toDouble() * 90 +
          widget.startTime.minute.toDouble() * 90 / 60,
      left: (widget.startTime.weekday.toDouble() - 1) * 180 + 20,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, top: 12),
            width: 180,
            height: 90 *
                (widget.endTime.hour +
                        widget.endTime.minute / 60 -
                        widget.startTime.hour -
                        widget.startTime.minute / 60)
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
                        width: 140,
                        child: TextField(
                          focusNode: _textFieldFocus,
                          style: AppFonts.colormediumTitle(AppColors.grey(8),
                              size: 16),
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
                  '${widget.startTime.hour.toString().padLeft(2, '0')}:${widget.startTime.minute.toString().padLeft(2, '0')}~${widget.endTime.hour.toString().padLeft(2, '0')}:${widget.endTime.minute.toString().padLeft(2, '0')}',
                  style: AppFonts.greyTitle(
                    null,
                    size: 12,
                    bold: AppFonts.light,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 14,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanStart: (d) =>
                  notifier.startResize(d.localPosition.dy, widget.startTime),
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
              onPanStart: (d) =>
                  notifier.startResize(d.localPosition.dy, widget.endTime),
              onPanUpdate: (d) => notifier.updateEnd(d.localPosition.dy),
              onPanEnd: (_) => notifier.endResize(),
            ),
          ),
        ],
      ),
    );
  }
}
