part of 'shift_bloc.dart';

@freezed
class ShiftState with _$ShiftState {
  const factory ShiftState.initial() = _Initial;
  const factory ShiftState.loading() = _Loading;
  const factory ShiftState.opened(ShiftModel shift) = _Opened;

  // STATE BARU: Menampilkan data ringkasan di UI
  const factory ShiftState.summaryLoaded(ShiftModel summary) = _SummaryLoaded;

  const factory ShiftState.closed() = _Closed;
  const factory ShiftState.error(String message) = _Error;
}
