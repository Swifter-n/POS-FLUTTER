// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? 'available',
      capacity: (json['capacity'] as num?)?.toInt(),
      activeOrderId: (json['active_order_id'] as num?)?.toInt(),
      isOccupied: json['is_occupied'] as bool?,
      customerName: json['customer_name'] as String?,
      upcomingReservation: json['upcoming_reservation'] as String?,
      reservedCustomerName: json['reserved_customer_name'] as String?,
      reservationStatus: json['reservation_status'] as String?,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'x': instance.x,
      'y': instance.y,
      'status': instance.status,
      'capacity': instance.capacity,
      'active_order_id': instance.activeOrderId,
      'is_occupied': instance.isOccupied,
      'customer_name': instance.customerName,
      'upcoming_reservation': instance.upcomingReservation,
      'reserved_customer_name': instance.reservedCustomerName,
      'reservation_status': instance.reservationStatus,
    };
