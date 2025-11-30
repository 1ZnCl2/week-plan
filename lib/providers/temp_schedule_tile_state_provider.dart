import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempTileState {
  final DateTime start;
  final DateTime end;
  final bool isDragging;
  final bool isResizing;

  TempTileState({
    required this.start,
    required this.end,
    this.isDragging = false,
    this.isResizing = false,
  });

  int get durationMinutes => end.difference(start).inMinutes;

  TempTileState copyWith({
    DateTime? start,
    DateTime? end,
    bool? isDragging,
    bool? isResizing,
  }) {
    return TempTileState(
      start: start ?? this.start,
      end: end ?? this.end,
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

  void startDrag() {
    if (state == null) return;
    state = state!.copyWith(isDragging: true);
  }

  void endDrag() {
    if (state == null) return;
    state = state!.copyWith(isDragging: false);
  }

  void startResize() {
    if (state == null) return;
    state = state!.copyWith(isResizing: true);
  }

  void endResize() {
    if (state == null) return;
    state = state!.copyWith(isResizing: false);
  }

  void updateStart(DateTime newStart) {
    if (state == null) return;
    state = state!.copyWith(start: newStart);
  }

  void updateEnd(DateTime newEnd) {
    if (state == null) return;
    state = state!.copyWith(end: newEnd);
  }
}
