import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/rounded_text_box.dart';

/*
// 1) 타입 정의 + 파서
enum QuizType { ox, mcq }
extension QuizTypeX on QuizType {
  static QuizType parse(String raw) {
    switch (raw.toUpperCase()) {
      case 'OX':
        return QuizType.ox;
      case 'MCQ':
      default:
        return QuizType.mcq;
    }
  }
}
 */

class QuizQuestionPage extends ConsumerStatefulWidget {
  const QuizQuestionPage({super.key});

  @override
  ConsumerState<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends ConsumerState<QuizQuestionPage> {
  final String rawType = 'OX'; // or 'MCQ'
  //final String rawType = 'MCQ'; // or 'MCQ'
  final String question = '정부는 공공데이터 개방을 확대한다. (맞으면 O, 틀리면 X)';
  final List<String> options = const [
    '군 장병 월급 2배 인상',
    '청년간부 내일준비적금 신설',
    '군 복무 중 해외연수 지원',
    '군 복무기간 단축',
  ];
  // 2) 선택 상태(부모에서 관리)
  bool? selectedO; // OX면 true/false
  int? selectedOptionIdx; // MCQ면 0..n-1

  bool get canSubmit {
    if (rawType == "OX") return selectedO != null;
    if (rawType == "MCQ") return selectedOptionIdx != null;
    return false;
  }

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

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
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        alignment: Alignment.center,
        color: AppColors.sk,
        child: Column(
          children: [
            BlurredCard(
              width: 335,
              height: 420,
              child: Column(
                children: [
                  RoundedTextBox(text: "5개 중 1번째 퀴즈",),
                  Text("질문 텍스트"),
                  if (rawType == "OX") ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint("o 클릭");
                            setState(() => selectedO = true);
                          },
                          child: Container(
                            height: 170,
                            width: 150,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedO == true? AppColors.primary.withValues(alpha: 0.5):AppColors.sk.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Assets.images.quiz.answerO.image(
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  "맞아요",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint("x 클릭");
                            setState(() => selectedO = false);
                          },
                          child: Container(
                            height: 170,
                            width: 150,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedO == false? AppColors.primary.withValues(alpha: 0.5):AppColors.sk.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Assets.images.quiz.answerX.image(
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  "틀려요",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else if (rawType == "MCQ") ...[
                    Column(
                      spacing: 16,
                      children: List.generate(options.length, (index) {
                        return InkWell(
                          onTap: () {
                            debugPrint("지금 인덱스 : $index");
                            setState(() => selectedOptionIdx = index);
                            debugPrint("선택됨$selectedOptionIdx");
                          },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedOptionIdx == null
                                  ? AppColors.primary.withValues(alpha: .25)
                                  : selectedOptionIdx == index
                                    ? AppColors.primary
                                    : AppColors.gr600,
                              ),
                              borderRadius: BorderRadius.circular(24), // 코너 추가
                              color: selectedOptionIdx == index
                                ? AppColors.primary.withOpacity(0.1) // 선택 시 배경색
                                : Colors.transparent, // 미선택 시 투명
                              ),
                              child: Text(
                              options[index],
                              style: AppTypography.l500.copyWith(color: AppColors.bk),
                              textAlign: TextAlign.center,
                              ),
                            ),
                        );
                      }),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            PrimaryActionButton(
              isLoading: false,
              label: "선택했어요",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}