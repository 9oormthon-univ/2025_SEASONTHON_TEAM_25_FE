import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';

enum QuizState {
  inProgress,   // 퀴즈 푸는 중
  completed,    // 퀴즈 다 푼 상태 (정답/오답 여부 상관 X)
  hasWrong,     // 오답이 있어서 다시 풀어야 하는 상태
  remaining,    // 퀴즈가 아직 남아있는 상태
}

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  QuizState quizState = QuizState.inProgress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "퀴즈",
        showLeft: true,
        showRight: true,
        onTapLeft: () {
          // 왼쪽 버튼 눌렀을 때
          debugPrint("뒤로가기 눌림");
          context.go('/home');
        },
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
          return 380.0;
              case QuizState.completed:
          return 380.0;
              case QuizState.hasWrong:
          return 420.0;
              case QuizState.remaining:
          return 420.0;
            }
          }(),
          child: () {
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
                  Text(quizState == QuizState.inProgress ? "오늘의 퀴즈를 풀어볼까요?" : "오늘 퀴즈를 다 풀었어요!",textAlign: TextAlign.center,),
                  Text(quizState == QuizState.inProgress ? "하루에 도전할 수 있는 문제는 최대 5개예요\n오늘도 함께 달려요" : "하루에 도전할 수 있는 문제는 최대 5개예요\n내일 또 만나요!",textAlign: TextAlign.center,),
                  PrimaryActionButton(
                    onPressed: () {
                      quizState == QuizState.inProgress ? {
                        context.go("/quiz-question"),
                      } : {
                        context.go("/home"),
                      };
                    },
                    label: quizState == QuizState.inProgress ? "시작하기" : "홈으로 가기", isLoading: false,
                  ),
                ],
              );
              case QuizState.hasWrong:
              case QuizState.remaining:
              return Column(
                spacing: 16,
                children: [
                  Assets.images.quiz.retry.image(
                  width: 145,
                  height: 145,
                  fit: BoxFit.contain,
                ),
                  Text(quizState == QuizState.hasWrong ? "아직 오답이 남아 있어요!" : "아직 퀴즈가 남아 있어요!", textAlign: TextAlign.center,),
                  Text(quizState == QuizState.hasWrong ? "오답을 해결하면 (보상 원)을 받을 수 있어요\n다시 풀어볼까요?" : "퀴즈를 다 풀면 (보상 원)을 받을 수 있어요\n다시 풀어볼까요?",textAlign: TextAlign.center,),
                  PrimaryActionButton(
                    onPressed: () {
                      // 버튼 클릭 시 동작
                    },
                    label: quizState == QuizState.hasWrong ? "틀린 문제 다시 풀기" : "남은 문제 이어 풀기", isLoading: false,
                  ),
                ],
              );
            }
          }(),
        ),
        
      ),
    );
  }
}
