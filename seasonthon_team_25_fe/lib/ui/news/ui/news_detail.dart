import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';

import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/presentation/provider/news_detail.controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_filled_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_outlined_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/html_image.dart';
import 'package:seasonthon_team_25_fe/utils/date_time_x.dart';

class NewsDetail extends ConsumerStatefulWidget {
  final int newsId;
  const NewsDetail({super.key, required this.newsId});

  @override
  ConsumerState<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends ConsumerState<NewsDetail> {
  bool isScrapped = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(newsDetailControllerProvider.notifier).load(widget.newsId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsDetailControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '뉴스',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () => context.go("/news"),
        onTapRightBtn: () => context.pop(),
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
                      // 썸네일
                      if (news.thumbnailUrl.trim().isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: HtmlImage(
                            url: news.thumbnailUrl,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(12),
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
              if (isScrapped)
                Positioned(
                  right: 140.5,
                  bottom: 159,
                  child: Center(child: SkOutlinedChip(label: '스크랩 완료!')),
                ),

              // 우하단 스크랩 버튼 (동작은 예시)
              Positioned(
                right: 20,
                bottom: 20,
                child: PrimaryFilledButton(
                  widthType: ButtonWidth.small,
                  isLoading: false,
                  label: '스크랩',
                  onPressed: () {
                    setState(() => isScrapped = true);
                    Future.delayed(const Duration(seconds: 1), () {
                      if (!mounted) return;
                      setState(() => isScrapped = false);
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              height: 160,
              child: HtmlImage(
                url: url,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
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
