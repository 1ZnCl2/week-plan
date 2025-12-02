import 'package:flutter_riverpod/flutter_riverpod.dart';

final hoverItemProvider =
    StateProvider.family<bool, String>((ref, id) => false);
