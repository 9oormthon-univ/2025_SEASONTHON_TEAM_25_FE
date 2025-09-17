import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/gradients.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';
import 'package:seasonthon_team_25_fe/ui/home/widget/home_action_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int? balance;
  SharedPreferences? prefs;
  String? userName;
  bool isLoadingBalance = true;

  // 카드 변수
  // 오늘 날짜 변수
  DateTime? today;
  String? formattedToday;

  String bodyText = "오늘의 문제를 확인해 볼까요?";

  bool isAchievementCheckNeeded = true;
  bool isQuestCheckNeeded = true;

  // 출석 체크
  bool isCheckedIn = false;

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    formattedToday = DateFormat('yyyy년 MM월 dd일').format(today!);
    _loadUserName();
    _loadBalance();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('characterName') ?? 'Username';
    });
  }

  Future<void> _loadBalance() async {
    try {
      final dio = ref.read(dioProvider);
      final res = await dio.get('/api/wallet/balance');
      setState(() {
        balance = res.data['balance'] as int;
        debugPrint('잔액 조회 성공: $balance');
        isLoadingBalance = false;
      });
    } catch (e) {
      debugPrint('잔액 조회 실패: $e');
      setState(() => isLoadingBalance = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppGradients.homeBackground),
        padding: const EdgeInsets.fromLTRB(20, 64, 20, 10),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.wt_50,
                      borderRadius: BorderRadius.circular(AppRadius.chips),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.images.home.coin.image(
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "0원",
                          style: AppTypography.m500.copyWith(
                            color: AppColors.primarySky,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
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
                        "$userName님,\n$bodyText",
                        style: AppTypography.h3,
                      ),
                    ),
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
                          onTap: () => debugPrint("업적 확인 클릭"),
                          showBadge: isAchievementCheckNeeded,
                        ),
                        const SizedBox(width: 16),
                        HomeActionBtn(
                          icon: Assets.images.home.questIcon.image(
                            width: 48,
                            height: 48,
                          ),
                          label: "내 퀘스트",
                          onTap: () => debugPrint("내 퀘스트 클릭"),
                          showBadge: isQuestCheckNeeded,
                        ),
                        const SizedBox(width: 16),
                        HomeActionBtn(
                          icon: Assets.images.home.attendanceIcon.image(
                            width: 48,
                            height: 48,
                          ),
                          label: "출석 체크",
                          onTap: () => debugPrint("출석 체크 클릭"),
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
                onTap: () {
                  if (!isCheckedIn) {
                    debugPrint('출석 체크 버튼 클릭');
                    setState(() {
                      isCheckedIn = true;
                    });
                  } else {
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
                            isCheckedIn
                                ? "오늘의 뉴스를 확인하셨나요?\n새로운 소식을 확인해 보세요!"
                                : "저를 누르시면 출석이 기록돼요!\n오늘도 파프할 준비 되셨나요?",
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
  }
}
