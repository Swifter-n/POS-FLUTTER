// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_count_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockCountItemModelImpl _$$StockCountItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$StockCountItemModelImpl(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  uom: json['uom'] as String?,
  systemStock: (json['system_stock'] as num?)?.toDouble(),
  countedQty: (json['counted_qty'] as num?)?.toDouble(),
  isZeroCount: json['is_zero_count'] as bool?,
);

Map<String, dynamic> _$$StockCountItemModelImplToJson(
  _$StockCountItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'uom': instance.uom,
  'system_stock': instance.systemStock,
  'counted_qty': instance.countedQty,
  'is_zero_count': instance.isZeroCount,
};
