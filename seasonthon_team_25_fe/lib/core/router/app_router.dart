import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/auth/routes/auth_routes.dart';
import 'package:seasonthon_team_25_fe/feature/bank/routes/bank_routes.dart';
import 'package:seasonthon_team_25_fe/feature/home/routes/home_routes.dart';
import 'package:seasonthon_team_25_fe/feature/news/routes/news_routes.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/routes/quiz_routes.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/routes/scrap_routes.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

final appRouter = GoRouter(
  initialLocation: '/news/detail',
  routes: [
    ...authRoutes,
    ...quizRoutes, // /quiz 및 하위
    ShellRoute(
      routes: [
        ...newsRoutes, // /news 및 하위
        ...homeRoutes, // /home 및 하위
        ...scrapRoutes, // /scrap 및 하위
        ...bankRoutes, // /bank 및 하위
      ],
      builder: (context, state, child) {
        // 탭 경로 정의 (순서 = 아래 destinations 순서)
        const tabs = <String>['/news', '/quiz', '/home', '/scrap', '/bank'];

        // 현재 위치에서 선택된 탭 인덱스 계산
        final location = state.matchedLocation;
        int selectedIndex = 0;
        for (var i = 0; i < tabs.length; i++) {
          final root = tabs[i];
          if (location == root || location.startsWith('$root/')) {
            selectedIndex = i;
            break;
          }
        }

        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavBar(
            height: 110,
            background: AppColors.wt,
            shadowColor: AppColors.primary.withValues(alpha: .25),
            selectedIndex: selectedIndex,
            onTap: (index) {
              final dest = tabs[index];
              if (location != dest) context.go(dest);
            },
            items: [
              NavItemData(
                label: '뉴스',
                iconOutlined:
                    Assets.images.bottomNavigationBarItem.newsOutlined,
                iconFilled: Assets.images.bottomNavigationBarItem.news,
              ),
              NavItemData(
                label: '퀴즈',
                iconOutlined:
                    Assets.images.bottomNavigationBarItem.quizOutlined,
                iconFilled: Assets.images.bottomNavigationBarItem.quiz,
              ),
              NavItemData(
                label: '홈',
                iconOutlined:
                    Assets.images.bottomNavigationBarItem.homeOutlined,
                iconFilled: Assets.images.bottomNavigationBarItem.home,
              ),
              NavItemData(
                label: '스크랩',
                iconOutlined:
                    Assets.images.bottomNavigationBarItem.scrapOutlined,
                iconFilled: Assets.images.bottomNavigationBarItem.scrap,
              ),
              NavItemData(
                label: '나만의 뱅크',
                iconOutlined:
                    Assets.images.bottomNavigationBarItem.myBankOutlined,
                iconFilled: Assets.images.bottomNavigationBarItem.myBank,
              ),
            ],
          ),
        );
      },
    ),
  ],
);

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.height = 96,
    this.background = Colors.white,
    this.shadowColor = const Color(0x14000000),
  });

  final List<NavItemData> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final double height;
  final Color background;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (i) {
            final item = items[i];
            final selected = i == selectedIndex;

            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration:
                      selected
                          ? BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .25),
                            borderRadius: BorderRadius.circular(14),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: AppColors.primary.withValues(alpha: .20),
                            //     blurRadius: 10,
                            //     offset: const Offset(0, 4),
                            //   ),
                            // ],
                          )
                          : null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // SVG 아이
                      selected
                          ? item.iconFilled.svg()
                          : item.iconOutlined.svg(),
                      const SizedBox(height: 6),
                      SizedBox(
                        height: 35,
                        child: Text(
                          item.label,
                          style:
                              selected
                                  ? TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                    height: 1.5,
                                  )
                                  : const TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                    height: 1.5, // 선택된 라벨 색상
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NavItemData {
  final String label;
  final SvgGenImage iconOutlined;
  final SvgGenImage iconFilled;
  const NavItemData({
    required this.label,
    required this.iconOutlined,
    required this.iconFilled,
  });
}
