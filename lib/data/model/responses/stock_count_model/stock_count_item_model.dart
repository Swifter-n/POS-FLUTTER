import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_count_item_model.freezed.dart';
part 'stock_count_item_model.g.dart';

@freezed
class StockCountItemModel with _$StockCountItemModel {
  const factory StockCountItemModel({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? uom,
    @JsonKey(name: 'system_qty') double? systemQty,
    @JsonKey(name: 'counted_qty') double? countedQty,
    @JsonKey(name: 'is_zero_count') bool? isZeroCount,
  }) = _StockCountItemModel;

  factory StockCountItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockCountItemModelFromJson(json);
}
