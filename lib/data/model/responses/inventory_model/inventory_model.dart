import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? sku,
    double? quantity,
    String? uom,
    @JsonKey(name: 'minimum_stock') double? minimumStock,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}
