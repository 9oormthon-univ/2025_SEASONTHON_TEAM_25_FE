// lib/feature/quiz/ui/quiz_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';

// 새 설계 컨트롤러/상태

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    // 오늘의 퀴즈 로드
    Future.microtask(() {
      ref.read(quizControllerProvider.notifier).loadDaily();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider);

    // 로딩
    if (state.phase == QuizPhase.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // 에러
    if (state.phase == QuizPhase.error) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: "퀴즈",
          showLeft: true,
          showRight: false,
        ),
        body: Center(child: Text('불러오기 실패: ${state.error ?? '알 수 없는 오류'}')),
      );
    }

    // 완료(이미 오늘 끝)
    if (state.phase == QuizPhase.finished || (state.isCompleted && !state.hasData)) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: "퀴즈",
          showLeft: true,
          showRight: false,
          onTapLeft: () => context.go('/home'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          alignment: Alignment.center,
          color: AppColors.sk,
          child: BlurredCard(
            width: 335,
            height: 380,
            child: Column(
              spacing: 16,
              children: [
                Assets.images.quiz.correct.image(
                  width: 145,
                  height: 145,
                  fit: BoxFit.contain,
                ),
                const Text(
                  "오늘 퀴즈를 다 풀었어요!",
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "하루에 도전할 수 있는 문제는 최대 5개예요\n내일 또 만나요!",
                  textAlign: TextAlign.center,
                ),
                PrimaryActionButton(
                  onPressed: () => context.go('/home'),
                  label: "홈으로 가기",
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 오늘 퀴즈 없음(미완료지만 배열 비었을 때)
    if (!state.hasData) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: "퀴즈",
          showLeft: true,
          showRight: false,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('오늘은 퀴즈가 없어요'),
              const SizedBox(height: 12),
              PrimaryActionButton(
                isLoading: false,
                label: '홈으로',
                onPressed: () => context.go('/home'),
              ),
            ],
          ),
        ),
      );
    }

    // 시작/재시작 화면
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "퀴즈",
        showLeft: true,
        showRight: false,
        onTapLeft: () => context.go('/home'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        alignment: Alignment.center,
        color: AppColors.sk,
        child: BlurredCard(
          width: 335,
          height: 380,
          child: Column(
            spacing: 16,
            children: [
              Assets.images.quiz.correct.image(
                width: 145,
                height: 145,
                fit: BoxFit.contain,
              ),
              const Text(
                "오늘의 퀴즈를 풀어볼까요?",
                textAlign: TextAlign.center,
              ),
              const Text(
                "하루에 도전할 수 있는 문제는 최대 5개예요\n오늘도 함께 달려요",
                textAlign: TextAlign.center,
              ),
              PrimaryActionButton(
                onPressed: () => context.go('/quiz-question'),
                label: "시작하기",
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}