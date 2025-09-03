import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrapPage extends ConsumerStatefulWidget {
  const ScrapPage({super.key});

  @override
  ConsumerState<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends ConsumerState<ScrapPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scrap')),
      body: const Center(child: Text('구현 예정')),
    );
  }
}
