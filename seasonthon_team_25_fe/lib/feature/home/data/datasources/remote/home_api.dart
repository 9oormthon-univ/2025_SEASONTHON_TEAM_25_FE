import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/models/home_response.dart';

part 'home_api.g.dart';

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  /// 홈 데이터 조회
  @GET('/api/home')
  Future<HomeResponse> fetchHome();
}

final homeApiProvider = Provider<HomeApi>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeApi(dio);
});
