import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/utils/date_time_x.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.item, this.onTap});

  final NewsItemEntity item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dateText = item.approveDate.ymdSlashHmOr('');

    final thumb = (item.thumbnailUrl).trim();

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gr200, width: 1)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 왼쪽 썸네일
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                child: SizedBox(
                  width: 84,
                  height: 84,
                  child: thumb.isNotEmpty
                      ? Image.network(
                          thumb,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                          errorBuilder: (_, __, ___) => _thumbPlaceholder(),
                        )
                      : _thumbPlaceholder(),
                ),
              ),
              const SizedBox(width: 12),

              // 오른쪽 텍스트
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(
                      item.title,
                      style: AppTypography.h3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // 날짜
                    Text(
                      dateText,
                      style: AppTypography.s400.copyWith(
                        color: AppColors.gr600,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // 요약
                    Text(
                      item.aiSummary,
                      style: AppTypography.m500.copyWith(
                        color: AppColors.primarySky,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _thumbPlaceholder() {
    return Container(
      color: AppColors.gr200,
      alignment: Alignment.center,
      child: const Icon(Icons.image_not_supported),
    );
  }
}
