part of 'reward_bloc.dart';

@freezed
class RewardState with _$RewardState {
  const factory RewardState.initial() = _Initial;
  const factory RewardState.loading() = _Loading;
  const factory RewardState.catalogLoaded(List<RewardModel> rewards) =
      _CatalogLoaded;

  // State khusus saat sukses redeem, membawa data kode voucher dan sisa poin
  const factory RewardState.redeemSuccess(
    String voucherCode,
    int remainingPoints,
  ) = _RedeemSuccess;

  const factory RewardState.error(String message) = _Error;
}
