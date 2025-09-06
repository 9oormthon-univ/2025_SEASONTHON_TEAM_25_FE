import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

/// ===== 리스트 아이템 모델 =====
class NewsItem {
  final int id;
  final String newsItemId;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final String approveDate;
  final String modifyDate;
  final String thumbnailUrl;
  final String aiSummary;
  final String plainTextContent;
  final String ministerCode;

  NewsItem({
    required this.id,
    required this.newsItemId,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    required this.approveDate,
    required this.modifyDate,
    required this.thumbnailUrl,
    required this.aiSummary,
    required this.plainTextContent,
    required this.ministerCode,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] as int,
      newsItemId: json['newsItemId'] as String,
      title: json['title'] as String,
      subTitle1: json['subTitle1'] as String? ?? '',
      subTitle2: json['subTitle2'] as String? ?? '',
      subTitle3: json['subTitle3'] as String? ?? '',
      approveDate: json['approveDate'] as String? ?? '',
      modifyDate: json['modifyDate'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      aiSummary: json['aiSummary'] as String? ?? '',
      plainTextContent: json['plainTextContent'] as String? ?? '',
      ministerCode: json['ministerCode'] as String? ?? '',
    );
  }
}

/// ===== 상세 블록 & 상세 모델 =====
class ContentBlock {
  final String blockType;      // 'text' | 'paragraph_break' | 'image' ...
  final String? originalContent;
  final String? plainContent;
  final String? url;
  final String? altText;
  final int blockOrder;

  ContentBlock({
    required this.blockType,
    this.originalContent,
    this.plainContent,
    this.url,
    this.altText,
    required this.blockOrder,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      blockType: json['blockType'] as String,
      originalContent: json['originalContent'] as String?,
      plainContent: json['plainContent'] as String?,
      url: json['url'] as String?,
      altText: json['altText'] as String?,
      blockOrder: json['blockOrder'] as int,
    );
  }
}

class NewsDetailModel {
  final int id;
  final String newsItemId;
  final String title;
  final String approveDate;
  final String modifyDate;
  final String thumbnailUrl;
  final String aiSummary;
  final String plainTextContent;
  final String ministerCode;
  final List<ContentBlock> contentBlocks;

  NewsDetailModel({
    required this.id,
    required this.newsItemId,
    required this.title,
    required this.approveDate,
    required this.modifyDate,
    required this.thumbnailUrl,
    required this.aiSummary,
    required this.plainTextContent,
    required this.ministerCode,
    required this.contentBlocks,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    final blocks = (json['contentBlocks'] as List<dynamic>? ?? [])
        .map((e) => ContentBlock.fromJson(e as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.blockOrder.compareTo(b.blockOrder));

    return NewsDetailModel(
      id: json['id'] as int,
      newsItemId: json['newsItemId'] as String,
      title: json['title'] as String,
      approveDate: json['approveDate'] as String? ?? '',
      modifyDate: json['modifyDate'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      aiSummary: json['aiSummary'] as String? ?? '',
      plainTextContent: json['plainTextContent'] as String? ?? '',
      ministerCode: json['ministerCode'] as String? ?? '',
      contentBlocks: blocks,
    );
  }
}

/// ===== 레포지토리 & 프로바이더 =====
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return NewsRepository(dio);
});

class NewsRepository {
  final Dio _dio;
  NewsRepository(this._dio);

  /// 리스트 조회
  Future<List<NewsItem>> fetchNewsList({int page = 0, int size = 10}) async {
    final res = await _dio.get('/api/news', queryParameters: {
      'page': page,
      'size': size,
    });
    final content = res.data['content'] as List<dynamic>;
    return content.map((e) => NewsItem.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// 상세 조회
  Future<NewsDetailModel> fetchNewsDetail(int id) async {
    final res = await _dio.get('/api/news/$id');
    return NewsDetailModel.fromJson(res.data as Map<String, dynamic>);
  }
}