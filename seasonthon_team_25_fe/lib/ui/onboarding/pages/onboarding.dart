import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/onboarding/widget/onboarding_card.dart';

// 온보딩 페이지 데이터 모델
class OnboardingData {
  final String title;
  final String description;
  final Widget visual; // 🔹 에셋 대신 위젯 전체를 받음

  const OnboardingData({
    required this.title,
    required this.description,
    required this.visual,
  });
}

// 온보딩 데이터
final List<OnboardingData> onboardingPages = [
  OnboardingData(
    title: "안전한 실패가 경험이 되는 곳",
    description:
        "파프는 많은 금융 경험을 시도할 수 있는 샌드박스예요\n실패해도 괜찮아요,\n여기서 배운 경험이 진짜 성장으로 이어질 테니까요!",
    visual: const OnboardingVisual1(),
  ),
  OnboardingData(
    title: "뉴스 보고, 퀴즈 풀고, 리워드로 성장해요",
    description:
        "경제 뉴스를 읽고 퀴즈를 풀면 리워드를 지급해요\n리워드로 저축과 투자 경험을 만들 수 있어요\n이렇게 리워드는 내 성장의 또다른 바탕이 돼요",
    visual: const OnboardingVisual2(),
  ),
  OnboardingData(
    title: "파프는 지금도 계속 자라고 있어요",
    description:
        "해커톤 내에서는 예적금 경험을 우선적으로 제공하지만\n이후 주식 기능까지 확장될 예정이에요\n더 넓어진 파프의 금융 세계를 곧 만나보세요!",
    visual: const OnboardingVisual3(),
  ),
];

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 페이지 인디케이터 위젯
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingPages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentPage == index
                ? AppColors.primarySky
                : AppColors.gr200,
          ),
        ),
      ),
    );
  }

  // 개별 온보딩 페이지 위젯
  Widget _buildOnboardingPage(OnboardingData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 각자 다른 이미지+로티 조합
          data.visual,
          const SizedBox(height: 32),
          Text(
            data.title,
            style: AppTypography.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            data.description,
            style: AppTypography.l500.copyWith(color: AppColors.gr600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(onboardingPages[index]);
                },
              ),
            ),

            const SizedBox(height: 40),
            _buildPageIndicator(),
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  PrimaryFilledButton(
                    label: _currentPage == onboardingPages.length - 1
                        ? "시작하기"
                        : "다음",
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        context.go('/nickname');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      context.go('/nickname');
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.gr400,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        "튜토리얼 스킵하기",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
