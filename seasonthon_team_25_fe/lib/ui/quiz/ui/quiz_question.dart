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

class QuizQuestionPage extends ConsumerStatefulWidget {
  const QuizQuestionPage({super.key});
  @override
  ConsumerState<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends ConsumerState<QuizQuestionPage> {
  bool? selectedO; // OX 선택값
  int? selectedIndex; // MCQ 0-based 선택값
  int? _lastPrintedUserQuizId;

  void _resetLocalSelection() {
    selectedO = null;
    selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizControllerProvider);
    final ctrl = ref.read(quizControllerProvider.notifier);

    if (state.phase == QuizPhase.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
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
    if (!state.hasData || state.phase == QuizPhase.finished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/quiz');
      });
      return const Scaffold(body: SizedBox.shrink());
    }

    final q = state.current!;
    final total = state.questions.length;
    final idx = state.index;
    final isOX = (q.type == QuizType.ox);

    final bool isRevealed = (state.phase == QuizPhase.revealed);
    final bool isCorrect = state.verdicts[q.userQuizId] == true;

    // 카드 높이는 여유 있게 (MCQ가 길면 스크롤로 모두 볼 수 있음)
    final double cardHeight =
        isRevealed ? (isOX ? 430 : 650) : (isOX ? 360 : 650);

    if (_lastPrintedUserQuizId != q.userQuizId) {
      debugPrint(
        '[QUIZ] show Q id=${q.userQuizId} correct=${q.normalizedCorrect} type=${q.type}',
      );
      _lastPrintedUserQuizId = q.userQuizId;
      // 새 문항 진입 시 로컬 선택 초기화(화면 잔상 방지)
      _resetLocalSelection();
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
                      RoundedTextBox(
                        text:
                            "${total}개 중 ${idx + 1}번째 퀴즈"
                            "${state.retryMode ? ' (오답 재도전)' : ''}",
                      ),
                      const SizedBox(height: 8),
                      Text(
                        q.question,
                        textAlign: TextAlign.center,
                        style: AppTypography.h2.copyWith(color: AppColors.bk),
                      ),
                      const SizedBox(height: 12),

                      Expanded(
                        child: Column(
                          children: [
                            // 선택 영역 (해설 단계에서는 잠금)
                            Expanded(
                              child:
                                  isOX
                                      ? _OxArea(
                                        selectedO: selectedO,
                                        onSelect:
                                            isRevealed
                                                ? null
                                                : (v) => setState(
                                                  () => selectedO = v,
                                                ),
                                      )
                                      : _McqArea(
                                        options: q.mcqOptions ?? const [],
                                        selectedIndex: selectedIndex,
                                        onSelect:
                                            isRevealed
                                                ? null
                                                : (i) => setState(
                                                  () => selectedIndex = i,
                                                ),
                                      ),
                            ),

                            // ✅ 해설: "정답일 때만" 노출
                            if (isRevealed && isCorrect) ...[
                              const SizedBox(height: 12),
                              _RevealBlock(
                                explanation: q.explanation,
                                newsUrl: q.newsUrl,
                                correctLabel:
                                    q.type == QuizType.ox
                                        ? (q.normalizedCorrect == 'true'
                                            ? '정답: O(맞아요)'
                                            : '정답: X(틀려요)')
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

            // 하단 행동 버튼
            if (!isRevealed) ...[
              PrimaryActionButton(
                label: "선택했어요",
                onPressed: () async {
                  // 선택값 검증
                  if (isOX && selectedO == null) return;
                  if (!isOX && selectedIndex == null) return;

                  // 1) 로컬 정오판정 계산 (문자열 정규화 없이 타입 기반)
                  late final bool nowCorrect;
                  if (isOX) {
                    nowCorrect = (selectedO!.toString() == q.normalizedCorrect);
                  } else {
                    final one = (selectedIndex! + 1).toString();
                    nowCorrect = (one == q.normalizedCorrect);
                  }

                  // 2) 서버 제출 (타입 분기)
                  try {
                    if (isOX) {
                      await ctrl.submitCurrent(oxValue: selectedO);
                    } else {
                      await ctrl.submitCurrent(mcqIndex0: selectedIndex);
                    }
                  } catch (_) {
                    // 컨트롤러에서 에러 상태 세팅함
                  }

                  // 3) UI 분기
                  if (nowCorrect) {
                    // 정답 → 해설 노출 단계(컨트롤러가 revealed=true로 변경)
                    setState(() {});
                  } else {
                    // 오답 → 안내 후 다음
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("오답입니다")));
                    if (state.isLast) {
                      ctrl.next();
                      if (mounted) context.go('/quiz');
                    } else {
                      ctrl.next();
                      _resetLocalSelection();
                      setState(() {});
                    }
                  }
                },
                isLoading: false,
              ),
            ] else if (isCorrect) ...[
              // ✅ 정답일 때만 해설 단계 버튼 노출
              PrimaryActionButton(
                label: state.isLast ? "완료" : "다음 문제",
                onPressed: () {
                  if (state.isLast) {
                    ctrl.next();
                    context.go('/quiz');
                  } else {
                    ctrl.next();
                    _resetLocalSelection();
                    setState(() {});
                  }
                },
                isLoading: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// OX 선택 위젯
class _OxArea extends StatelessWidget {
  const _OxArea({required this.selectedO, required this.onSelect});
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
          color:
              selected
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

/// MCQ 선택 위젯
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
    // ListView는 상위 Expanded 안에서 스크롤됨
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: options.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final isSel = selectedIndex == i;
        return InkWell(
          onTap: onSelect == null ? null : () => onSelect!(i),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isSel
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: .25),
              ),
              borderRadius: BorderRadius.circular(24),
              color:
                  isSel
                      ? AppColors.primary.withValues(alpha: 0.08)
                      : Colors.transparent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${i + 1}. ',
                  style: AppTypography.l500.copyWith(color: AppColors.primary),
                ),
                Expanded(
                  child: Text(
                    options[i],
                    style: AppTypography.l500.copyWith(color: AppColors.bk),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 정답일 때만 쓰는 해설 블록
class _RevealBlock extends StatelessWidget {
  const _RevealBlock({
    required this.correctLabel,
    this.explanation,
    this.newsUrl,
  });

  final String correctLabel;
  final String? explanation;
  final String? newsUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('정답입니다!', style: AppTypography.h3.copyWith(color: AppColors.bk)),
          const SizedBox(height: 6),
          Text(
            correctLabel,
            style: AppTypography.l500.copyWith(color: AppColors.bk),
          ),
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
                // TODO: 웹뷰/외부 브라우저 연결
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
