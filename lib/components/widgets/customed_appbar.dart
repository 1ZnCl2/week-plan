import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/google_auth/google_auth_provider.dart';
import 'package:week_plan/components/color_manage.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/google_auth/google_auth.dart';
import 'package:week_plan/components/font_manage.dart';

class CustomedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomedAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;

    return AppBar(
      automaticallyImplyLeading: true,
      toolbarHeight: 30,
      backgroundColor: Colors.white,
      title: Text(
        'Week Plan',
        style: AppFonts.blackTitle(size: 14),
      ),
      actions: [
        GestureDetector(
          onTap: () async {
            await AuthService().signInWithGoogle();
            print('AppBar user: $user');
          },
          child: user == null
              ? SvgPicture.asset(AppIcon.logIn,
                  width: 24, height: 24, color: AppColors.grey(9))
              : SvgPicture.asset(
                  AppIcon.userProfile,
                  height: 24,
                  width: 24,
                  color: AppColors.grey(9),
                ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
