import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempTileState {
  final DateTime start;
  final DateTime end;
  final DateTime? originalStart;
  final DateTime? originalEnd;
  final double dragStartPoint;

  final bool isDragging;
  final bool isResizing;

  TempTileState({
    required this.start,
    required this.end,
    this.originalStart,
    this.originalEnd,
    this.dragStartPoint = 0,
    this.isDragging = false,
    this.isResizing = false,
  });

  int get durationMinutes => end.difference(start).inMinutes;

  TempTileState copyWith({
    DateTime? start,
    DateTime? end,
    DateTime? originalStart,
    DateTime? originalEnd,
    double? dragStartPoint,
    bool? isDragging,
    bool? isResizing,
  }) {
    return TempTileState(
      start: start ?? this.start,
      end: end ?? this.end,
      originalStart: originalStart ?? this.originalStart,
      originalEnd: originalEnd ?? this.originalEnd,
      dragStartPoint: dragStartPoint ?? this.dragStartPoint,
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

  void startDrag(double dy) {
    if (state == null) return;
    state = state!.copyWith(isDragging: true);
  }

  void endDrag() {
    if (state == null) return;
    state = state!.copyWith(isDragging: false);
  }

  void startResize(double dy, DateTime startPointDate) {
    if (state == null) return;
    state = state!.copyWith(
        isResizing: true,
        dragStartPoint: dy,
        originalStart: startPointDate,
        originalEnd: startPointDate);
    if (state != null) {
      debugPrint('$state');
    }
  }

  void endResize() {
    if (state == null) return;
    state = state!.copyWith(
        isResizing: false,
        dragStartPoint: 0,
        originalEnd: null,
        originalStart: null);
  }

  void updateStart(double dy) {
    if (state == null) return;
    final double deltaY = dy - state!.dragStartPoint;
    final deltaMinutes = (deltaY / 90 * 60).round();

    final newStart = state!.originalStart!.add(Duration(minutes: deltaMinutes));

    state = state!.copyWith(start: newStart);
  }

  void updateEnd(double dy) {
    if (state == null) return;
    final double deltaY = dy - state!.dragStartPoint;
    final deltaMinutes = (deltaY / 90 * 60).round();

    final newEnd = state!.originalEnd!.add(Duration(minutes: deltaMinutes));

    state = state!.copyWith(end: newEnd);
  }
}
