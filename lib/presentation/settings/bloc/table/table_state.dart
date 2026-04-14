part of 'table_bloc.dart';

@freezed
class TableState with _$TableState {
  const factory TableState.initial() = _Initial;
  const factory TableState.loading() = _Loading;

  // State khusus saat menampilkan data meja
  const factory TableState.loaded({
    required List<TableModel> tables,
    @Default(false) bool isSavingLayout,
  }) = _Loaded;

  const factory TableState.successTransferTable(String message) =
      _SuccessTransferTable;

  const factory TableState.successVoidOrder(String message) = _SuccessVoidOrder;

  const factory TableState.success(String message) = _Success;
  const factory TableState.error(String message) = _Error;
}
