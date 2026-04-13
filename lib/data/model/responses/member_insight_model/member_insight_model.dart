import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_insight_model.freezed.dart';
part 'member_insight_model.g.dart';

@freezed
class MemberInsightModel with _$MemberInsightModel {
  const factory MemberInsightModel({
    @JsonKey(name: 'last_visit') String? lastVisit,
    @JsonKey(name: 'total_spend') double? totalSpend,
    @JsonKey(name: 'favorite_product') String? favoriteProduct,
  }) = _MemberInsightModel;

  factory MemberInsightModel.fromJson(Map<String, dynamic> json) =>
      _$MemberInsightModelFromJson(json);
}
