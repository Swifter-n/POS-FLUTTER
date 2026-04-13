// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      x: (json['x_position'] as num?)?.toDouble() ?? 0.0,
      y: (json['y_position'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? 'available',
      capacity: (json['capacity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'x_position': instance.x,
      'y_position': instance.y,
      'status': instance.status,
      'capacity': instance.capacity,
    };
