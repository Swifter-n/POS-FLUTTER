part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({
    @Default([]) List<CartItemPayload> items,
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double tax,
    @Default([]) List<String> appliedPromos,
    @Default([]) List<String> ignoredRules,
    String? tableNumber,
    OrderModel? activeOrder,
  }) = _Loaded;
  const factory CartState.checkoutSuccess(OrderModel order) = _CheckoutSuccess;

  const factory CartState.error(String message) = _Error;
}
