import 'package:flutter/material.dart';

class DragOverlayController {
  Function()? _refresh;
  DragPreviewEntry? overlayEntry;
  void attach(Function() refresh) {
    _refresh = refresh;
  }

  void show({required Offset position, required Widget child}) {
    overlayEntry = DragPreviewEntry(position: position, child: child);
    _refresh?.call();
  }

  void update(Offset newPosition) {
    if (overlayEntry == null) return;
    overlayEntry = overlayEntry!.copyWith(position: newPosition);
    _refresh?.call();
  }

  void remove() {
    overlayEntry = null;
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
