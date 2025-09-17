import 'package:seasonthon_team_25_fe/feature/home/data/models/home_response.dart';

abstract class HomeRepository {
  Future<HomeResponse> fetchHome();
}