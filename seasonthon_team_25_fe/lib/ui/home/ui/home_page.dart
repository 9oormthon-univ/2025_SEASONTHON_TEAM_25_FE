import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final String reward = "1,234원";
  late SharedPreferences prefs;
  String? userName;

  @override
void initState() {
  super.initState();
  _loadUserName(); // 비동기 함수 호출
}

Future<void> _loadUserName() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    userName = prefs.getString('characterName') ?? '사용자'; // 기본값 설정
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 44),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.sk, AppColors.wt],
        ),
      ),

      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: RewardBox(
                  text: reward,
                  backgroundColor: AppColors.gr100,
                ),
              ),

              BlurredCard(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "안녕하세요, $userName님!",
                      style: AppTypography.h3.copyWith(color: AppColors.bk),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "가입을 환영합니다!",
                      style: AppTypography.h3.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: BlurredCard(
                  width: 100,
                  height: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.home.iconAchieve.image(
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "업적 확인",
                        style: AppTypography.m600.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: BlurredCard(
                  width: 100,
                  height: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.home.iconQuest.image(
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "내 퀘스트",
                        style: AppTypography.m600.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: BlurredCard(
                  width: 100,
                  height: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.home.iconAttendance.image(
                        width: 45,
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "출석 체크",
                        style: AppTypography.m600.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Assets.images.onboarding.faffNocircle.image(
              width: 225,
              height: 275.6,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
