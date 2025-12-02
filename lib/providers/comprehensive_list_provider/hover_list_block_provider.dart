import 'package:flutter_riverpod/flutter_riverpod.dart';

final hoverListBlockProvider =
    StateProvider.family<bool, DateTime?>((ref, day) => false);
