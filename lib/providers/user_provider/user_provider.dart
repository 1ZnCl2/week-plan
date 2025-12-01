import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';

final uidProvider = Provider<String?>((ref) {
  final user = ref.watch(authStateProvider).value;
  return user?.uid;
});
