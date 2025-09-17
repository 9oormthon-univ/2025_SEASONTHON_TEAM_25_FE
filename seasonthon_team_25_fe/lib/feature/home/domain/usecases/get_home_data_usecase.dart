import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/models/home_response.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/repository_impl/home_repository_impl';
import 'package:seasonthon_team_25_fe/feature/home/domain/repository/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository _repository;

  GetHomeDataUseCase(this._repository);

  Future<HomeResponse> call() {
    return _repository.fetchHome();
  }
}

final getHomeDataUseCaseProvider = Provider<GetHomeDataUseCase>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return GetHomeDataUseCase(repo);
});