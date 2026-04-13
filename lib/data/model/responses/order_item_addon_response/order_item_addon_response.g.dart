// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_addon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemAddonModelImpl _$$OrderItemAddonModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemAddonModelImpl(
  addonProductId: (json['addon_product_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  total: (json['total'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$OrderItemAddonModelImplToJson(
  _$OrderItemAddonModelImpl instance,
) => <String, dynamic>{
  'addon_product_id': instance.addonProductId,
  'name': instance.name,
  'quantity': instance.quantity,
  'price': instance.price,
  'total': instance.total,
};
