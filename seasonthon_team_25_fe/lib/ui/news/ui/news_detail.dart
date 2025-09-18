import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';

import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/presentation/provider/news_detail.controller.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/presentation/provider/scrap_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_filled_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/html_image.dart';
import 'package:seasonthon_team_25_fe/utils/date_time_x.dart';

class NewsDetail extends ConsumerStatefulWidget {
  final int newsId;
  const NewsDetail({super.key, required this.newsId});

  @override
  ConsumerState<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends ConsumerState<NewsDetail> {
  bool _showScrapToast = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsDetailControllerProvider.notifier).load(widget.newsId);
    });
  }

  Future<void> _handleScrapToggle() async {
    final scrapController = ref.read(scrapControllerProvider.notifier);
    final response = await scrapController.toggleNewsScrap(widget.newsId);

    if (response != null && mounted) {
      // 스크랩 토스트 표시
      setState(() => _showScrapToast = true);

      // 업적 생성 시 추가 메시지 표시
      if (response.achievementCreated && response.achievementType != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎉 업적 달성: ${response.achievementType}'),
            backgroundColor: AppColors.primarySky,
          ),
        );
      }

      // 토스트 자동 숨김
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _showScrapToast = false);
        }
      });
    } else if (mounted) {
      // 에러 처리
      final error = ref.read(scrapControllerProvider).error;
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsDetailControllerProvider);
    final scrapState = ref.watch(scrapControllerProvider);
    final isScraped = scrapState.scrapStatus[widget.newsId] ?? false;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '뉴스',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () => context.push("/news"),
        onTapRightBtn: () => context.push("/news"),
      ),
      body: state.detail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('불러오기 실패: $e')),
        data: (news) {
          if (news == null) {
            return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
          }

          final approveDateText = news.approveDate.ymdSlashHm();

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 82),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        news.title,
                        style: AppTypography.h1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        approveDateText,
                        style: AppTypography.m500.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Divider(
                        height: 25,
                        thickness: 1,
                        color: AppColors.gr200,
                      ),
                      const SizedBox(height: 22),
                      // 썸네일 (반응형 크기)
                      if (news.originalImgUrl.trim().isNotEmpty)
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width > 600
                              ? 280
                              : 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.gr100,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: HtmlImage(
                              url: news.originalImgUrl,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width > 600
                                  ? 280
                                  : 220,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      const SizedBox(height: 12),

                      // 요약
                      if (news.aiSummary.trim().isNotEmpty) ...[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SkFilledChip(label: 'AI 요약'),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          news.aiSummary,
                          style: AppTypography.m500.copyWith(
                            color: AppColors.primarySky,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      // 본문 블록
                      ...news.contentBlocks.map(_buildBlock),

                      const SizedBox(height: 24),
                      const Divider(
                        height: 25,
                        thickness: 1,
                        color: AppColors.gr200,
                      ),
                      const SizedBox(height: 24),

                      // 출처/고지
                      Text(
                        '파프의 뉴스 시스템은 대한민국 공식 전자정부 누리집인 '
                        '<대한민국 정책브리핑>의 검증된 기사만을 사용합니다.',
                        style: AppTypography.s400.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 토스트(조건부)
              if (_showScrapToast)
                Positioned(
                  right: 140.5,
                  bottom: 159,
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset(
                        Assets.lottie.scrap,
                        repeat: true, // 반복 재생
                        animate: true, // 자동 재생
                        fit: BoxFit.contain,
                        frameRate: FrameRate.max,
                      ),
                    ),
                  ),
                ),

              // 우하단 스크랩 버튼
              Positioned(
                right: 20,
                bottom: 20,
                child: PrimaryFilledButton(
                  widthType: ButtonWidth.small,
                  isLoading: scrapState.isLoading,
                  label: isScraped ? '스크랩 해제' : '스크랩',
                  onPressed: scrapState.isLoading
                      ? () {} // 로딩 중일 때는 빈 함수
                      : () {
                          _handleScrapToggle();
                        },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ContentBlockEntity -> 위젯
  Widget _buildBlock(ContentBlockEntity block) {
    switch (block.blockType) {
      case NewsBlockType.text:
        final t = (block.plainContent ?? block.originalContent ?? '').trim();
        if (t.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(t, style: AppTypography.l400),
        );

      case NewsBlockType.paragraphBreak:
        return const SizedBox(height: 0);

      case NewsBlockType.image:
        final url = (block.url ?? '').trim();
        if (url.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width > 600 ? 250 : 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.gr100,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: HtmlImage(
                url: url,
                width: double.infinity,
                height: MediaQuery.of(context).size.width > 600 ? 250 : 200,
                fit: BoxFit.fill,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );

      case NewsBlockType.unknown:
        return const SizedBox.shrink();
    }
  }
}
