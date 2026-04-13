// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderModelImpl(
  id: (_parseInt(json, 'id') as num?)?.toInt() ?? 0,
  orderNumber: json['order_number'] as String? ?? '-',
  customerName: json['customer_name'] as String?,
  tableNumber: json['table_number'] as String?,
  typeOrder: json['type_order'] as String?,
  totalPrice: (_parseDouble(json, 'total_price') as num?)?.toDouble() ?? 0.0,
  subTotal: (_parseDouble(json, 'sub_total') as num?)?.toDouble() ?? 0.0,
  tax: (_parseDouble(json, 'tax') as num?)?.toDouble() ?? 0.0,
  discount: (_parseDouble(json, 'discount') as num?)?.toDouble() ?? 0.0,
  status: json['status'] as String? ?? 'pending',
  memberId: (_parseInt(json, 'member_id') as num?)?.toInt() ?? 0,
  pointsEarned: (_parseInt(json, 'points_earned') as num?)?.toInt() ?? 0,
  pointsRedeemed: (_parseInt(json, 'points_redeemed') as num?)?.toInt() ?? 0,
  appliedRules:
      (_parseRules(json, 'applied_rules') as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  proof: json['proof'] as String?,
  paymentMethod: json['payment_method'] as String?,
  guestCount: (_parseInt(json, 'guest_count') as num?)?.toInt() ?? 1,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  member: json['member'] == null
      ? null
      : MemberModel.fromJson(json['member'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'customer_name': instance.customerName,
      'table_number': instance.tableNumber,
      'type_order': instance.typeOrder,
      'total_price': instance.totalPrice,
      'sub_total': instance.subTotal,
      'tax': instance.tax,
      'discount': instance.discount,
      'status': instance.status,
      'member_id': instance.memberId,
      'points_earned': instance.pointsEarned,
      'points_redeemed': instance.pointsRedeemed,
      'applied_rules': instance.appliedRules,
      'proof': instance.proof,
      'payment_method': instance.paymentMethod,
      'guest_count': instance.guestCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'items': instance.items,
      'member': instance.member,
    };
