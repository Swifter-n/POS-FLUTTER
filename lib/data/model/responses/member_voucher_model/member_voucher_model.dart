import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_voucher_model.freezed.dart';
part 'member_voucher_model.g.dart';

@freezed
class MemberVoucherModel with _$MemberVoucherModel {
  const factory MemberVoucherModel({
    required int id,
    required String code,
    required String name,
    required String description,
    @JsonKey(name: 'discount_type') required String discountType,
    @JsonKey(name: 'discount_value') double? discountValue, // ✅ Bikin Nullable
    @JsonKey(name: 'min_purchase') double? minPurchase,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'is_used') @Default(false) bool isUsed,
  }) = _MemberVoucherModel;

  factory MemberVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$MemberVoucherModelFromJson(json);
}
