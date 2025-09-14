import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/local/shared_prefs_provider.dart';
import 'package:seasonthon_team_25_fe/core/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider); // 전역 라우터 불러오기

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, // 전역 라우터 불러오기
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
