// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationModelImpl _$$ReservationModelImplFromJson(
  Map<String, dynamic> json,
) => _$ReservationModelImpl(
  id: (json['id'] as num).toInt(),
  customerName: json['customer_name'] as String,
  customerPhone: json['customer_phone'] as String?,
  guestCount: (json['guest_count'] as num).toInt(),
  reservationTime: json['reservation_time'] as String,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  tableId: (json['table_id'] as num?)?.toInt(),
  table: json['table'] == null
      ? null
      : TableModel.fromJson(json['table'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ReservationModelImplToJson(
  _$ReservationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_name': instance.customerName,
  'customer_phone': instance.customerPhone,
  'guest_count': instance.guestCount,
  'reservation_time': instance.reservationTime,
  'status': instance.status,
  'notes': instance.notes,
  'table_id': instance.tableId,
  'table': instance.table,
};
