import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:week_plan/providers/is_editing_schedule_tile_provider.dart';
import 'package:week_plan/providers/schedule_provider/editing_schedule_id_provider.dart';
import 'package:week_plan/providers/schedule_provider/schedule_tile_name_contorller.dart';
import 'package:week_plan/providers/schedule_provider/temp_schedule_tile_state_provider.dart';
import 'package:week_plan/providers/usecases/add_schedule_usecase_provider.dart';
import 'package:week_plan/providers/usecases/update_schedule_usecase_provider.dart';

class TempScheduleTile extends ConsumerStatefulWidget {
  const TempScheduleTile(
      {super.key,
      required this.color,
      required this.textColor,
      required this.title,
      required this.id,
      required this.startTime,
      required this.endTime});

  final Color color;
  final String title;
  final Color textColor;
  final String id;
  final DateTime startTime;
  final DateTime endTime;

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
    final tempTileState = ref.watch(tempTileProvider);

    final editingId = ref.watch(editingScheduleIdProvider);
    final isEditing = editingId == widget.id && tempTileState != null;
    final notifier = ref.watch(tempTileProvider.notifier);
    final scheduleNameController = ref.watch(scheduleTileNameController);

    final start = isEditing ? tempTileState.start : widget.startTime;
    final end = isEditing ? tempTileState.end : widget.endTime;

    return Positioned(
      top: start.hour.toDouble() * 90 + start.minute.toDouble() * 90 / 60,
      left: (start.weekday.toDouble() - 1) * 180 + 20,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          ref.read(editingScheduleIdProvider.notifier).state = widget.id;
          notifier.create(widget.startTime);
          ref.read(scheduleTileNameController).text = widget.title;
        },
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(left: 14, top: 12),
                width: 180,
                height: max(
                    30,
                    90 *
                        (end.hour +
                                end.minute / 60 -
                                start.hour -
                                start.minute / 60)
                            .toDouble()),
                decoration: BoxDecoration(
                  color: widget.color,
                  border: Border.all(color: AppColors.grey(4), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isEditing
                        ? Row(
                            children: [
                              IntrinsicWidth(
                                child: SizedBox(
                                  width: 120,
                                  child: TextField(
                                    focusNode: _textFieldFocus,
                                    readOnly: isEditing &&
                                                tempTileState!.isDragging ||
                                            tempTileState!.isResizing
                                        ? true
                                        : false,
                                    style: AppFonts.colormediumTitle(
                                        AppColors.grey(8),
                                        size: 16),
                                    controller: scheduleNameController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    scrollPadding: EdgeInsets.zero,
                                    decoration: InputDecoration(
                                      hintText: '새 일정',
                                      hintStyle: AppFonts.colormediumTitle(
                                          AppColors.grey(6),
                                          size: 16),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ref.read(updateScheduleUsecaseProvider)();
                                },
                                child: SvgPicture.asset(
                                  AppIcon.check02,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(
                                  AppIcon.square,
                                ),
                              ),
                              SizedBox(width: 7),
                              SizedBox(
                                width: 114,
                                child: Text(
                                  widget.title,
                                  style: AppFonts.colormediumTitle(
                                    size: 16,
                                    widget.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Text(
                      '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}~${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
                      style: AppFonts.greyTitle(
                        null,
                        size: 12,
                        bold: AppFonts.light,
                      ),
                    ),
                  ],
                )),
            Positioned.fill(
              top: 55,
              bottom: 14,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (d) {
                  notifier.startDrag(d.globalPosition.dx, d.globalPosition.dy);
                },
                onPanUpdate: (d) => notifier.updateDrag(
                  d.globalPosition.dx,
                  d.globalPosition.dy,
                ),
                onPanEnd: (_) => notifier.endDrag(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 14,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanStart: (d) {
                  FocusScope.of(context).unfocus();
                  notifier.startResize(d.localPosition.dy);
                },
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
                behavior: HitTestBehavior.opaque,
                onPanStart: (d) {
                  notifier.startResize(d.localPosition.dy);
                },
                onPanUpdate: (d) => notifier.updateEnd(d.localPosition.dy),
                onPanEnd: (_) => notifier.endResize(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
