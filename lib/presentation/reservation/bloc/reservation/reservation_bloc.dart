import 'package:avis_pos/data/model/responses/reservation_model/reservation_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final IPosRepository _repository;

  ReservationBloc(this._repository) : super(const ReservationState.initial()) {
    on<_Fetch>(_onFetch);
    on<_Create>(_onCreate);
    on<_UpdateStatus>(_onUpdateStatus);
    on<_Select>(_onSelect);
  }

  // 1. Mengambil semua daftar reservasi dari API
  Future<void> _onFetch(_Fetch event, Emitter<ReservationState> emit) async {
    emit(const ReservationState.loading());
    final result = await _repository.getReservations();

    result.fold(
      (failure) => emit(
        ReservationState.error(failure.message ?? 'Gagal memuat reservasi'),
      ),
      (reservations) =>
          emit(ReservationState.loaded(reservations: reservations)),
    );
  }

  // 2. Membuat reservasi baru (Store)
  Future<void> _onCreate(_Create event, Emitter<ReservationState> emit) async {
    emit(const ReservationState.loading());
    final result = await _repository.storeReservation(event.data);

    result.fold(
      (failure) => emit(
        ReservationState.error(failure.message ?? 'Gagal membuat reservasi'),
      ),
      (reservation) {
        emit(const ReservationState.success('Reservasi berhasil dibuat'));
        add(const ReservationEvent.fetch()); // Refresh data
      },
    );
  }

  // 3. Update status reservasi (booked -> seated -> completed/cancelled)
  Future<void> _onUpdateStatus(
    _UpdateStatus event,
    Emitter<ReservationState> emit,
  ) async {
    emit(const ReservationState.loading());
    final result = await _repository.updateReservationStatus(
      event.id,
      event.status,
    );

    result.fold(
      (failure) => emit(
        ReservationState.error(failure.message ?? 'Gagal update status'),
      ),
      (_) {
        String msg = 'Status reservasi diperbarui';
        if (event.status == 'seated') msg = 'Tamu telah menempati meja';
        if (event.status == 'cancelled') msg = 'Reservasi dibatalkan';

        emit(ReservationState.success(msg));
        add(const ReservationEvent.fetch()); // Refresh data
      },
    );
  }

  // 4. Memilih salah satu reservasi untuk ditampilkan detailnya di UI
  void _onSelect(_Select event, Emitter<ReservationState> emit) {
    state.maybeWhen(
      loaded: (reservations, _) {
        emit(
          ReservationState.loaded(
            reservations: reservations,
            selectedReservation: event.reservation,
          ),
        );
      },
      orElse: () {},
    );
  }
}
