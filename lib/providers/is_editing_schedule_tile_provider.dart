import 'package:flutter_riverpod/flutter_riverpod.dart';

final isEditingScheduleTileProvider = StateProvider<bool>((ref) => false);

// 나중에 삭제해야 할 provider.
