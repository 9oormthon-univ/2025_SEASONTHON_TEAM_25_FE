import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_detail_models.freezed.dart';
part 'news_detail_models.g.dart';

@freezed
abstract class NewsDetailResponse with _$NewsDetailResponse {
  const factory NewsDetailResponse({
    required int id,
    required String newsItemId,
    required String title,
    required DateTime approveDate,
    required DateTime modifyDate,
    required String thumbnailUrl,
    required String aiSummary,
    required String plainTextContent,
    required String ministerCode,
    required List<ContentBlockResponse> contentBlocks,
    required bool scraped,
  }) = _NewsDetailResponse;

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailResponseFromJson(json);
}

@freezed
abstract class ContentBlockResponse with _$ContentBlockResponse {
  const factory ContentBlockResponse({
    required String blockType,          // "text" | "image" | "paragraph_break" ...
    String? originalContent,
    String? plainContent,
    String? url,
    String? altText,
    required int blockOrder,
  }) = _ContentBlockResponse;

  factory ContentBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockResponseFromJson(json);
}
