import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/news/repository/list.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/news/widgets/news_list_item.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  late Future<List<NewsItem>> _future;

  @override
  void initState() {
    super.initState();
    // 뉴스 리스트 최초 로드
    _future = ref.read(newsRepositoryProvider).fetchNewsList(size: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(title: '뉴스', showLeft: true, showRight: false,
      onTapLeft: () {
        context.go("/home");
      },),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.primary,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.primary,
                    tabs: const [Tab(text: '골라보기'), Tab(text: '넘겨보기')],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // ✅ 골라보기 탭
                        FutureBuilder<List<NewsItem>>(
                          future: _future,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('불러오기 실패: ${snapshot.error}'));
                            }

                            final items = snapshot.data ?? [];
                            if (items.isEmpty) {
                              return const Center(child: Text('뉴스가 없어요'));
                            }

                            return ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, i) {
                                final item = items[i];
                                return NewsListItem(
                                  item: item,
                                  onTap: () {
                                    // 상세페이지 이동 (id 전달)
                                    context.go('/news/${item.id}');
                                  },
                                );
                              },
                            );
                          },
                        ),

                        // ✅ 넘겨보기 탭
                        const Center(child: Text('넘겨보기')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}