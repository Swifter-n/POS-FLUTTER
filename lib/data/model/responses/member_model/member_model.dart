import 'package:avis_pos/data/model/responses/member_voucher_model/member_voucher_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

Object? _readTotalSpend(Map<dynamic, dynamic> json, String key) {
  dynamic value;
  if (json['insight'] != null && json['insight']['total_spend'] != null) {
    value = json['insight']['total_spend'];
  } else {
    value = json['total_spend'] ?? json['totalSpend'];
  }
  return _toDouble(value);
}

Object? _readLastVisit(Map<dynamic, dynamic> json, String key) {
  if (json['insight'] != null && json['insight']['last_visit'] != null) {
    return json['insight']['last_visit'];
  }
  return json['last_visit'] ?? json['lastVisit'];
}

Object? _readFavoriteProduct(Map<dynamic, dynamic> json, String key) {
  if (json['insight'] != null && json['insight']['favorite_product'] != null) {
    return json['insight']['favorite_product'];
  }
  return json['favorite_product'] ?? json['favoriteProduct'];
}

Object? _readPoints(Map<dynamic, dynamic> json, String key) {
  final value =
      json['points'] ?? json['current_points'] ?? json['currentPoints'];
  return _toDouble(value);
}

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    required int id,
    required String name,
    required String phone,
    String? email,
    @JsonKey(name: 'member_code') String? memberCode,
    @JsonKey(name: 'points', readValue: _readPoints) double? currentPoints,
    @Default('Basic') String tier,

    @Default([]) List<MemberVoucherModel> vouchers,

    // Insight CRM
    @JsonKey(name: 'last_visit', readValue: _readLastVisit) String? lastVisit,

    @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
    String? favoriteProduct,

    @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
    double? totalSpend,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
