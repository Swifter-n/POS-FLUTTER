import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.freezed.dart';
part 'reward_model.g.dart';

@freezed
class RewardModel with _$RewardModel {
  const factory RewardModel({
    required int id,
    required String name,
    String? description,
    String? image,
    @JsonKey(name: 'points_required') required int pointsRequired,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _RewardModel;

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
}
