import 'package:flutter_riverpod/flutter_riverpod.dart';

final hoverScheduleProvider =
    StateProvider.family<bool, String>((ref, id) => false);
