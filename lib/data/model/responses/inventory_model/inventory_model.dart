import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    int? id,
    String? name,
    String? sku,
    String? barcode,
    String? image,
    String? unit,
    @JsonKey(name: 'current_stock') @Default(0) double currentStock,
    String? status,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}
