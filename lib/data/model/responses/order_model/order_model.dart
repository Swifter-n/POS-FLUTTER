import 'package:freezed_annotation/freezed_annotation.dart';
import '../order_item_model/order_item_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

// ✅ SHIELD 1: Pemaksa Angka Bulat (Anti-Crash)
int _parseInt(Map<dynamic, dynamic> json, String key) {
  final val = json[key];
  if (val is int) return val;
  if (val is double) return val.toInt();
  if (val is String) return int.tryParse(val) ?? 0;
  return 0; // Jika backend mengirim Map/Objek, paksa jadi 0
}

// ✅ SHIELD 2: Pemaksa Angka Desimal (Anti-Crash)
double _parseDouble(Map<dynamic, dynamic> json, String key) {
  final val = json[key];
  if (val is double) return val;
  if (val is int) return val.toDouble();
  if (val is String) return double.tryParse(val) ?? 0.0;
  return 0.0;
}

// ✅ SHIELD 3: Pemaksa Array String (Mencegah error pada applied_rules)
List<String> _parseRules(Map<dynamic, dynamic> json, String key) {
  final val = json[key];
  if (val is List) {
    return val.map((e) {
      if (e is String) return e;
      if (e is Map && e.containsKey('name')) return e['name'].toString();
      return e.toString();
    }).toList();
  }
  return [];
}

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(readValue: _parseInt) @Default(0) int id,
    @JsonKey(name: 'order_number') @Default('-') String orderNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'type_order') String? typeOrder,
    @JsonKey(name: 'total_price', readValue: _parseDouble)
    @Default(0.0)
    double totalPrice,
    @JsonKey(name: 'sub_total', readValue: _parseDouble)
    @Default(0.0)
    double subTotal,
    @JsonKey(readValue: _parseDouble) @Default(0.0) double tax,
    @JsonKey(readValue: _parseDouble) @Default(0.0) double discount,
    @Default('pending') String status,
    @JsonKey(name: 'member_id', readValue: _parseInt) @Default(0) int memberId,
    @JsonKey(name: 'points_earned', readValue: _parseInt)
    @Default(0)
    int pointsEarned,
    @JsonKey(name: 'points_redeemed', readValue: _parseInt)
    @Default(0)
    int pointsRedeemed,
    @JsonKey(name: 'applied_rules', readValue: _parseRules)
    @Default([])
    List<String> appliedRules,
    String? proof,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'guest_count', readValue: _parseInt)
    @Default(1)
    int guestCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default([]) List<OrderItemModel> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
