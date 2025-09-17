import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/presentation/provider/daily_quiz_state.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/presentation/provider/quiz_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_white_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/widget/quiz_intro_card.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    // 첫 진입 시 자동 로딩
    Future.microtask(() {
      ref.read(dailyQuizControllerProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dailyQuizControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.secondarySk,
      appBar: CustomWhiteAppBar(
        title: "퀴즈",
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () => context.go('/home'),
        onTapRightBtn: () => context.go('/home'),
      ),
      body: state.when(
        loading: () => Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(
              Assets.lottie.loadingSlow,
              repeat: true, // 반복 재생
              animate: true, // 자동 재생
              fit: BoxFit.contain,
              frameRate: FrameRate.max,
            ),
          ),
        ),
        error: (msg) => null,
        firstVisitToday: (data, remaining) => Column(
          children: [
            const SizedBox(height: 74),
            Center(
              child: QuizIntroCard(
                isProcessing: false,
                title: '오늘의 퀴즈를 풀어볼까요?',
                body: '하루에 도전할 수 있는 문제는 최대 5개예요\n오늘도 함께 달려요',
                btnText: '시작하기',
                onPressed: () async {
                  await context.push('/quiz/run', extra: data.quizzes);
                  if (!context.mounted) return;
                  // 돌아오면 상태 갱신(5문제 푼 뒤 hasWrong 등 반영)
                  ref.read(dailyQuizControllerProvider.notifier).load();
                },
              ),
            ),
          ],
        ),
        resumeInProgress: (data, remaining) => Column(
          children: [
            const SizedBox(height: 74),
            Center(
              child: QuizIntroCard(
                isProcessing: true,
                title: '아직 퀴즈가 남아 있어요!',
                body: '퀴즈를 다 풀면 보상을 받을 수 있어요\n다시 풀어볼까요?',
                btnText: '남은 문제 이어 풀기',
                onPressed: () async {
                  await context.push('/quiz/run', extra: data.quizzes);
                  if (!context.mounted) return;
                  ref.read(dailyQuizControllerProvider.notifier).load();
                },
                remaining: remaining,
              ),
            ),
          ],
        ),
        hasWrong: (data, remaining) => Column(
          children: [
            const SizedBox(height: 74),
            Center(
              child: QuizIntroCard(
                isProcessing: true,
                title: '아직 오답이 남아 있어요!',
                body: '오답을 해결하면 보상을 받을 수 있어요\n다시 풀어볼까요?',
                btnText: '틀린 문제 다시 풀기',
                onPressed: () async {
                  await context.push('/quiz/run', extra: data.quizzes);
                  if (!context.mounted) return;
                  ref.read(dailyQuizControllerProvider.notifier).load();
                },
                remaining: remaining,
              ),
            ),
          ],
        ),
        completed: (data) => Column(
          children: [
            const SizedBox(height: 74),
            Center(
              child: QuizIntroCard(
                isProcessing: false,
                title: '오늘의 퀴즈를 다 풀었어요!',
                body: '하루에 도전할 수 있는 문제는 최대 5개예요\n내일 또 만나요!',
                btnText: '홈으로 가기',
                onPressed: () {
                  context.go('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
