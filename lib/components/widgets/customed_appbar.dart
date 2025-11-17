import 'package:flutter/material.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/google_auth/google_auth.dart';

class CustomedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomedAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    return AppBar(
      title: const Text('Week Plan'),
      leading: GestureDetector(
        onTap: () async {
          await AuthService().signInWithGoogle();
          if (user != null) {
            debugPrint('User signed in: ${user.displayName}');
          } else {
            debugPrint('Sign-in failed');
          }
        },
        child: user == null
            ? SvgPicture.asset(AppIcon.logIn)
            : Icon(
                Icons.person,
                size: 24,
                color: AppColors.grey(9),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
