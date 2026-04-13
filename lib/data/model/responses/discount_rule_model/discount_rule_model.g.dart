// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountRuleModelImpl _$$DiscountRuleModelImplFromJson(
  Map<String, dynamic> json,
) => _$DiscountRuleModelImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
  discountType: json['discountType'] as String?,
  discountValue: _parseDouble(json['discount_value']),
  minPurchase: _parseDouble(json['min_purchase']),
  maxDiscount: _parseDouble(json['max_discount']),
  validFrom: json['validFrom'] as String?,
  validUntil: json['validUntil'] as String?,
);

Map<String, dynamic> _$$DiscountRuleModelImplToJson(
  _$DiscountRuleModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'discountType': instance.discountType,
  'discount_value': instance.discountValue,
  'min_purchase': instance.minPurchase,
  'max_discount': instance.maxDiscount,
  'validFrom': instance.validFrom,
  'validUntil': instance.validUntil,
};
