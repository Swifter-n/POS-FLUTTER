import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

// Helper function untuk menjembatani format angka dari Laravel ke Dart
double? _parseDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class ShiftModel with _$ShiftModel {
  const factory ShiftModel({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'cashier_name') String? cashierName,
    @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
    double? openingAmount,
    @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
    double? closingAmount,

    @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
    double? expectedCash,
    @JsonKey(name: 'cash_sales', fromJson: _parseDouble) double? cashSales,
    @JsonKey(name: 'card_sales', fromJson: _parseDouble) double? cardSales,
    @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
    double? totalPointsRedeemed,
    @JsonKey(name: 'total_transactions') int? totalTransactions,

    String? status,
    @JsonKey(name: 'opened_at') String? openedAt,
    @JsonKey(name: 'closed_at') String? closedAt,
    @JsonKey(name: 'closing_note') String? closingNote,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);
}
