import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/news/ui/news_detail.dart';
import 'package:seasonthon_team_25_fe/ui/news/ui/news_page.dart';

final newsRoutes = <RouteBase>[
  GoRoute(path: '/news', builder: (context, state) => const NewsPage()),
  //GoRoute(path: '/news/detail', builder: (context, state) => const NewsDetail()),
  GoRoute(
    path: '/news/:id', // ✅ :id 파라미터 받도록 수정
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return NewsDetail(newsId: id); // ✅ id 넘겨서 생성
    },
  ),
];
