import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/news/presentation/provider/news_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/tab_bar/custom_tab_bar.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/ui/news/widgets/news_list_item.dart';

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
                // --- [탭 1] 넘겨보기 (placeholder) ---
                const Center(child: Text('넘겨보기')),

                // --- [탭 2] 골라보기 (리스트) ---
                Column(
                  children: [
                    // 상단 로딩/에러 표시(최초 로딩 상태)
                    state.page.when(
                      data: (_) => const SizedBox.shrink(),
                      loading: () => const LinearProgressIndicator(
                        color: AppColors.primarySky,
                        backgroundColor: AppColors.gr200,
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
                            child: _NewsListView(
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

class _NewsListView extends StatelessWidget {
  const _NewsListView({
    required this.items,
    required this.isLoadingMore,
    required this.onTapItem,
  });

  final List<NewsItemEntity> items;
  final bool isLoadingMore;
  final void Function(NewsItemEntity) onTapItem;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('뉴스 불러오는 중'));
    }

    final itemCount = isLoadingMore ? items.length + 1 : items.length;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: itemCount,
      itemBuilder: (context, i) {
        if (i >= items.length) {
          // 바닥 로딩 셀
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primarySky,
                strokeWidth: 2.0,
              ),
            ),
          );
        }
        final item = items[i];
        return NewsListItem(item: item, onTap: () => onTapItem(item));
      },
    );
  }
}
