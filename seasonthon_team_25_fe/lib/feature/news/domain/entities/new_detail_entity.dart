enum NewsBlockType { text, paragraphBreak, image, unknown }

class ContentBlockEntity {
  final NewsBlockType blockType;
  final String? originalContent;
  final String? plainContent;
  final String? url;
  final String? altText;
  final int blockOrder;

  const ContentBlockEntity({
    required this.blockType,
    this.originalContent,
    this.plainContent,
    this.url,
    this.altText,
    required this.blockOrder,
  });
}

class NewsDetailEntity {
  final int id;
  final String newsItemId;
  final String title;
  final DateTime approveDate;
  final DateTime modifyDate;
  final String thumbnailUrl;
  final String originalImgUrl;
  final String aiSummary;
  final String plainTextContent;
  final String ministerCode;
  final List<ContentBlockEntity> contentBlocks;
  final bool scraped;

  const NewsDetailEntity({
    required this.id,
    required this.newsItemId,
    required this.title,
    required this.approveDate,
    required this.modifyDate,
    required this.thumbnailUrl,
    required this.originalImgUrl,
    required this.aiSummary,
    required this.plainTextContent,
    required this.ministerCode,
    required this.contentBlocks,
    required this.scraped,
  });
}
