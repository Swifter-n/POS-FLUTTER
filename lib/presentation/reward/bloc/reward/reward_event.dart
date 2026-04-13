part of 'reward_bloc.dart';

@freezed
class RewardEvent with _$RewardEvent {
  const factory RewardEvent.fetchCatalog() = _FetchCatalog;
  const factory RewardEvent.redeemReward(int rewardId, int memberId) =
      _RedeemReward;
}
