import 'package:avis_pos/data/model/responses/member_voucher_model/member_voucher_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

Object? _readTotalSpend(Map<dynamic, dynamic> json, String key) {
  if (json['insight'] != null && json['insight']['total_spend'] != null) {
    return json['insight']['total_spend'];
  }
  return json['total_spend'] ?? json['totalSpend'];
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

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    required int id,
    required String name,
    required String phone,
    String? email,
    @JsonKey(name: 'member_code') String? memberCode,
    @JsonKey(name: 'points') int? currentPoints,
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
