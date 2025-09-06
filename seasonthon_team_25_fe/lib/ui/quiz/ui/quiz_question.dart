import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/repository/quiz.dart';
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
  bool? selectedO;       // OX 선택값
  int? selectedIndex;    // MCQ 선택 인덱스

  void _resetLocalSelection() {
    selectedO = null;
    selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(quizSessionProvider);
    final notifier = ref.read(quizSessionProvider.notifier);

    if (session.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (session.error != null) {
      return Scaffold(
        appBar: const CustomAppBar(title: "퀴즈", showLeft: true, showRight: false),
        body: Center(child: Text('불러오기 실패: ${session.error}')),
      );
    }
    if (!session.hasData || session.completed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/quiz');
      });
      return const Scaffold(body: SizedBox.shrink());
    }

    final total = session.quizzes.length;
    final idx = session.currentIndex;
    final q = session.quizzes[idx];

    final bool isOX = q.type == 'OX';
    // ✅ 타입별 카드 높이 분기 (적당히 여유 줌)
    final double cardHeight = isOX ? 360.0 : 500.0;

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
            // ✅ 카드 화면 '정중앙' 배치를 위해 Expanded+Center
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

                      // ✅ 내용 영역은 남은 공간에 맞춰 확장 + 스크롤 가능
                      Expanded(
                        child: isOX
                            ? _OxArea(
                                selectedO: selectedO,
                                onSelect: (v) => setState(() => selectedO = v),
                              )
                            : _McqArea(
                                options: q.mcqOptions ?? const [],
                                selectedIndex: selectedIndex,
                                onSelect: (i) => setState(() => selectedIndex = i),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            PrimaryActionButton(
              isLoading: false,
              label: "선택했어요",
              onPressed: () {
                // 선택 검증
                if (q.type == 'OX' && selectedO == null) return;
                if (q.type == 'MCQ' && selectedIndex == null) return;

                // 서버 제출은 notifier 안에서 처리한다고 가정
                if (q.type == 'OX') {
                  notifier.answerOx(selectedO!);
                } else {
                  notifier.answerMcq(selectedIndex!);
                }

                if (session.isLast) {
                  notifier.next(); // completed = true
                  if (mounted) context.go('/quiz');
                } else {
                  notifier.next();
                  _resetLocalSelection();
                  setState(() {}); // 다음 문제 반영
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// OX 전용 영역 (Row 높이/정렬 안정화)
class _OxArea extends StatelessWidget {
  const _OxArea({
    required this.selectedO,
    required this.onSelect,
  });

  final bool? selectedO;
  final ValueChanged<bool> onSelect;

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
              onTap: () => onSelect(true),
            ),
            _oxChoiceBox(
              label: "틀려요",
              image: Assets.images.quiz.answerX,
              selected: selectedO == false,
              onTap: () => onSelect(false),
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
    required VoidCallback onTap,
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
            const Text(" ", style: TextStyle(color: Colors.white)), // 라벨 감성 유지
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

/// MCQ 전용 영역 (스크롤 가능)
class _McqArea extends StatelessWidget {
  const _McqArea({
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<String> options;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    // 카드 내부 남은 공간에서 자연스럽게 스크롤되도록 ListView
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: options.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final isSel = selectedIndex == i;
        return InkWell(
          onTap: () => onSelect(i),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isSel ? AppColors.primary : AppColors.primary.withValues(alpha: .25),
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