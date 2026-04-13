import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required TaxSetting tax,
    @JsonKey(name: 'global_discount')
    required GlobalDiscountSetting globalDiscount,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}

@freezed
class TaxSetting with _$TaxSetting {
  const factory TaxSetting({
    required String name,
    @JsonKey(name: 'rate_percent') required double ratePercent,
  }) = _TaxSetting;

  factory TaxSetting.fromJson(Map<String, dynamic> json) =>
      _$TaxSettingFromJson(json);
}

@freezed
class GlobalDiscountSetting with _$GlobalDiscountSetting {
  const factory GlobalDiscountSetting({
    String? name,
    String? type, // 'fixed', 'percent'
    required double value,
  }) = _GlobalDiscountSetting;

  factory GlobalDiscountSetting.fromJson(Map<String, dynamic> json) =>
      _$GlobalDiscountSettingFromJson(json);
}
