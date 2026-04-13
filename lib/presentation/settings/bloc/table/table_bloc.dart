import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_event.dart';
part 'table_state.dart';
part 'table_bloc.freezed.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final IPosRepository _repository;

  TableBloc(this._repository) : super(const TableState.initial()) {
    on<_Fetch>(_onFetch);
    on<_MoveTable>(_onMoveTable);
    on<_SavePositions>(_onSavePositions);
    on<_AddTable>(_onAddTable);
    on<_UpdateTable>(_onUpdateTable);
    on<_DeleteTable>(_onDeleteTable);
    on<_Clear>(_onClear);
  }

  // 1. Ambil data semua meja
  Future<void> _onFetch(_Fetch event, Emitter<TableState> emit) async {
    emit(const TableState.loading());
    final result = await _repository
        .getTables(); // Pastikan ada fungsi ini di repository

    result.fold(
      (failure) =>
          emit(TableState.error(failure.message ?? 'Gagal memuat data meja')),
      (tables) => emit(TableState.loaded(tables: tables)),
    );
  }

  // 2. Manipulasi State Lokal (Drag & Drop Meja) -> TANPA hit API
  void _onMoveTable(_MoveTable event, Emitter<TableState> emit) {
    state.maybeWhen(
      loaded: (tables, isSavingLayout) {
        // Cari meja yang digeser dan update posisinya secara lokal
        final updatedTables = tables.map((table) {
          if (table.id == event.tableId) {
            return table.copyWith(x: event.newX, y: event.newY);
          }
          return table;
        }).toList();

        // Pancarkan state baru agar UI bergeser mulus
        emit(
          TableState.loaded(
            tables: updatedTables,
            isSavingLayout: isSavingLayout,
          ),
        );
      },
      orElse: () {},
    );
  }

  // 3. Simpan perubahan posisi semua meja secara massal ke Backend
  Future<void> _onSavePositions(
    _SavePositions event,
    Emitter<TableState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (tables, _) async {
        // Ubah state jadi saving agar tombol simpan bisa disable/loading
        emit(TableState.loaded(tables: tables, isSavingLayout: true));

        // Buat payload dari meja-meja yang sudah tergeser di memori
        final payload = tables
            .map((t) => {'id': t.id, 'x_position': t.x, 'y_position': t.y})
            .toList();

        final result = await _repository.saveTablePositions(
          payload,
        ); // Pastikan repository punya fungsi ini

        result.fold(
          (failure) {
            emit(TableState.error(failure.message ?? 'Gagal menyimpan layout'));
            emit(TableState.loaded(tables: tables, isSavingLayout: false));
          },
          (_) {
            emit(const TableState.success('Layout denah berhasil disimpan!'));
            add(const TableEvent.fetch()); // Refresh data murni dari server
          },
        );
      },
      orElse: () async {},
    );
  }

  // 4. Tambah Meja Baru
  Future<void> _onAddTable(_AddTable event, Emitter<TableState> emit) async {
    emit(const TableState.loading());
    final result = await _repository.createTable(event.data);

    result.fold(
      (failure) =>
          emit(TableState.error(failure.message ?? 'Gagal menambah meja')),
      (_) {
        emit(const TableState.success('Meja berhasil ditambahkan'));
        add(const TableEvent.fetch());
      },
    );
  }

  // 5. Update Detail Meja (Nama, Kapasitas)
  Future<void> _onUpdateTable(
    _UpdateTable event,
    Emitter<TableState> emit,
  ) async {
    emit(const TableState.loading());
    final result = await _repository.updateTable(event.id, event.data);

    result.fold(
      (failure) =>
          emit(TableState.error(failure.message ?? 'Gagal memperbarui meja')),
      (_) {
        emit(const TableState.success('Data meja diperbarui'));
        add(const TableEvent.fetch());
      },
    );
  }

  // 6. Hapus Meja
  Future<void> _onDeleteTable(
    _DeleteTable event,
    Emitter<TableState> emit,
  ) async {
    emit(const TableState.loading());
    final result = await _repository.deleteTable(event.id);

    result.fold(
      (failure) =>
          emit(TableState.error(failure.message ?? 'Gagal menghapus meja')),
      (_) {
        emit(const TableState.success('Meja dihapus'));
        add(const TableEvent.fetch());
      },
    );
  }

  // 7. Kosongkan Meja (Set status jadi available)
  Future<void> _onClear(_Clear event, Emitter<TableState> emit) async {
    emit(const TableState.loading());
    // Asumsi endpoint untuk membebaskan meja: POST /pos/tables/{id}/clear
    final result = await _repository.clearTable(event.tableId);

    result.fold(
      (failure) =>
          emit(TableState.error(failure.message ?? 'Gagal mengosongkan meja')),
      (_) {
        emit(
          const TableState.success(
            'Meja berhasil dikosongkan dan siap digunakan',
          ),
        );
        add(const TableEvent.fetch());
      },
    );
  }
}
