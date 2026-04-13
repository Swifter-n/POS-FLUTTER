// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      tax: TaxSetting.fromJson(json['tax'] as Map<String, dynamic>),
      globalDiscount: GlobalDiscountSetting.fromJson(
        json['global_discount'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'tax': instance.tax,
      'global_discount': instance.globalDiscount,
    };

_$TaxSettingImpl _$$TaxSettingImplFromJson(Map<String, dynamic> json) =>
    _$TaxSettingImpl(
      name: json['name'] as String,
      ratePercent: (json['rate_percent'] as num).toDouble(),
    );

Map<String, dynamic> _$$TaxSettingImplToJson(_$TaxSettingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rate_percent': instance.ratePercent,
    };

_$GlobalDiscountSettingImpl _$$GlobalDiscountSettingImplFromJson(
  Map<String, dynamic> json,
) => _$GlobalDiscountSettingImpl(
  name: json['name'] as String?,
  type: json['type'] as String?,
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$$GlobalDiscountSettingImplToJson(
  _$GlobalDiscountSettingImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'value': instance.value,
};
