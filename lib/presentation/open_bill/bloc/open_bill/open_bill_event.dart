part of 'open_bill_bloc.dart';

@freezed
class OpenBillEvent with _$OpenBillEvent {
  const factory OpenBillEvent.fetchOpenBills() = _FetchOpenBills;
  const factory OpenBillEvent.createOpenBill(OpenBillPayload payload) =
      _CreateOpenBill;
  const factory OpenBillEvent.addItemToBill(int orderId, CartItemPayload item) =
      _AddItemToBill;
  const factory OpenBillEvent.addItemsToBill(
    int orderId,
    List<CartItemPayload> items,
  ) = _AddItemsToBill;
  const factory OpenBillEvent.removeItemFromBill(int orderId, int itemId) =
      _RemoveItemFromBill;

  const factory OpenBillEvent.payBill(
    int orderId,
    Map<String, dynamic> paymentData,
  ) = _PayBill;
  const factory OpenBillEvent.cancelBill(int orderId) = _CancelBill;
  const factory OpenBillEvent.selectBill(OrderModel bill) = _SelectBill;
  const factory OpenBillEvent.ignorePromo(String ruleName) = _IgnorePromo;
  const factory OpenBillEvent.resetIgnored() = _ResetIgnored;
  const factory OpenBillEvent.toggleUsePoints(bool use) = _ToggleUsePoints;
}
