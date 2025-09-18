import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/datasources/remote/home_api.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/models/home_response.dart';
import 'package:seasonthon_team_25_fe/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi _api;

  HomeRepositoryImpl(this._api);

  @override
  Future<HomeResponse> fetchHome() {
    return _api.fetchHome();
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final api = ref.watch(homeApiProvider);
  return HomeRepositoryImpl(api);
});
