import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week_plan/components/widgets/customed_appbar.dart';
import 'package:week_plan/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'google_auth/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // redirect 결과 받기

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    // 🔥 redirect 결과는 반드시 ProviderScope 아래에서 받아야 한다
    FirebaseAuth.instance.getRedirectResult().then((result) {
      if (result.user != null) {
        debugPrint("User logged in with redirect: ${result.user!.uid}");
      }
    }).catchError((e) {
      debugPrint("Redirect error: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Week Plan',
      routerConfig: router,
    );
  }
}
