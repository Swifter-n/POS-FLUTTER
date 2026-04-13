// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_checkout_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuickCheckoutPayloadImpl _$$QuickCheckoutPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$QuickCheckoutPayloadImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemPayload.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentMethod: json['payment_method'] as String,
  typeOrder: json['type_order'] as String,
  amountPaid: (json['amount_paid'] as num).toDouble(),
  tableId: (json['table_id'] as num?)?.toInt(),
  tableNumber: json['table_number'] as String?,
  guestCount: (json['guest_count'] as num?)?.toInt(),
  customerName: json['customer_name'] as String?,
  memberId: (json['member_id'] as num?)?.toInt(),
  usePoints: json['use_points'] as bool? ?? false,
  promoCodeInput: json['promo_code_input'] as String?,
  ignoredRules:
      (json['ignored_rules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$QuickCheckoutPayloadImplToJson(
  _$QuickCheckoutPayloadImpl instance,
) => <String, dynamic>{
  'items': instance.items,
  'payment_method': instance.paymentMethod,
  'type_order': instance.typeOrder,
  'amount_paid': instance.amountPaid,
  'table_id': instance.tableId,
  'table_number': instance.tableNumber,
  'guest_count': instance.guestCount,
  'customer_name': instance.customerName,
  'member_id': instance.memberId,
  'use_points': instance.usePoints,
  'promo_code_input': instance.promoCodeInput,
  'ignored_rules': instance.ignoredRules,
};
