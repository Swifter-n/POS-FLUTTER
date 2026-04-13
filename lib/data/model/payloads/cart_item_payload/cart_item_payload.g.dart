// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemPayloadImpl _$$CartItemPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$CartItemPayloadImpl(
  productId: (json['product_id'] as num).toInt(),
  productName: json['productName'] as String?,
  quantity: (json['quantity'] as num).toDouble(),
  uom: json['uom'] as String,
  price: (json['price'] as num).toDouble(),
  note: json['note'] as String?,
  addons:
      (json['addons'] as List<dynamic>?)
          ?.map(
            (e) => OrderItemAddonRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CartItemPayloadImplToJson(
  _$CartItemPayloadImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'productName': instance.productName,
  'quantity': instance.quantity,
  'uom': instance.uom,
  'price': instance.price,
  'note': instance.note,
  'addons': instance.addons,
};
