import 'package:freezed_annotation/freezed_annotation.dart';

part 'uom_model.freezed.dart';

@freezed
class UomModel with _$UomModel {
  const UomModel._();

  const factory UomModel({
    int? id,
    String? name,
    double? conversionRate,
    double? price,
  }) = _UomModel;

  factory UomModel.fromJson(Map<String, dynamic> json) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return UomModel(
      id: json['id'] as int?,
      name: (json['uom_name'] ?? json['name']) as String?,
      conversionRate: parseDouble(
        json['conversion_rate'] ?? json['conversionRate'],
      ),

      price: parseDouble(json['price']),
    );
  }

  // ✅ MANUAL TO JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'uom_name': name,
    'conversion_rate': conversionRate,
    'price': price,
  };
}
