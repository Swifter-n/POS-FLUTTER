import 'package:freezed_annotation/freezed_annotation.dart';
import '../order_item_addon_request/order_item_addon_request.dart';

part 'cart_item_payload.freezed.dart';
part 'cart_item_payload.g.dart';

@freezed
class CartItemPayload with _$CartItemPayload {
  const factory CartItemPayload({
    @JsonKey(name: 'product_id') required int productId,
    String? productName,
    required double quantity,
    required String uom,
    required double price,
    String? note,
    @Default([]) List<OrderItemAddonRequest> addons,
  }) = _CartItemPayload;

  factory CartItemPayload.fromJson(Map<String, dynamic> json) =>
      _$CartItemPayloadFromJson(json);
}
