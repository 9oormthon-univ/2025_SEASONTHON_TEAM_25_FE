// ui/news/ui/news_detail.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/mini_done_alret.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/feature/news/repository/list.dart'
  show newsRepositoryProvider, NewsDetailModel, ContentBlock;

class NewsDetail extends ConsumerStatefulWidget {
  final int newsId; // ← long 대응: Dart int
  const NewsDetail({super.key, required this.newsId});

  @override
  ConsumerState<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends ConsumerState<NewsDetail> {
  late Future<NewsDetailModel> _future;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    _future = ref.read(newsRepositoryProvider).fetchNewsDetail(widget.newsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(title: '뉴스', showLeft: true, showRight: true, onTapLeft: () {
        context.go("/news");
      },),
      body: FutureBuilder<NewsDetailModel>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('불러오기 실패: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
          }

          final news = snapshot.data!;
          final approveDate = news.approveDate.contains('T')
              ? news.approveDate.split('T').first
              : news.approveDate;

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목
                      Text(
                        news.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.bk,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // 날짜 + 부처 뱃지
                      Row(
                        children: [
                          Text(
                            approveDate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gr600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (news.ministerCode.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                news.ministerCode,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.bk,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 썸네일
                      if (news.thumbnailUrl.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            news.thumbnailUrl,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 180,
                              color: const Color(0xFFF3F4F6),
                              alignment: Alignment.center,
                              child: const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),

                      const Divider(height: 32, thickness: 1),

                      // 요약
                      if (news.aiSummary.isNotEmpty) ...[
                        MiniDoneAlret(
                          width: 70,
                          child: const Text(
                            '요약',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.sk,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          news.aiSummary,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.sk,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      // 본문 블록
                      ...news.contentBlocks.map((block) => _buildBlock(block)),

                      const SizedBox(height: 20),
                      const Divider(height: 32, thickness: 1),

                      // 출처/고지
                      const Text(
                        '파프의 뉴스 시스템은 대한민국 공식 전자정부 누리집인 '
                        '<대한민국 정책브리핑>의 검증된 기사만을 사용합니다.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 토스트(조건부)
              if (isDone)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Center(
                    child: MiniDoneAlret(
                      width: 110,
                      child: const Text(
                        '스크랩 완료!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

              // 우하단 스크랩 버튼
              Positioned(
                right: 20,
                bottom: 20,
                child: PrimaryActionButton(
                  height: 44,
                  width: 95,
                  isLoading: false,
                  label: '스크랩',
                  onPressed: () {
                    setState(() => isDone = true);
                    Future.delayed(const Duration(seconds: 3), () {
                      if (!mounted) return;
                      setState(() => isDone = false);
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBlock(ContentBlock block) {
    switch (block.blockType) {
      case 'text':
        final t = block.plainContent ?? block.originalContent ?? '';
        if (t.trim().isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            t,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.bk,
              height: 1.6,
            ),
          ),
        );

      case 'paragraph_break':
        return const SizedBox(height: 16);

      case 'image':
        final url = block.url ?? '';
        if (url.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                color: const Color(0xFFF3F4F6),
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image_outlined),
              ),
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}