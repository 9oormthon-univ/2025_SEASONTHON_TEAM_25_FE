class NewsItemEntity {
  final int id;
  final String newsItemId;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final DateTime approveDate;
  final DateTime modifyDate;
  final String thumbnailUrl;
  final String originalImgUrl;
  final String aiSummary;
  final String plainTextContent;
  final String ministerCode;

  const NewsItemEntity({
    required this.id,
    required this.newsItemId,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    required this.approveDate,
    required this.modifyDate,
    required this.thumbnailUrl,
    required this.originalImgUrl,
    required this.aiSummary,
    required this.plainTextContent,
    required this.ministerCode,
  });
}
