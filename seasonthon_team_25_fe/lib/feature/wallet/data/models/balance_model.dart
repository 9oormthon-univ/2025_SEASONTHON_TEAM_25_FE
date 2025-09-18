import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/domain/entities/balance_entity.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
abstract class BalanceModel with _$BalanceModel {
  const factory BalanceModel({required int balance}) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}

extension BalanceModelX on BalanceModel {
  BalanceEntity toEntity() => BalanceEntity(balance: balance);
}
