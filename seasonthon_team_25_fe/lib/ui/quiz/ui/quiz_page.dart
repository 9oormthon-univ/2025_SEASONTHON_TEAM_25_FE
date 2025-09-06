import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/repository/quiz.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';

enum QuizState {
  inProgress, // 오늘 처음 풀이(시작)
  completed, // 오늘 다 품
  hasWrong, // (추가 요건용) 오답 남음
  remaining, // (추가 요건용) 남은 문제 있음
}

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  QuizState quizState = QuizState.inProgress;

  @override
  void initState() {
    super.initState();
    // 오늘의 퀴즈 로드
    Future.microtask(() async {
      await ref.read(quizSessionProvider.notifier).loadDaily();
      final s = ref.read(quizSessionProvider);
      // API의 completed 값 기준으로 기본 상태 결정
      setState(() {
        quizState = s.completed ? QuizState.completed : QuizState.inProgress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(quizSessionProvider);

    // 로딩/에러 처리
    if (session.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (session.error != null) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: "퀴즈",
          showLeft: true,
          showRight: false,
        ),
        body: Center(child: Text('불러오기 실패: ${session.error}')),
      );
    }

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
          height: () {
            switch (quizState) {
              case QuizState.inProgress:
              case QuizState.completed:
                return 380.0;
              case QuizState.hasWrong:
              case QuizState.remaining:
                return 420.0;
            }
          }(),
          child: () {
            // 오늘 처음 풀이 / 이미 완료 – 두 상태만 우선 구현
            switch (quizState) {
              case QuizState.inProgress:
              case QuizState.completed:
                return Column(
                  spacing: 16,
                  children: [
                    Assets.images.quiz.correct.image(
                      width: 145,
                      height: 145,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      quizState == QuizState.inProgress
                          ? "오늘의 퀴즈를 풀어볼까요?"
                          : "오늘 퀴즈를 다 풀었어요!",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      quizState == QuizState.inProgress
                          ? "하루에 도전할 수 있는 문제는 최대 5개예요\n오늘도 함께 달려요"
                          : "하루에 도전할 수 있는 문제는 최대 5개예요\n내일 또 만나요!",
                      textAlign: TextAlign.center,
                    ),
                    PrimaryActionButton(
                      onPressed: () {
                        if (quizState == QuizState.inProgress) {
                          context.go('/quiz-question');
                        } else {
                          context.go('/home');
                        }
                      },
                      label:
                          quizState == QuizState.inProgress ? "시작하기" : "홈으로 가기",
                      isLoading: false,
                    ),
                  ],
                );
              case QuizState.hasWrong:
              case QuizState.remaining:
                // (추후 요구사항시 확장)
                return const SizedBox.shrink();
            }
          }(),
        ),
      ),
    );
  }
}
