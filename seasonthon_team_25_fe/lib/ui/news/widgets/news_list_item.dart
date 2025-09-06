import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.item, this.onTap});

  final Map<String, String> item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final title = item['title'] ?? '';
    final subtitle = item['subtitle'] ?? '';
    final date = item['date'] ?? '';
    final url = item['url'] ?? '';

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1), // 아래만 테두리
        ),
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
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                    },
                    errorBuilder: (context, error, stack) {
                      return Container(
                        color: const Color(0xFFF3F4F6),
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 오른쪽 텍스트
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // date
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 6),
                    // subtitle
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
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
}