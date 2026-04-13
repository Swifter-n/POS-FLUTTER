part of 'open_bill_bloc.dart';

@freezed
class OpenBillState with _$OpenBillState {
  const factory OpenBillState.initial() = _Initial;
  const factory OpenBillState.loading() = _Loading;
  const factory OpenBillState.success(String message) = _Success;
  const factory OpenBillState.error(String message) = _Error;

  const factory OpenBillState.loaded({
    @Default([]) List<OrderModel> orders,
    OrderModel? selectedOrder,
    @Default(false) bool usePoints,
    @Default([]) List<String> ignoredRules,
  }) = _Loaded;
}
