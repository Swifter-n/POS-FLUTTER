import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_addon_request.freezed.dart';
part 'order_item_addon_request.g.dart';

@freezed
class OrderItemAddonRequest with _$OrderItemAddonRequest {
  const factory OrderItemAddonRequest({
    @JsonKey(name: 'addon_id') required int addonId,
    String? addonName,
    required double quantity,
    double? price,
  }) = _OrderItemAddonRequest;

  factory OrderItemAddonRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemAddonRequestFromJson(json);
}
