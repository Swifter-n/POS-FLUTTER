import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_addon_response.freezed.dart';
part 'order_item_addon_response.g.dart';

@freezed
class OrderItemAddonModel with _$OrderItemAddonModel {
  const factory OrderItemAddonModel({
    @JsonKey(name: 'addon_product_id') @Default(0) int addonProductId,
    @Default('') String name,
    @Default(0.0) double quantity,
    @Default(0.0) double price,
    @Default(0.0) double total,
  }) = _OrderItemAddonModel;

  factory OrderItemAddonModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemAddonModelFromJson(json);
}
