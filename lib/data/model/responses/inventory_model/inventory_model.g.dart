// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryModelImpl _$$InventoryModelImplFromJson(Map<String, dynamic> json) =>
    _$InventoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      sku: json['sku'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      uom: json['uom'] as String?,
      minimumStock: (json['minimum_stock'] as num?)?.toDouble(),
      lastUpdated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$$InventoryModelImplToJson(
  _$InventoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'sku': instance.sku,
  'quantity': instance.quantity,
  'uom': instance.uom,
  'minimum_stock': instance.minimumStock,
  'last_updated': instance.lastUpdated,
};
