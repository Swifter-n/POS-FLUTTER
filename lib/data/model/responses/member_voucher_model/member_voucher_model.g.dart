// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberVoucherModelImpl _$$MemberVoucherModelImplFromJson(
  Map<String, dynamic> json,
) => _$MemberVoucherModelImpl(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  discountType: json['discount_type'] as String,
  discountValue: (json['discount_value'] as num?)?.toDouble(),
  minPurchase: (json['min_purchase'] as num?)?.toDouble(),
  validUntil: json['valid_until'] as String?,
  isUsed: json['is_used'] as bool? ?? false,
);

Map<String, dynamic> _$$MemberVoucherModelImplToJson(
  _$MemberVoucherModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'description': instance.description,
  'discount_type': instance.discountType,
  'discount_value': instance.discountValue,
  'min_purchase': instance.minPurchase,
  'valid_until': instance.validUntil,
  'is_used': instance.isUsed,
};
