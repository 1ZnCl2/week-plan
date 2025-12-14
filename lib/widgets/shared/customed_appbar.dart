import 'package:flutter/material.dart';
import 'package:week_plan/components/font_manage.dart';
import 'package:week_plan/providers/firestore_provider.dart';
import 'package:week_plan/providers/google_auth/firebase_auth_provider.dart';
import 'package:week_plan/providers/google_auth/google_auth_state_provider.dart';
import 'package:week_plan/components/icon_manage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/google_auth/google_auth.dart';
import 'package:week_plan/repository/user/user_repository.dart';

class CustomedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomedAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final auth = ref.watch(firebaseAuthProvider);

    final db = ref.watch(firestoreProvider);

    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      title: Text(
        'Week Plan',
        style: AppFonts.blackTitle(size: 14),
      ),
      actions: [
        Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: GestureDetector(
              onTap: () async {
                await AuthService().signInWithGoogle();
                await UserRepository(auth, db).ensureUserDocument();
              },
              child: user == null
                  ? SvgPicture.asset(AppIcon.logIn, width: 24, height: 24)
                  : SvgPicture.asset(AppIcon.userProfile,
                      height: 24, width: 24),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
