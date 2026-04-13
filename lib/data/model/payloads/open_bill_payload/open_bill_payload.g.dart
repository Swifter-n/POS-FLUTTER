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
);

Map<String, dynamic> _$$OpenBillPayloadImplToJson(
  _$OpenBillPayloadImpl instance,
) => <String, dynamic>{
  'type_order': instance.typeOrder,
  'table_number': instance.tableNumber,
  'customer_name': instance.customerName,
  'guest_count': instance.guestCount,
  'member_id': instance.memberId,
};
