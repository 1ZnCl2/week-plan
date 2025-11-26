import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final todoNameControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});
