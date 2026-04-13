// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftModelImpl _$$ShiftModelImplFromJson(Map<String, dynamic> json) =>
    _$ShiftModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      cashierName: json['cashier_name'] as String?,
      openingAmount: _parseDouble(json['opening_amount']),
      closingAmount: _parseDouble(json['closing_amount']),
      expectedCash: _parseDouble(json['expected_cash']),
      cashSales: _parseDouble(json['cash_sales']),
      cardSales: _parseDouble(json['card_sales']),
      totalPointsRedeemed: _parseDouble(json['total_points_redeemed']),
      totalTransactions: (json['total_transactions'] as num?)?.toInt(),
      status: json['status'] as String?,
      openedAt: json['opened_at'] as String?,
      closedAt: json['closed_at'] as String?,
      closingNote: json['closing_note'] as String?,
    );

Map<String, dynamic> _$$ShiftModelImplToJson(_$ShiftModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'cashier_name': instance.cashierName,
      'opening_amount': instance.openingAmount,
      'closing_amount': instance.closingAmount,
      'expected_cash': instance.expectedCash,
      'cash_sales': instance.cashSales,
      'card_sales': instance.cardSales,
      'total_points_redeemed': instance.totalPointsRedeemed,
      'total_transactions': instance.totalTransactions,
      'status': instance.status,
      'opened_at': instance.openedAt,
      'closed_at': instance.closedAt,
      'closing_note': instance.closingNote,
    };
