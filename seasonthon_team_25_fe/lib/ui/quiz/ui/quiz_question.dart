// lib/feature/quiz/ui/quiz_question_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_controller.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_models.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/rounded_text_box.dart';

// 새 설계 컨트롤러/모델

class QuizQuestionPage extends ConsumerStatefulWidget {
  const QuizQuestionPage({super.key});

  @override
  ConsumerState<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends ConsumerState<QuizQuestionPage> {
  bool? selectedO;    // OX 선택값
  int? selectedIndex; // MCQ 선택 인덱스 (0-based)

  int? _lastPrintedUserQuizId; // 중복 로그 방지

  void _resetLocalSelection() {
    selectedO = null;
    selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider);
    final ctrl  = ref.read(quizControllerProvider.notifier);

    // 로딩
    if (state.phase == QuizPhase.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // 에러
    if (state.phase == QuizPhase.error) {
      return Scaffold(
        appBar: const CustomAppBar(title: "퀴즈", showLeft: true, showRight: false),
        body: Center(child: Text('불러오기 실패: ${state.error ?? '알 수 없는 오류'}')),
      );
    }

    // 데이터 없거나 완료되면 리스트 페이지로
    if (!state.hasData || state.phase == QuizPhase.finished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/quiz');
      });
      return const Scaffold(body: SizedBox.shrink());
    }

    final q = state.current!;
    final total = state.questions.length;
    final idx   = state.index;
    final isOX  = (q.type == QuizType.ox);

    // 카드 높이
    final double cardHeight =
        state.phase == QuizPhase.revealed ? (isOX ? 430 : 560) : (isOX ? 360 : 500);

    // 문제 진입 시 정답 로그 (중복 방지)
    if (_lastPrintedUserQuizId != q.userQuizId) {
      debugPrint('[QUIZ] show Q id=${q.userQuizId} correct=${q.normalizedCorrect} '
          'type=${q.type == QuizType.ox ? 'OX' : 'MCQ'}');
      _lastPrintedUserQuizId = q.userQuizId;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "퀴즈",
        showLeft: true,
        showRight: false,
        onTapLeft: () => context.go('/quiz'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        color: AppColors.sk,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlurredCard(
                  width: 335,
                  height: cardHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedTextBox(text: "$total개 중 ${idx + 1}번째 퀴즈"),
                      const SizedBox(height: 8),
                      Text(
                        q.question,
                        textAlign: TextAlign.center,
                        style: AppTypography.h2.copyWith(color: AppColors.bk),
                      ),
                      const SizedBox(height: 12),

                      // 본문(선택영역 또는 선택영역 + 해설)
                      Expanded(
                        child: Column(
                          children: [
                            // 선택 영역
                            Expanded(
                              child: isOX
                                  ? _OxArea(
                                      selectedO: selectedO,
                                      onSelect: state.phase == QuizPhase.revealed
                                          ? null // 해설 노출 중에는 선택 잠금
                                          : (v) => setState(() => selectedO = v),
                                    )
                                  : _McqArea(
                                      options: q.mcqOptions ?? const [],
                                      selectedIndex: selectedIndex,
                                      onSelect: state.phase == QuizPhase.revealed
                                          ? null // 해설 노출 중에는 선택 잠금
                                          : (i) => setState(() => selectedIndex = i),
                                    ),
                            ),

                            // 해설/정답 노출
                            if (state.phase == QuizPhase.revealed) ...[
                              const SizedBox(height: 12),
                              _RevealBlock(
                                isCorrect: state.verdicts[q.userQuizId] == true,
                                explanation: q.explanation,
                                newsUrl: q.newsUrl,
                                correctLabel: q.type == QuizType.ox
                                    ? (q.normalizedCorrect == 'true' ? 'O(맞아요)' : 'X(틀려요)')
                                    : '정답: ${q.normalizedCorrect}번',
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 하단 버튼
            if (state.phase == QuizPhase.asking) ...[
              PrimaryActionButton(
                isLoading: false,
                label: "선택했어요",
                onPressed: () async {
                  // 선택 검증
                  if (isOX && selectedO == null) return;
                  if (!isOX && selectedIndex == null) return;

                  // 서버 규격으로 변환
                  final userAnswer = isOX
                      ? (selectedO! ? 'true' : 'false')
                      : '${selectedIndex! + 1}';

                  await ctrl.submitCurrent(userAnswer);

                  // 간단 피드백
                  final isCorrect = state.current != null
                      ? (userAnswer == state.current!.normalizedCorrect)
                      : null;
                  if (kDebugMode && isCorrect != null) {
                    debugPrint('[QUIZ] answered id=${q.userQuizId} '
                        'user=$userAnswer correct=${q.normalizedCorrect} '
                        '=> ${isCorrect ? 'CORRECT' : 'WRONG'}');
                  }

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          (state.verdicts[q.userQuizId] == true)
                              ? '정답이에요!'
                              : '오답이에요!',
                        ),
                        duration: const Duration(milliseconds: 700),
                      ),
                    );
                  }
                },
              ),
            ] else if (state.phase == QuizPhase.revealed) ...[
              PrimaryActionButton(
                isLoading: false,
                label: state.isLast ? "완료" : "다음 문제",
                onPressed: () {
                  if (state.isLast) {
                    ctrl.next(); // finished
                    context.go('/quiz');
                  } else {
                    ctrl.next();
                    _resetLocalSelection();
                    setState(() {}); // 다음 반영
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// OX 전용 영역 (선택 잠금 지원)
class _OxArea extends StatelessWidget {
  const _OxArea({
    required this.selectedO,
    required this.onSelect,
  });

  final bool? selectedO;
  final ValueChanged<bool>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _oxChoiceBox(
              label: "맞아요",
              image: Assets.images.quiz.answerO,
              selected: selectedO == true,
              onTap: onSelect == null ? null : () => onSelect!(true),
            ),
            _oxChoiceBox(
              label: "틀려요",
              image: Assets.images.quiz.answerX,
              selected: selectedO == false,
              onTap: onSelect == null ? null : () => onSelect!(false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _oxChoiceBox({
    required String label,
    required AssetGenImage image,
    required bool selected,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: 130,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.5)
              : AppColors.sk.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            image.image(width: 100, height: 100, fit: BoxFit.contain),
            const SizedBox(height: 4),
            const Text(" ", style: TextStyle(color: Colors.white)),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

/// MCQ 전용 영역 (선택 잠금 지원)
class _McqArea extends StatelessWidget {
  const _McqArea({
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<String> options;
  final int? selectedIndex;
  final ValueChanged<int>? onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: options.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final isSel = selectedIndex == i;
        return InkWell(
          onTap: onSelect == null ? null : () => onSelect!(i),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSel
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: .25),
              ),
              borderRadius: BorderRadius.circular(24),
              color: isSel
                  ? AppColors.primary.withValues(alpha: 0.08)
                  : Colors.transparent,
            ),
            child: Text(
              options[i],
              style: AppTypography.l500.copyWith(color: AppColors.bk),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

/// 정답/해설 블록
class _RevealBlock extends StatelessWidget {
  const _RevealBlock({
    required this.isCorrect,
    required this.correctLabel,
    this.explanation,
    this.newsUrl,
  });

  final bool isCorrect;
  final String correctLabel;
  final String? explanation;
  final String? newsUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      decoration: BoxDecoration(
        color: isCorrect
            ? AppColors.primary.withValues(alpha: .10)
            : Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect
              ? AppColors.primary
              : Colors.black.withOpacity(.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isCorrect ? '정답입니다! ✅' : '아쉬워요! ❌',
              style: AppTypography.h3.copyWith(color: AppColors.bk)),
          const SizedBox(height: 6),
          Text(correctLabel, style: AppTypography.l500.copyWith(color: AppColors.bk)),
          if (explanation != null) ...[
            const SizedBox(height: 6),
            Text(
              explanation!,
              style: AppTypography.l500.copyWith(color: AppColors.bk),
            ),
          ],
          if (newsUrl != null && newsUrl!.isNotEmpty) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // 라우터/웹뷰 정책에 맞게 구현하세요.
                // 예: context.push('/web?url=${Uri.encodeComponent(newsUrl!)}');
              },
              child: Text(
                '관련 기사 보러가기',
                style: AppTypography.l500.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}