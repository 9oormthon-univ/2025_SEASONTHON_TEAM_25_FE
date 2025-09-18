import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_term_entity.freezed.dart';

@freezed
abstract class SavingsTermEntity with _$SavingsTermEntity {
  const factory SavingsTermEntity({
    required String term,
    required String description,
  }) = _SavingsTermEntity;
}
