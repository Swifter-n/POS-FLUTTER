import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_settings_model.freezed.dart';
part 'printer_settings_model.g.dart';

@freezed
class PrinterSettingsModel with _$PrinterSettingsModel {
  const factory PrinterSettingsModel({
    @JsonKey(name: 'default_printer') PrinterModel? defaultPrinter,
    @JsonKey(name: 'all_printers') @Default([]) List<PrinterModel> allPrinters,
  }) = _PrinterSettingsModel;

  factory PrinterSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PrinterSettingsModelFromJson(json);
}

@freezed
class PrinterModel with _$PrinterModel {
  const factory PrinterModel({
    required int id,
    required String name,
    @JsonKey(name: 'connection_type')
    required String connectionType, // 'bluetooth', 'usb', 'network'
    @JsonKey(name: 'mac_address') String? macAddress,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'paper_width') required String paperWidth, // '58', '80'
    @Default(false) bool defaultStatus,
  }) = _PrinterModel;

  factory PrinterModel.fromJson(Map<String, dynamic> json) =>
      _$PrinterModelFromJson(json);
}
