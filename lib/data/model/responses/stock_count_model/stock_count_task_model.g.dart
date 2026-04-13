// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_count_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockCountTaskModelImpl _$$StockCountTaskModelImplFromJson(
  Map<String, dynamic> json,
) => _$StockCountTaskModelImpl(
  id: (json['id'] as num?)?.toInt(),
  referenceNumber: json['reference_number'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  completedAt: json['completed_at'] as String?,
);

Map<String, dynamic> _$$StockCountTaskModelImplToJson(
  _$StockCountTaskModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'reference_number': instance.referenceNumber,
  'status': instance.status,
  'created_at': instance.createdAt,
  'completed_at': instance.completedAt,
};
