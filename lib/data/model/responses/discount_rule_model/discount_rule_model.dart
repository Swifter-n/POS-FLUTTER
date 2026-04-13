import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_rule_model.freezed.dart';
part 'discount_rule_model.g.dart';

double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class DiscountRuleModel with _$DiscountRuleModel {
  const factory DiscountRuleModel({
    int? id,
    String? name,
    String? type,
    String? discountType, // 'percent' atau 'fixed'
    // --- TAMBAHKAN fromJson: _parseDouble DI FIELD ANGKA INI ---
    @JsonKey(name: 'discount_value', fromJson: _parseDouble)
    double? discountValue,
    @JsonKey(name: 'min_purchase', fromJson: _parseDouble) double? minPurchase,
    @JsonKey(name: 'max_discount', fromJson: _parseDouble) double? maxDiscount,

    // -----------------------------------------------------------
    String? validFrom,
    String? validUntil,
  }) = _DiscountRuleModel;

  factory DiscountRuleModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountRuleModelFromJson(json);
}
