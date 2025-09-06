import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/financial_list_item.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';
import 'package:seasonthon_team_25_fe/ui/news/widgets/news_list_item.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  final String reward = "1,234원";

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockNews = [
      {
        "title": "청년 희망 적금",
        "subtitle": "연 5% 금리, 2년 만기",
        "date": "2025-09-05",
        "url":
            "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
      },
      {
        "title": "주택 청약 저축",
        "subtitle": "내 집 마련 필수",
        "date": "2025-09-05",
        "url":
            "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
      },
      {
        "title": "단기 채권 펀드",
        "subtitle": "안정적인 단기 수익",
        "date": "2025-09-05",
        "url":
            "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
      },
      {
        "title": "연금 저축 보험",
        "subtitle": "노후 대비 장기 저축",
        "date": "2025-09-05",
        "url":
            "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
      },
      {
        "title": "고배당 주식 펀드",
        "subtitle": "분기별 배당 지급",
        "date": "2025-09-05",
        "url":
            "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(title: '뉴스', showLeft: true, showRight: false),
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
                    tabs: const [Tab(text: '넘겨보기'), Tab(text: '골라보기')],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('넘겨보기')),
                        ListView.builder(
                          itemCount: mockNews.length,
                          itemBuilder: (context, i) {
                            return NewsListItem(
                              item: mockNews[i],
                              onTap: () {
                                context.go('/news/detail', extra: mockNews[i]);
                              },
                            );
                          },
                        ),
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
