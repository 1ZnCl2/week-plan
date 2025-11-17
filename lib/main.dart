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
  await FirebaseAuth.instance.getRedirectResult();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Week Plan',
      routerConfig: router,
    );
  }
}
