import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_item_model.dart';
import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_task_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_count_event.dart';
part 'stock_count_state.dart';
part 'stock_count_bloc.freezed.dart';

class StockCountBloc extends Bloc<StockCountEvent, StockCountState> {
  final IPosRepository _repository;

  StockCountBloc(this._repository) : super(const StockCountState.initial()) {
    // 1. Ambil Daftar Tugas Opname
    on<_FetchTasks>((event, emit) async {
      emit(const StockCountState.loading());
      final result = await _repository.getStockCountTasks();
      result.fold(
        (l) => emit(
          StockCountState.error(
            l.message ?? 'Gagal memuat daftar tugas opname',
          ),
        ),
        (r) => emit(StockCountState.tasksLoaded(r)),
      );
    });

    // 2. Ambil Daftar Barang dari Tugas Tertentu
    on<_FetchItems>((event, emit) async {
      emit(const StockCountState.loading());
      final result = await _repository.getStockCountItems(event.taskId);
      result.fold(
        (l) => emit(
          StockCountState.error(
            l.message ?? 'Gagal memuat detail barang opname',
          ),
        ),
        (r) => emit(StockCountState.itemsLoaded(event.taskId, r)),
      );
    });

    // 3. Update Hitungan Fisik per Barang (Optimistic UI)
    on<_UpdateItemCount>((event, emit) async {
      // Simpan state lama agar layar tidak berkedip loading
      final currentState = state;

      // Update state lokal sementara (Optimistic update) agar UI langsung berubah
      if (currentState is _ItemsLoaded && currentState.taskId == event.taskId) {
        final updatedItems = currentState.items.map((item) {
          if (item.id == event.itemId) {
            // Karena model Anda mungkin immutable, kita asumsikan Anda memakai copyWith
            // Jika belum ada copyWith di model, kita buat workaround atau pastikan model Freezed
            return item.copyWith(
              countedQty: event.qty,
              isZeroCount: event.isZero,
            );
          }
          return item;
        }).toList();
        emit(StockCountState.itemsLoaded(event.taskId, updatedItems));
      }

      // Tembak API secara background
      final result = await _repository.updateStockCountItem(
        event.itemId,
        event.qty,
        event.isZero,
      );
      result.fold(
        (l) {
          emit(
            StockCountState.error(
              l.message ?? 'Gagal menyimpan hitungan ke server',
            ),
          );
          emit(currentState); // Revert ke state semula jika API gagal
        },
        (r) {
          // Sukses senyap, tidak perlu emit apa-apa karena UI sudah terupdate
        },
      );
    });

    // 4. Submit / Selesaikan Tugas Opname
    on<_SubmitTask>((event, emit) async {
      emit(const StockCountState.loading());
      final result = await _repository.submitStockCount(event.taskId);
      result.fold(
        (l) => emit(
          StockCountState.error(l.message ?? 'Gagal menyelesaikan opname'),
        ),
        (r) => emit(
          const StockCountState.success(
            'Tugas Stock Opname berhasil diselesaikan!',
          ),
        ),
      );
    });
  }
}
