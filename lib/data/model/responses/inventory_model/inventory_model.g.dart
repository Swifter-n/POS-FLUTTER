// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryModelImpl _$$InventoryModelImplFromJson(Map<String, dynamic> json) =>
    _$InventoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      barcode: json['barcode'] as String?,
      image: json['image'] as String?,
      unit: json['unit'] as String?,
      currentStock: (json['current_stock'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$InventoryModelImplToJson(
  _$InventoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'image': instance.image,
  'unit': instance.unit,
  'current_stock': instance.currentStock,
  'status': instance.status,
};
