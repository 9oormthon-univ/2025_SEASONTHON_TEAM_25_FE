// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScrapResponse _$ScrapResponseFromJson(Map<String, dynamic> json) =>
    _ScrapResponse(
      newsArticleId: (json['newsArticleId'] as num).toInt(),
      message: json['message'] as String,
      achievementType: json['achievementType'] as String?,
      achievementCreated: json['achievementCreated'] as bool,
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$ScrapResponseToJson(_ScrapResponse instance) =>
    <String, dynamic>{
      'newsArticleId': instance.newsArticleId,
      'message': instance.message,
      'achievementType': instance.achievementType,
      'achievementCreated': instance.achievementCreated,
      'scraped': instance.scraped,
    };

_ScrapNewsItem _$ScrapNewsItemFromJson(Map<String, dynamic> json) =>
    _ScrapNewsItem(
      newsArticleId: (json['newsArticleId'] as num).toInt(),
      scrappedDate: json['scrappedDate'] as String,
      title: json['title'] as String,
      aiSummary: json['aiSummary'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      approveDate: json['approveDate'] as String,
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$ScrapNewsItemToJson(_ScrapNewsItem instance) =>
    <String, dynamic>{
      'newsArticleId': instance.newsArticleId,
      'scrappedDate': instance.scrappedDate,
      'title': instance.title,
      'aiSummary': instance.aiSummary,
      'thumbnailUrl': instance.thumbnailUrl,
      'approveDate': instance.approveDate,
      'scraped': instance.scraped,
    };

_ScrapNewsPageResponse _$ScrapNewsPageResponseFromJson(
  Map<String, dynamic> json,
) => _ScrapNewsPageResponse(
  page: (json['page'] as num).toInt(),
  content: (json['content'] as List<dynamic>)
      .map((e) => ScrapNewsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  first: json['first'] as bool,
  last: json['last'] as bool,
  hasNext: json['hasNext'] as bool,
  hasPrevious: json['hasPrevious'] as bool,
);

Map<String, dynamic> _$ScrapNewsPageResponseToJson(
  _ScrapNewsPageResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'content': instance.content,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};

_QuizScrapRequest _$QuizScrapRequestFromJson(Map<String, dynamic> json) =>
    _QuizScrapRequest(
      userQuizId: (json['userQuizId'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$QuizScrapRequestToJson(_QuizScrapRequest instance) =>
    <String, dynamic>{
      'userQuizId': instance.userQuizId,
      'isCorrect': instance.isCorrect,
    };

_QuizScrapResponse _$QuizScrapResponseFromJson(Map<String, dynamic> json) =>
    _QuizScrapResponse(
      userQuizId: (json['userQuizId'] as num).toInt(),
      isCorrectAtScrap: json['isCorrectAtScrap'] as bool?,
      message: json['message'] as String,
      achievementType: json['achievementType'] as String?,
      achievementCreated: json['achievementCreated'] as bool,
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$QuizScrapResponseToJson(_QuizScrapResponse instance) =>
    <String, dynamic>{
      'userQuizId': instance.userQuizId,
      'isCorrectAtScrap': instance.isCorrectAtScrap,
      'message': instance.message,
      'achievementType': instance.achievementType,
      'achievementCreated': instance.achievementCreated,
      'scraped': instance.scraped,
    };

_ScrapQuizItem _$ScrapQuizItemFromJson(Map<String, dynamic> json) =>
    _ScrapQuizItem(
      userQuizId: (json['userQuizId'] as num).toInt(),
      quizId: (json['quizId'] as num?)?.toInt(),
      scrappedDate: json['scrappedDate'] as String,
      quizDate: json['quizDate'] as String,
      quizType: json['quizType'] as String,
      difficulty: json['difficulty'] as String,
      category: json['category'] as String,
      question: json['question'] as String,
      explanation: json['explanation'] as String,
      isCorrectAtScrap: json['isCorrectAtScrap'] as bool,
      userAnswer: json['userAnswer'] as String,
      oxAnswer: json['oxAnswer'],
      mcqOption1: json['mcqOption1'] as String?,
      mcqOption2: json['mcqOption2'] as String?,
      mcqOption3: json['mcqOption3'] as String?,
      mcqOption4: json['mcqOption4'] as String?,
      mcqCorrectIndex: (json['mcqCorrectIndex'] as num?)?.toInt(),
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$ScrapQuizItemToJson(_ScrapQuizItem instance) =>
    <String, dynamic>{
      'userQuizId': instance.userQuizId,
      'quizId': instance.quizId,
      'scrappedDate': instance.scrappedDate,
      'quizDate': instance.quizDate,
      'quizType': instance.quizType,
      'difficulty': instance.difficulty,
      'category': instance.category,
      'question': instance.question,
      'explanation': instance.explanation,
      'isCorrectAtScrap': instance.isCorrectAtScrap,
      'userAnswer': instance.userAnswer,
      'oxAnswer': instance.oxAnswer,
      'mcqOption1': instance.mcqOption1,
      'mcqOption2': instance.mcqOption2,
      'mcqOption3': instance.mcqOption3,
      'mcqOption4': instance.mcqOption4,
      'mcqCorrectIndex': instance.mcqCorrectIndex,
      'scraped': instance.scraped,
    };

_ScrapQuizPageResponse _$ScrapQuizPageResponseFromJson(
  Map<String, dynamic> json,
) => _ScrapQuizPageResponse(
  page: (json['page'] as num).toInt(),
  content: (json['content'] as List<dynamic>)
      .map((e) => ScrapQuizItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  first: json['first'] as bool,
  last: json['last'] as bool,
  hasNext: json['hasNext'] as bool,
  hasPrevious: json['hasPrevious'] as bool,
);

Map<String, dynamic> _$ScrapQuizPageResponseToJson(
  _ScrapQuizPageResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'content': instance.content,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};
