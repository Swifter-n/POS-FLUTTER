// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_addon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductAddonModelImpl _$$ProductAddonModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProductAddonModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  isActive: json['is_active'] as bool? ?? true,
);

Map<String, dynamic> _$$ProductAddonModelImplToJson(
  _$ProductAddonModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'is_active': instance.isActive,
};
