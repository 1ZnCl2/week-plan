import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempTileState {
  final DateTime start;
  final DateTime end;
  final DateTime? originalStart;
  final DateTime? originalEnd;
  final double dragStartY;
  final double? dragStartX;

  final bool isDragging;
  final bool isResizing;

  TempTileState({
    required this.start,
    required this.end,
    this.originalStart,
    this.dragStartX,
    this.originalEnd,
    this.dragStartY = 0,
    this.isDragging = false,
    this.isResizing = false,
  });

  int get durationMinutes => end.difference(start).inMinutes;

  TempTileState copyWith({
    DateTime? start,
    DateTime? end,
    DateTime? originalStart,
    DateTime? originalEnd,
    double? dragStartX,
    double? dragStartY,
    bool? isDragging,
    bool? isResizing,
  }) {
    return TempTileState(
      start: start ?? this.start,
      end: end ?? this.end,
      originalStart: originalStart ?? this.originalStart,
      originalEnd: originalEnd ?? this.originalEnd,
      dragStartX: dragStartX ?? this.dragStartX,
      dragStartY: dragStartY ?? this.dragStartY,
      isDragging: isDragging ?? this.isDragging,
      isResizing: isResizing ?? this.isResizing,
    );
  }
}

final tempTileProvider =
    StateNotifierProvider<TempTileNotifier, TempTileState?>(
        (ref) => TempTileNotifier());

class TempTileNotifier extends StateNotifier<TempTileState?> {
  TempTileNotifier() : super(null);

  void create(DateTime start) {
    state = TempTileState(
      start: start,
      end: start.add(Duration(hours: 1)),
    );
  }

  void clear() {
    state = null;
  }

  bool isEdited() {
    if (state == null) {
      return false;
    }
    if (state!.isDragging || state!.isResizing) {
      return true;
    }
    return false;
  }

  void startDrag(double dx, double dy) {
    debugPrint("startDrag is executed");

    state = state!.copyWith(
      isDragging: true,
      dragStartY: dy,
      dragStartX: dx,
      originalStart: state!.start,
      originalEnd: state!.end,
    );

    debugPrint("dragStartX: ${state?.dragStartX}");
    debugPrint("originalStart: ${state?.originalStart}");
    debugPrint("originalEnd: ${state?.originalEnd}");
    debugPrint("dragStartPoint: ${state?.dragStartY}");
  }

  void updateDrag(double dx, double dy) {
    final s = state!;
    if (s == null || !s.isDragging) return;
    if (s.originalStart == null || s.originalEnd == null) return;
    if (s.dragStartX == null) return;

    debugPrint("updateDrag is executed");

    final offsetMinutes = ((dy - s.dragStartY) / 90 * 60).round();
    final offsetDays = ((dx - s.dragStartX!) / 180).round();

    final newStart = s.originalStart!.add(
      Duration(days: offsetDays, minutes: offsetMinutes),
    );
    final newEnd = s.originalEnd!.add(
      Duration(days: offsetDays, minutes: offsetMinutes),
    );

    state = s.copyWith(
      start: newStart,
      end: newEnd,
    );

    debugPrint("dragStartX: ${state?.dragStartX}");
    debugPrint("originalStart: ${state?.originalStart}");
    debugPrint("originalEnd: ${state?.originalEnd}");
    debugPrint("dragStartPoint: ${state?.dragStartY}");
  }

  void endDrag() {
    final s = state!;
    state = s.copyWith(
      start: s.start,
      end: s.end,
      isDragging: false,
    );

    debugPrint("start: ${state?.start}");
    debugPrint("end: ${state?.end}");
  }

  void startResize(double dy) {
    if (state == null) return;
    state = state!.copyWith(
        isResizing: true,
        dragStartY: dy,
        originalStart: state!.start,
        originalEnd: state!.end);
  }

  void endResize() {
    if (state == null) return;
    state = state!.copyWith(
        isResizing: false,
        dragStartY: 0,
        originalEnd: null,
        originalStart: null);
  }

  void updateStart(double dy) {
    if (state == null) return;
    final double deltaY = dy - state!.dragStartY;
    final deltaMinutes = (deltaY / 90 * 60).round();

    final newStart = state!.originalStart!.add(Duration(minutes: deltaMinutes));

    state = state!.copyWith(start: newStart);
  }

  void updateEnd(double dy) {
    if (state == null) return;
    final double deltaY = dy - state!.dragStartY;
    final deltaMinutes = (deltaY / 90 * 60).round();

    final newEnd = state!.originalEnd!.add(Duration(minutes: deltaMinutes));

    state = state!.copyWith(end: newEnd);
  }
}
