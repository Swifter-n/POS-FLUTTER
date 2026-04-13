// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrinterSettingsModelImpl _$$PrinterSettingsModelImplFromJson(
  Map<String, dynamic> json,
) => _$PrinterSettingsModelImpl(
  defaultPrinter: json['default_printer'] == null
      ? null
      : PrinterModel.fromJson(json['default_printer'] as Map<String, dynamic>),
  allPrinters:
      (json['all_printers'] as List<dynamic>?)
          ?.map((e) => PrinterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PrinterSettingsModelImplToJson(
  _$PrinterSettingsModelImpl instance,
) => <String, dynamic>{
  'default_printer': instance.defaultPrinter,
  'all_printers': instance.allPrinters,
};

_$PrinterModelImpl _$$PrinterModelImplFromJson(Map<String, dynamic> json) =>
    _$PrinterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      connectionType: json['connection_type'] as String,
      macAddress: json['mac_address'] as String?,
      ipAddress: json['ip_address'] as String?,
      paperWidth: json['paper_width'] as String,
      defaultStatus: json['defaultStatus'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrinterModelImplToJson(_$PrinterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'connection_type': instance.connectionType,
      'mac_address': instance.macAddress,
      'ip_address': instance.ipAddress,
      'paper_width': instance.paperWidth,
      'defaultStatus': instance.defaultStatus,
    };
