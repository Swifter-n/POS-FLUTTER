// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: (_parseInt(json, 'id') as num?)?.toInt() ?? 0,
      productId: (_parseInt(json, 'product_id') as num?)?.toInt() ?? 0,
      productName: json['product_name'] as String? ?? '-',
      quantity: (_parseDouble(json, 'quantity') as num?)?.toDouble() ?? 0.0,
      price: (_parseDouble(json, 'price_per_uom') as num?)?.toDouble() ?? 0.0,
      total: (_parseDouble(json, 'total_price') as num?)?.toDouble() ?? 0.0,
      note: json['note'] as String?,
      addons:
          (json['addons'] as List<dynamic>?)
              ?.map(
                (e) => OrderItemAddonModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      calories: (_parseInt(json, 'calories') as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
  _$OrderItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'quantity': instance.quantity,
  'price_per_uom': instance.price,
  'total_price': instance.total,
  'note': instance.note,
  'addons': instance.addons,
  'calories': instance.calories,
};
