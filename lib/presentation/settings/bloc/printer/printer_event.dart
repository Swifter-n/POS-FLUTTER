part of 'printer_bloc.dart';

@freezed
class PrinterEvent with _$PrinterEvent {
  const factory PrinterEvent.fetchSettings() = _FetchSettings;
  const factory PrinterEvent.testPrint(dynamic printerData) = _TestPrint;
}
