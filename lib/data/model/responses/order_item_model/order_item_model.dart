import 'package:freezed_annotation/freezed_annotation.dart';
// Sesuaikan import ini jika nama file addon Anda berbeda
import '../order_item_addon_response/order_item_addon_response.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

int _parseInt(Map<dynamic, dynamic> json, String key) {
  final val = json[key];
  if (val is int) return val;
  if (val is double) return val.toInt();
  if (val is String) return int.tryParse(val) ?? 0;
  return 0;
}

double _parseDouble(Map<dynamic, dynamic> json, String key) {
  final val = json[key];
  if (val is double) return val;
  if (val is int) return val.toDouble();
  if (val is String) return double.tryParse(val) ?? 0.0;
  return 0.0;
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(readValue: _parseInt) @Default(0) int id,
    @JsonKey(name: 'product_id', readValue: _parseInt)
    @Default(0)
    int productId,
    @JsonKey(name: 'product_name') @Default('-') String productName,
    @JsonKey(readValue: _parseDouble) @Default(0.0) double quantity,
    @JsonKey(name: 'price_per_uom', readValue: _parseDouble)
    @Default(0.0)
    double price,
    @JsonKey(name: 'total_price', readValue: _parseDouble)
    @Default(0.0)
    double total,
    String? note,

    // Ganti class di bawah ini dengan OrderItemAddonModel jika itu yang Anda gunakan
    @Default([]) List<OrderItemAddonModel> addons,

    @JsonKey(name: 'calories', readValue: _parseInt) @Default(0) int calories,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}
