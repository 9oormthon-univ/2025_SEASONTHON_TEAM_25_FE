import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/feature/auth/routes/auth_routes.dart';
import 'package:seasonthon_team_25_fe/feature/bank/routes/bank_routes.dart';
import 'package:seasonthon_team_25_fe/feature/home/routes/home_routes.dart';
import 'package:seasonthon_team_25_fe/feature/news/routes/news_routes.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/routes/quiz_routes.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/routes/scrap_routes.dart';
import 'package:seasonthon_team_25_fe/feature/splash/routes/splah_routes.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/navigation/custom_bottom_nav_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/navigation/nav_item_data.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    ...splashRoutes,
    ...authRoutes,
    ...quizRoutes, // /quiz 및 하위
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(index);
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
      branches: [
        StatefulShellBranch(routes: newsRoutes),
        StatefulShellBranch(routes: quizRoutes),
        StatefulShellBranch(routes: homeRoutes),
        StatefulShellBranch(routes: scrapRoutes),
        StatefulShellBranch(routes: bankRoutes),
      ],
    ),
  ],
);
