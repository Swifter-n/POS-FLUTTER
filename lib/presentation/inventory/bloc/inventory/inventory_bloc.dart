import 'package:avis_pos/data/model/responses/inventory_model/inventory_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';
part 'inventory_bloc.freezed.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final IPosRepository _repository;

  InventoryBloc(this._repository) : super(const InventoryState.initial()) {
    on<_Fetch>(_onFetch);
  }

  Future<void> _onFetch(_Fetch event, Emitter<InventoryState> emit) async {
    emit(const InventoryState.loading());
    final result = await _repository.getInventory(search: event.search);
    result.fold(
      (failure) => emit(
        InventoryState.error(failure.message ?? 'Gagal memuat data stok'),
      ),
      (items) => emit(InventoryState.loaded(items)),
    );
  }
}
