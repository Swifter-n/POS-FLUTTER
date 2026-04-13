import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_addon_model.freezed.dart';
part 'product_addon_model.g.dart';

@freezed
class ProductAddonModel with _$ProductAddonModel {
  const factory ProductAddonModel({
    required int id,
    required String name,
    required double price,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _ProductAddonModel;

  factory ProductAddonModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAddonModelFromJson(json);
}
