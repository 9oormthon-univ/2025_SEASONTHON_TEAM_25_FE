import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

class ScrapPage extends ConsumerStatefulWidget {
  const ScrapPage({super.key});

  @override
  ConsumerState<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends ConsumerState<ScrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      body: Center(child: const Text("Plz...")),
    );
  }
}
