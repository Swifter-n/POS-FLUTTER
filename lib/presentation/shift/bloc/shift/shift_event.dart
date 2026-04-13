part of 'shift_bloc.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.checkStatus() = _CheckStatus;
  const factory ShiftEvent.open(double openingAmount) = _Open;

  // EVENT BARU: Untuk menarik data ringkasan sebelum tutup shift
  const factory ShiftEvent.fetchSummary() = _FetchSummary;

  const factory ShiftEvent.close(double closingAmount, String? note) = _Close;
}
