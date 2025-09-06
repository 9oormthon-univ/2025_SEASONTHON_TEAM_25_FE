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
    Future.microtask(() {
      ref.read(quizControllerProvider.notifier).loadDaily();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider);

    if (state.phase == QuizPhase.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (state.phase == QuizPhase.error) {
      return Scaffold(
        appBar: const CustomAppBar(title: "퀴즈", showLeft: true, showRight: false),
        body: Center(child: Text('불러오기 실패: ${state.error ?? '알 수 없는 오류'}')),
      );
    }
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
                Assets.images.quiz.correct.image(width: 145, height: 145, fit: BoxFit.contain),
                const Text("오늘 퀴즈를 다 풀었어요!", textAlign: TextAlign.center),
                const Text("하루에 도전할 수 있는 문제는 최대 5개예요\n내일 또 만나요!", textAlign: TextAlign.center),
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

    // ✅ 시작/재시작 화면
    final titleText = state.retryMode ? "오답만 다시 풀어볼까요?" : "오늘의 퀴즈를 풀어볼까요?";
    final subtitleText = state.retryMode
        ? "방금 틀린 문제들만 모았어요\n이번엔 맞출 수 있어요!"
        : "하루에 도전할 수 있는 문제는 최대 5개예요\n오늘도 함께 달려요";
    final ctaLabel = state.retryMode ? "다시 풀기" : "시작하기";

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
              Assets.images.quiz.correct.image(width: 145, height: 145, fit: BoxFit.contain),
              Text(titleText, textAlign: TextAlign.center),
              Text(subtitleText, textAlign: TextAlign.center),
              PrimaryActionButton(
                onPressed: () => context.go('/quiz-question'),
                label: ctaLabel,
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}