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
    on<_FetchTasks>(_onFetchTasks);
    on<_FetchItems>(_onFetchItems);
    on<_UpdateItemCount>(_onUpdateItemCount);
    on<_SubmitTask>(_onSubmitTask);
  }

  Future<void> _onFetchTasks(
    _FetchTasks event,
    Emitter<StockCountState> emit,
  ) async {
    emit(const StockCountState.loading());
    final result = await _repository.getStockCountTasks();
    result.fold(
      (l) => emit(
        StockCountState.error(l.message ?? 'Gagal memuat daftar tugas opname'),
      ),
      (r) => emit(StockCountState.tasksLoaded(r)),
    );
  }

  Future<void> _onFetchItems(
    _FetchItems event,
    Emitter<StockCountState> emit,
  ) async {
    emit(const StockCountState.loading());
    final result = await _repository.getStockCountItems(event.taskId);
    result.fold(
      (l) => emit(
        StockCountState.error(l.message ?? 'Gagal memuat detail barang opname'),
      ),
      (r) => emit(StockCountState.itemsLoaded(event.taskId, r)),
    );
  }

  Future<void> _onUpdateItemCount(
    _UpdateItemCount event,
    Emitter<StockCountState> emit,
  ) async {
    final currentState = state;

    if (currentState is _ItemsLoaded && currentState.taskId == event.taskId) {
      final updatedItems =
          currentState.items.map((item) {
            if (item.id == event.itemId) {
              return item.copyWith(
                countedQty: event.qty,
                isZeroCount: event.isZero,
              );
            }
            return item;
          }).toList();
      emit(StockCountState.itemsLoaded(event.taskId, updatedItems));
    }

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
        emit(currentState);
      },
      (r) {},
    );
  }

  Future<void> _onSubmitTask(
    _SubmitTask event,
    Emitter<StockCountState> emit,
  ) async {
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
  }
}
