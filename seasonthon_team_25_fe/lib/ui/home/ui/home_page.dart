import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/gradients.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/home_controller.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/presentation/provider/attendance_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';
import 'package:seasonthon_team_25_fe/ui/home/widget/home_action_btn.dart';
import 'package:seasonthon_team_25_fe/ui/home/widget/quiz_progress_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // 카드 변수
  // 오늘 날짜 변수
  DateTime? today;
  String? formattedToday;

  String? bodyText;

  bool isAchievementCheckNeeded = true;
  bool isQuestCheckNeeded = true;

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    formattedToday = DateFormat('yyyy년 MM월 dd일').format(today!);
    Future.microtask(() {
      ref.read(homeControllerProvider.notifier).load();
    });
  }

  String _getSpeechBubbleText(AttendanceState attendanceState, bool homeAttendanceStatus) {
    // 출석체크 중일 때
    if (attendanceState.isLoading) {
      return "출석체크 중이에요...\n잠시만 기다려주세요!";
    }
    
    // 출석체크 결과가 있고, 홈 데이터가 아직 출석 안한 상태일 때만 결과 메시지 표시
    if (attendanceState.lastCheckResult != null && !homeAttendanceStatus) {
      final result = attendanceState.lastCheckResult!;
      if (result.success) {
        if (result.achievementCreated && result.achievementType != null) {
          return "출석체크 완료! 🎉\n새로운 업적을 달성했어요!";
        } else {
          return "출석체크 완료! ✅\n오늘도 파프와 함께해요!";
        }
      } else {
        return "오늘 이미 출석하셨어요! 😊\n내일 다시 만나요!";
      }
    }
    
    // 기본 상태: 홈 API의 실제 출석 상태 사용
    return homeAttendanceStatus
        ? "오늘의 뉴스를 확인하셨나요?\n새로운 소식을 확인해 보세요!"
        : "저를 누르시면 출석이 기록돼요!\n오늘도 파프할 준비 되셨나요?";
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);
    final attendanceState = ref.watch(attendanceControllerProvider);
    
    return Scaffold(
      body: homeState.when(
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
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (data) {
          final quizCount = data.quizCount;
          if (quizCount == 0) {
            bodyText = "오늘의 문제를 확인해 볼까요?";
          } else if (quizCount < 5) {
            bodyText = "오늘 5문제 중 $quizCount문제를 풀었어요!";
          } else {
            bodyText = "오늘 모든 퀴즈를 다 풀었어요!";
          }
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(gradient: AppGradients.homeBackground),
              padding: const EdgeInsets.fromLTRB(20, 64, 20, 10),
              child: Center(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: CoinBalanceChip(
                        balance: data.balance,
                        backgroundColor: AppColors.wt_50,
                        textColor: AppColors.primarySky,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.wt,
                        borderRadius: BorderRadius.circular(
                          AppRadius.bottomSheet,
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              formattedToday!,
                              style: AppTypography.m500.copyWith(
                                color: AppColors.primarySky,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${data.characterName}님,\n$bodyText",
                              style: AppTypography.h3,
                            ),
                          ),
                          const SizedBox(height: 26),
                          QuizProgressBar(total: 5, current: data.quizCount),
                          const SizedBox(height: 26),
                          Row(
                            children: [
                              // 화면 이동
                              // 상태 반영
                              HomeActionBtn(
                                icon: Assets.images.home.achievementIcon.image(
                                  width: 48,
                                  height: 48,
                                ),
                                label: "업적 확인",
                                onTap: () {
                                  context.go("/achievement");
                                },
                                showBadge: isAchievementCheckNeeded,
                              ),
                              const SizedBox(width: 16),
                              HomeActionBtn(
                                icon: Assets.images.home.questIcon.image(
                                  width: 48,
                                  height: 48,
                                ),
                                label: "내 퀘스트",
                                onTap: () {
                                  context.go("/quest");
                                },
                                showBadge: isQuestCheckNeeded,
                              ),
                              const SizedBox(width: 16),
                              HomeActionBtn(
                                icon: Assets.images.home.attendanceIcon.image(
                                  width: 48,
                                  height: 48,
                                ),
                                label: "출석 체크",
                                onTap: () {
                                  context.go("/attendance");
                                },
                                showBadge: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        // 홈 데이터에서 실제 출석 상태 확인
                        final homeData = homeState.valueOrNull;
                        final actualAttendanceStatus = homeData?.attendance ?? false;
                        
                        if (!actualAttendanceStatus) {
                          // 출석체크 API 호출
                          await ref.read(attendanceControllerProvider.notifier).checkAttendance();
                          // 출석체크 후 홈 데이터 새로고침
                          ref.read(homeControllerProvider.notifier).load();
                        } else {
                          // 이미 출석했으면 뉴스로 이동
                          context.go("/news");
                        }
                      },
                      child: SizedBox(
                        width: 200,
                        height: 300,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            // 캐릭터
                            Positioned(
                              top: 10,
                              left: -10,
                              child: Lottie.asset(
                                Assets.lottie.faff,
                                width: 189.74,
                                height: 275.6,
                                repeat: true,
                              ),
                            ),

                            // 별
                            Positioned(
                              top: 50,
                              left: -30,
                              child: Lottie.asset(
                                Assets.lottie.star,
                                width: 200,
                                height: 200,
                                repeat: true,
                              ),
                            ),

                            // 말풍선
                            Positioned(
                              child: SpeechBubble(
                                nip: BubbleNip.bottomCenter,
                                color: AppColors.wt,
                                radius: AppRadius.button,
                                elevation: 8,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Text(
                                  _getSpeechBubbleText(
                                    attendanceState, 
                                    homeState.valueOrNull?.attendance ?? false
                                  ),
                                  style: AppTypography.m600.copyWith(
                                    color: AppColors.secondaryBl,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
