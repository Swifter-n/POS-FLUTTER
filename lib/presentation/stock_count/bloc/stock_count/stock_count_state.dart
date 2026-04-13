part of 'stock_count_bloc.dart';

@freezed
class StockCountState with _$StockCountState {
  const factory StockCountState.initial() = _Initial;
  const factory StockCountState.loading() = _Loading;

  // State untuk halaman pertama (Daftar Tugas)
  const factory StockCountState.tasksLoaded(List<StockCountTaskModel> tasks) =
      _TasksLoaded;

  // State untuk halaman kedua (Daftar Barang dalam 1 Tugas)
  const factory StockCountState.itemsLoaded(
    int taskId,
    List<StockCountItemModel> items,
  ) = _ItemsLoaded;

  const factory StockCountState.success(String message) = _Success;
  const factory StockCountState.error(String message) = _Error;
}
