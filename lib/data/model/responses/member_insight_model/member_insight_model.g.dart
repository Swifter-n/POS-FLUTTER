// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberInsightModelImpl _$$MemberInsightModelImplFromJson(
  Map<String, dynamic> json,
) => _$MemberInsightModelImpl(
  lastVisit: json['last_visit'] as String?,
  totalSpend: (json['total_spend'] as num?)?.toDouble(),
  favoriteProduct: json['favorite_product'] as String?,
);

Map<String, dynamic> _$$MemberInsightModelImplToJson(
  _$MemberInsightModelImpl instance,
) => <String, dynamic>{
  'last_visit': instance.lastVisit,
  'total_spend': instance.totalSpend,
  'favorite_product': instance.favoriteProduct,
};
