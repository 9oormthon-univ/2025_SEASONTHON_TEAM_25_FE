import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/presentation/provider/quiz_run_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_white_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_filled_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';

class QuizRunPage extends ConsumerStatefulWidget {
  const QuizRunPage({super.key, required this.quizzes});
  final List<QuizEntity> quizzes;

  @override
  ConsumerState<QuizRunPage> createState() => _QuizRunPageState();
}

class _QuizRunPageState extends ConsumerState<QuizRunPage> {
  List<QuizEntity> get quizzes => widget.quizzes;
  bool hintClicked = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizRunControllerProvider(quizzes));
    final ctrl = ref.read(quizRunControllerProvider(quizzes).notifier);
    final q = state.current;
    final selected = state.answers[q.userQuizId];

    final result = state.lastResult; // SubmitAnswerResponse?
    //final showResult = result != null; // 제출됨
    final showResult = result == null; // 제출됨
    final isCorrect = result?.correct ?? false;

    Future<void> submit() async {
      try {
        await ctrl.submitCurrent(); // lastResult가 채워짐
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('제출 실패: $e')));
      }
    }

    return Scaffold(
      backgroundColor: AppColors.secondarySk,
      appBar: CustomWhiteAppBar(
        title: '퀴즈',
        showLeftBtn: !showResult,
        onTapLeftBtn: () => Navigator.of(context).pop(),
        showRightBtn: !showResult,
        onTapRightBtn: () => context.go('/quiz'),
      ),
      body: Column(
        children: [
          if (showResult) ...[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: isCorrect ? AppColors.sk_75 : AppColors.rd_75,
              width: double.infinity,
              child: Text(
                isCorrect ? '정답이에요!' : '오답이에요!',
                textAlign: TextAlign.center,
                style: AppTypography.h2.copyWith(color: AppColors.wt),
              ),
            ),
          ] else ...[
            const SizedBox(height: 12),
          ],
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 24, 20, 10),
            child: Column(
              children: [
                Container(
                  width: 335,
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                  decoration: BoxDecoration(
                    color: AppColors.wt,
                    borderRadius: BorderRadius.circular(AppRadius.chips),
                    boxShadow: AppShadows.dsDefault,
                  ),
                  child: Column(
                    children: [
                      SkFilledChip(
                        label:
                            '${state.quizzes.length}개 중 ${state.index + 1}번째 퀴즈',
                        textStyle: AppTypography.m500.copyWith(
                          color: AppColors.primarySky,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        q.question,
                        style: AppTypography.h3,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: switch (q.type) {
                          QuizTypeEntity.ox => _OxView(
                            key: ValueKey('ox_${q.userQuizId}'),
                            selected: selected,
                            onSelect: ctrl.selectOx,
                          ),
                          QuizTypeEntity.mcq => _McqView(
                            key: ValueKey('mcq_${q.userQuizId}'),
                            options: q.options,
                            selected: selected,
                            onSelectIndex1Based: ctrl.selectMcqByIndex1Based,
                            onSelectText: ctrl.selectMcqByText,
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                if (showResult) ...[
                  const SizedBox(height: 30),
                  // isCorrect||hintClicked == true
                  if (false) ...[
                    Row(
                      children: [
                        Image(
                          image: Assets.images.characters.ffStart.provider(),
                          width: 100,
                          height: 122.49,
                        ),
                        // 말풍선
                        Expanded(
                          child: SpeechBubble(
                            color: AppColors.wt_75, // 말풍선 연한 하늘색 채움
                            radius: AppRadius.button,
                            elevation: 8,
                            nip: BubbleNip.left, // 좌측 꼬리
                            nipWidth: 16, // 꼬리 길이
                            nipHeight: 16, // 꼬리 두께(세로)
                            nipOffset: 80, // 위에서부터 거리
                            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // 칩
                                SkFilledChip(label: !hintClicked ? "해설" : "힌트"),
                                const SizedBox(height: 8),
                                // 본문 텍스트 (파란색, 넉넉한 행간)
                                Text(
                                  result?.explanation ?? '',
                                  style: AppTypography.m600.copyWith(
                                    color: AppColors.primarySky,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    InkWell(
                      onTap: () {
                        // 힌트 보기 클릭 시
                        debugPrint("힌트 보기 클릭됨");
                        setState(() {
                          hintClicked = true;
                        });
                      },
                      child: Row(
                        children: [
                          Image(
                            image: Assets.images.characters.ffStart.provider(),
                            width: 100,
                            height: 122.49,
                          ),
                          // 말풍선
                          Expanded(
                            child: SpeechBubble(
                              color: AppColors.wt_75, // 말풍선 연한 하늘색 채움
                              radius: AppRadius.button,
                              elevation: 8,
                              nip: BubbleNip.left, // 좌측 꼬리
                              nipWidth: 16, // 꼬리 길이
                              nipHeight: 16, // 꼬리 두께(세로)
                              nipOffset: 80, // 위에서부터 거리
                              padding: const EdgeInsets.fromLTRB(
                                20,
                                12,
                                20,
                                12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    result?.explanation ?? '앗! 혹시 문제가 너무 어려웠나요?\n저를 클릭하시면 힌트를 볼 수 있어요.\n힌트를 보고 다시 도전해 볼까요?',
                                    style: AppTypography.m600.copyWith(
                                      color: AppColors.primarySky,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 52),
                PrimaryFilledButton(
                  label: "선택했어요",
                  onPressed: () {
                    final canSubmit = selected != null && !state.submitting;
                    if (!canSubmit) return;
                    submit();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OxView extends StatelessWidget {
  const _OxView({super.key, required this.selected, required this.onSelect});

  final String? selected; // "true" / "false"
  final void Function(bool) onSelect;

  @override
  Widget build(BuildContext context) {
    final isO = selected == 'true';
    final isX = selected == 'false';

    return Column(
      children: [
        Row(
          children: [
            // O 카드
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadius.button),
                onTap: () => onSelect(true),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  decoration: BoxDecoration(
                    color: isO ? AppColors.primarySky : AppColors.sk_25,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: Assets.images.quiz.answerO.provider(),
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        "맞아요",
                        style: AppTypography.h3.copyWith(color: AppColors.wt),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // X 카드
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadius.button),
                onTap: () => onSelect(false),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  decoration: BoxDecoration(
                    color: isX ? AppColors.primarySky : AppColors.sk_25,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: Assets.images.quiz.answerX.provider(),
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        "틀려요",
                        style: AppTypography.h3.copyWith(color: AppColors.wt),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _McqView extends StatelessWidget {
  const _McqView({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelectIndex1Based,
    required this.onSelectText,
  });

  final List<String> options;
  final String? selected; // "1".."n" 또는 (텍스트 선택을 허용하면) 보기 텍스트
  final void Function(int) onSelectIndex1Based;
  final void Function(String) onSelectText;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      key: key,
      itemCount: options.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        final idx1 = i + 1;
        final isSel = selected == idx1.toString() || selected == options[i];
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSel
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.shade300,
            ),
          ),
          title: Text(options[i]),
          onTap: () => onSelectIndex1Based(idx1), // 또는 onSelectText(options[i])
          trailing: isSel ? const Icon(Icons.check) : null,
        );
      },
    );
  }
}

class _ResultSheet extends StatelessWidget {
  const _ResultSheet({
    required this.isCorrect,
    required this.explanation,
    required this.category,
    required this.hint,
  });

  final bool isCorrect;
  final String explanation;
  final String category;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        runSpacing: 12,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? c.primary : c.error,
              ),
              const SizedBox(width: 8),
              Text(
                isCorrect ? '정답입니다!' : '오답입니다.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Text('해설: $explanation'),
          if (category == 'news') Text('힌트(뉴스 ID): $hint'),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('다음 문제'),
            ),
          ),
        ],
      ),
    );
  }
}
