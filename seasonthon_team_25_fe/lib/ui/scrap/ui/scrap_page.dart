import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/presentation/provider/scrap_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/html_image.dart';

class ScrapPage extends ConsumerStatefulWidget {
  const ScrapPage({super.key});

  @override
  ConsumerState<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends ConsumerState<ScrapPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // 페이지 로드 시 스크랩 목록 조회
    Future.microtask(() {
      ref.read(scrapControllerProvider.notifier).loadScrapNews();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrapState = ref.watch(scrapControllerProvider);
    final scrapNewsPage = scrapState.scrapNewsPage;
    final isLoading = scrapState.isLoadingList;
    final error = scrapState.error;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '스크랩',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () => context.pop(),
        onTapRightBtn: () => context.pop(),
      ),
      body: Column(
        children: [
          // 탭 바
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.gr100,
              borderRadius: BorderRadius.circular(AppRadius.chips),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primarySky,
                borderRadius: BorderRadius.circular(AppRadius.chips),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.wt,
              unselectedLabelColor: AppColors.gr600,
              labelStyle: AppTypography.m600,
              unselectedLabelStyle: AppTypography.m400,
              tabs: const [
                Tab(text: '스크랩한 뉴스'),
                Tab(text: '스크랩한 퀴즈'),
              ],
            ),
          ),
          
          // 탭 뷰
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNewsTab(scrapNewsPage, isLoading, error),
                _buildQuizTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsTab(scrapNewsPage, bool isLoading, String? error) {
    if (error != null) {
      return _buildErrorState(error);
    }

    if (isLoading && scrapNewsPage == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (scrapNewsPage == null || scrapNewsPage.content.isEmpty) {
      return _buildEmptyState();
    }

    return _buildNewsGroupedList(scrapNewsPage);
  }

  Widget _buildQuizTab() {
    return _buildEmptyState(
      message: '스크랩한 퀴즈가 없어요',
      subMessage: '흥미로운 퀴즈를 스크랩해보세요!',
    );
  }

  Widget _buildEmptyState({
    String message = '아직 스크랩한 뉴스가 없어요',
    String subMessage = '관심있는 뉴스를 스크랩해보세요!',
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Lottie.asset(
              Assets.lottie.scrap,
              repeat: true,
              animate: true,
              fit: BoxFit.contain,
              frameRate: FrameRate.max,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: AppTypography.h3.copyWith(color: AppColors.gr600),
          ),
          const SizedBox(height: 8),
          Text(
            subMessage,
            style: AppTypography.m400.copyWith(color: AppColors.gr600),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.gr400,
          ),
          const SizedBox(height: 16),
          Text(
            '오류가 발생했습니다',
            style: AppTypography.h3.copyWith(color: AppColors.gr600),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: AppTypography.m400.copyWith(color: AppColors.gr600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ref.read(scrapControllerProvider.notifier).loadScrapNews();
            },
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsGroupedList(scrapNewsPage) {
    // 날짜별로 뉴스 그룹화
    final Map<String, List<ScrapNewsItem>> groupedNews = {};
    for (final item in scrapNewsPage.content) {
      final date = item.scrappedDate;
      if (groupedNews[date] == null) {
        groupedNews[date] = [];
      }
      groupedNews[date]!.add(item);
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(scrapControllerProvider.notifier).loadScrapNews();
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: groupedNews.length,
        itemBuilder: (context, index) {
          final date = groupedNews.keys.elementAt(index);
          final newsItems = groupedNews[date]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 날짜 헤더
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  date,
                  style: AppTypography.h3.copyWith(
                    color: AppColors.primarySky,
                  ),
                ),
              ),
              
              // 해당 날짜의 뉴스 아이템들
              ...newsItems.map((item) => _buildSimpleNewsItem(item)),
              
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSimpleNewsItem(ScrapNewsItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 썸네일 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 80,
              height: 80,
              child: item.thumbnailUrl.trim().isNotEmpty
                  ? HtmlImage(
                      url: item.thumbnailUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(8),
                    )
                  : Container(
                      color: AppColors.gr200,
                      child: const Icon(
                        Icons.image,
                        color: AppColors.gr400,
                        size: 32,
                      ),
                    ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목
                Text(
                  item.title,
                  style: AppTypography.m600.copyWith(
                    color: AppColors.bk,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 4),
                
                // 날짜
                Text(
                  item.approveDate.replaceAll('/', '.'),
                  style: AppTypography.s400.copyWith(
                    color: AppColors.gr600,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // AI 요약
                if (item.aiSummary.trim().isNotEmpty) ...[
                  Text(
                    item.aiSummary,
                    style: AppTypography.s400.copyWith(
                      color: AppColors.primarySky,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                ],
                
                // 더보기 링크
                GestureDetector(
                  onTap: () {
                    context.push('/news/detail/${item.newsArticleId}');
                  },
                  child: Text(
                    '더보기',
                    style: AppTypography.s400.copyWith(
                      color: AppColors.primarySky,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
