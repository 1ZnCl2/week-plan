import 'package:flutter/material.dart';
import 'package:week_plan/service/block_drag_controller.dart';
import 'package:week_plan/widgets/todo_plan/drag_overlay_controller.dart';

class DragOverlayLayer extends StatefulWidget {
  final BlockDragController controller;

  const DragOverlayLayer({required this.controller, super.key});

  @override
  State<DragOverlayLayer> createState() => _DragOverlayLayerState();
}

class _DragOverlayLayerState extends State<DragOverlayLayer> {
  @override
  void initState() {
    super.initState();
    widget.controller.attach(() {
      setState(() {}); // refactoring해야 하는 부분... provider로 관리하는 게 나을 듯.
    });
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.controller.overlayEntry;

    if (entry == null) return SizedBox.shrink();

    return Positioned(
      left: entry.position.dx,
      top: entry.position.dy,
      child: entry.child,
    );
  }
}
