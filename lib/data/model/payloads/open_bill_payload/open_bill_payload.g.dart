// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_bill_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenBillPayloadImpl _$$OpenBillPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$OpenBillPayloadImpl(
  typeOrder: json['type_order'] as String,
  tableNumber: json['table_number'] as String?,
  customerName: json['customer_name'] as String?,
  guestCount: (json['guest_count'] as num?)?.toInt(),
  memberId: (json['member_id'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CartItemPayload.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$OpenBillPayloadImplToJson(
  _$OpenBillPayloadImpl instance,
) => <String, dynamic>{
  'type_order': instance.typeOrder,
  'table_number': instance.tableNumber,
  'customer_name': instance.customerName,
  'guest_count': instance.guestCount,
  'member_id': instance.memberId,
  'items': instance.items?.map((e) => e.toJson()).toList(),
};
