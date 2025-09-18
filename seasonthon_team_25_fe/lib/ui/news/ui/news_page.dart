import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/news/presentation/provider/news_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/tab_bar/custom_tab_bar.dart';
import 'package:seasonthon_team_25_fe/ui/news/ui/news_list_view.dart';
import 'package:seasonthon_team_25_fe/ui/news/ui/news_swipe_view.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  int _tabIndex = 0; // 0: 골라보기, 1: 넘겨보기

  @override
  void initState() {
    super.initState();
    // 첫 페이지 로드 (페이징 모드)
    Future.microtask(() {
      ref.read(newsControllerProvider.notifier).loadFirst(size: 10);
      // 단순 1페이지 리스트만 원하면 아래처럼:
      // ref.read(newsControllerProvider.notifier).loadSimple(size: 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '뉴스',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () => context.go("/home"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 23, 20, 10),
            child: CustomTabBar(
              labels: const ['넘겨보기', '골라보기'],
              selectedIndex: _tabIndex,
              onChanged: (i) => setState(() => _tabIndex = i),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _tabIndex,
              children: [
                // --- [탭 1] 넘겨보기 (카드 스와이프) ---
                Center(
                  child: NewsSwipeView(
                    items: state.items,
                    isLoading: state.page.isLoading,
                    onTapItem: (item) => context.go('/news/${item.id}'),
                  ),
                ),

                // --- [탭 2] 골라보기 (리스트) ---
                Column(
                  children: [
                    // 상단 로딩/에러 표시(최초 로딩 상태)
                    state.page.when(
                      data: (_) => const SizedBox.shrink(),
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
                      error: (e, _) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text('불러오기 실패: $e'),
                      ),
                    ),
                    Expanded(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondary: AppColors.primarySky,
                          ),
                        ),
                        child: RefreshIndicator(
                          onRefresh: () => ref
                              .read(newsControllerProvider.notifier)
                              .loadFirst(size: 10),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (n) {
                              // 바닥 근처에서 다음 페이지 로드
                              if (n.metrics.pixels >=
                                  n.metrics.maxScrollExtent - 200) {
                                ref
                                    .read(newsControllerProvider.notifier)
                                    .loadMore(size: 10);
                              }
                              return false;
                            },
                            child: NewsListView(
                              items: state.items,
                              isLoadingMore: state.isLoadingMore,
                              onTapItem: (item) =>
                                  context.go('/news/${item.id}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
