// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_addon_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemAddonRequestImpl _$$OrderItemAddonRequestImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemAddonRequestImpl(
  addonId: (json['addon_id'] as num).toInt(),
  addonName: json['addonName'] as String?,
  quantity: (json['quantity'] as num).toDouble(),
  price: (json['price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$OrderItemAddonRequestImplToJson(
  _$OrderItemAddonRequestImpl instance,
) => <String, dynamic>{
  'addon_id': instance.addonId,
  'addonName': instance.addonName,
  'quantity': instance.quantity,
  'price': instance.price,
};
