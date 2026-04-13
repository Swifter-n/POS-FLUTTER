// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberModelImpl _$$MemberModelImplFromJson(
  Map<String, dynamic> json,
) => _$MemberModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  memberCode: json['member_code'] as String?,
  currentPoints: (json['points'] as num?)?.toInt(),
  tier: json['tier'] as String? ?? 'Basic',
  vouchers:
      (json['vouchers'] as List<dynamic>?)
          ?.map((e) => MemberVoucherModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  lastVisit: _readLastVisit(json, 'last_visit') as String?,
  favoriteProduct: _readFavoriteProduct(json, 'favorite_product') as String?,
  totalSpend: (_readTotalSpend(json, 'total_spend') as num?)?.toDouble(),
);

Map<String, dynamic> _$$MemberModelImplToJson(_$MemberModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'member_code': instance.memberCode,
      'points': instance.currentPoints,
      'tier': instance.tier,
      'vouchers': instance.vouchers,
      'last_visit': instance.lastVisit,
      'favorite_product': instance.favoriteProduct,
      'total_spend': instance.totalSpend,
    };
