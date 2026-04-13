part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.addItem(CartItemPayload item) = _AddItem;
  const factory CartEvent.removeItem(int productId, String uom) = _RemoveItem;
  const factory CartEvent.updateQuantity(
    int productId,
    String uom,
    double quantity,
  ) = _UpdateQuantity;
  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.checkout(QuickCheckoutPayload payload) = _Checkout;
  const factory CartEvent.ignorePromo(String ruleName) = _IgnorePromo;
}
