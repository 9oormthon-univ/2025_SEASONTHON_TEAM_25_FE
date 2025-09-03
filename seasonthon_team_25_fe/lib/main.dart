import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/router/app_router.dart';

void main() {
  runApp(
    ProviderScope(
      // 반드시 앱 전체를 감싸야 함
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter, // 전역 라우터 불러오기
    );
  }
}
