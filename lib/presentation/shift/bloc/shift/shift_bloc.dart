import 'package:avis_pos/domain/pos_repository.dart';
import 'package:avis_pos/data/model/responses/shift_model/shift_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_event.dart';
part 'shift_state.dart';
part 'shift_bloc.freezed.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final IPosRepository _repository;

  ShiftBloc(this._repository) : super(const ShiftState.initial()) {
    on<_CheckStatus>((event, emit) async {
      emit(const ShiftState.loading());
      final result = await _repository.getShiftStatus();

      result.fold(
        (l) {
          // Hanya anggap shift "Tutup" jika pesan dari backend mengindikasikan 404 Not Found
          final errorMessage = l.message?.toLowerCase() ?? '';
          if (errorMessage.contains('404') ||
              errorMessage.contains('not found') ||
              errorMessage.contains('no active')) {
            emit(const ShiftState.closed());
          } else {
            // Jika error lain (seperti gagal parsing JSON atau server 500)
            emit(
              ShiftState.error(
                l.message ?? 'Gagal memuat status shift dari server.',
              ),
            );
          }
        },
        (r) => emit(
          ShiftState.opened(r),
        ), // Jika sukses parsing, shift berstatus Opened!
      );
    });

    on<_Open>((event, emit) async {
      emit(const ShiftState.loading());
      final result = await _repository.openShift(event.openingAmount);
      result.fold(
        (l) => emit(ShiftState.error(l.message ?? 'Gagal membuka shift')),
        (r) => emit(ShiftState.opened(r)),
      );
    });

    // HANDLER BARU: Menarik ringkasan shift
    on<_FetchSummary>((event, emit) async {
      emit(const ShiftState.loading());
      final result = await _repository.getShiftSummary();
      result.fold(
        (l) =>
            emit(ShiftState.error(l.message ?? 'Gagal memuat ringkasan shift')),
        (r) => emit(ShiftState.summaryLoaded(r)),
      );
    });

    on<_Close>((event, emit) async {
      emit(const ShiftState.loading());
      final result = await _repository.closeShift(
        event.closingAmount,
        event.note,
      );
      result.fold(
        (l) => emit(ShiftState.error(l.message ?? 'Gagal menutup shift')),
        (r) => emit(const ShiftState.closed()),
      );
    });
  }
}
