part of 'stock_count_bloc.dart';

@freezed
class StockCountEvent with _$StockCountEvent {
  const factory StockCountEvent.fetchTasks() = _FetchTasks;
  const factory StockCountEvent.fetchItems(int taskId) = _FetchItems;

  // Event untuk mengupdate angka hitungan fisik per barang
  const factory StockCountEvent.updateItemCount(
    int taskId,
    int itemId,
    double qty,
    bool isZero,
  ) = _UpdateItemCount;

  // Event untuk finalisasi/tutup tugas opname
  const factory StockCountEvent.submitTask(int taskId) = _SubmitTask;
}
