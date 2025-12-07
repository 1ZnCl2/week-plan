import 'package:flutter/material.dart';

class BlockDragController {
  static final BlockDragController instance = BlockDragController._internal();
  BlockDragController._internal();
  factory BlockDragController() => instance;

  OverlayEntry? _entry;
  Function()? _refresh;

  Offset position = Offset.zero;
  DragPreviewEntry? overlayEntry;
  String? draggingTodoId;

  void attach(Function() refresh) {
    _refresh = refresh;
  }

  void startDrag(
      BuildContext context, Offset startPosition, Widget child, String todoId) {
    position = startPosition;
    draggingTodoId = todoId;

    // DragOverlayLayer가 읽을 수 있도록 반드시 저장
    overlayEntry = DragPreviewEntry(position: startPosition, child: child);

    _entry = OverlayEntry(
      builder: (_) {
        return Positioned(
          left: position.dx,
          top: position.dy,
          child: IgnorePointer(
            ignoring: true,
            child: child,
          ),
        );
      },
    );

    Overlay.of(context).insert(_entry!);
    _refresh?.call();
  }

  void updateDrag(Offset newPosition) {
    position = newPosition;

    // DragOverlayLayer가 재렌더링하도록 overlayEntry 갱신
    if (overlayEntry != null) {
      overlayEntry = overlayEntry!.copyWith(position: newPosition);
    }

    _entry?.markNeedsBuild();
    _refresh?.call();
  }

  void endDrag() {
    _entry?.remove();
    _entry = null;

    overlayEntry = null;
    draggingTodoId = null;

    _refresh?.call();
  }
}

class DragPreviewEntry {
  final Offset position;
  final Widget child;
  DragPreviewEntry({required this.position, required this.child});
  DragPreviewEntry copyWith({Offset? position, Widget? child}) =>
      DragPreviewEntry(
        position: position ?? this.position,
        child: child ?? this.child,
      );
}
