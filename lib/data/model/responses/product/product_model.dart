import 'package:freezed_annotation/freezed_annotation.dart';
import '../uom_model/uom_model.dart';
import '../product_addon_model/product_addon_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'productId') required int productId,
    required String name,
    required double price,
    required String category,
    String? thumbnail,
    String? barcode,
    required List<UomModel> uoms,
    required List<ProductAddonModel> addons,
    @JsonKey(name: 'is_popular') bool? isPopular,
    @JsonKey(name: 'promotions') List<dynamic>? promotions,
    int? calories,
    @JsonKey(name: 'stock') double? stock,
    @JsonKey(name: 'stockInfo') Map<String, dynamic>? stockInfo,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
