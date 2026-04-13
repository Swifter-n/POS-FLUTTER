import 'package:avis_pos/core/services/printer_service.dart'; // IMPORT PRINTER SERVICE ANDA
import 'package:avis_pos/data/model/responses/printer_settings_model/printer_settings_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_event.dart';
part 'printer_state.dart';
part 'printer_bloc.freezed.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  final IPosRepository _repository;

  PrinterBloc(this._repository) : super(const PrinterState.initial()) {
    on<_FetchSettings>((event, emit) async {
      emit(const PrinterState.loading());
      final result = await _repository.getPrinterSettings();

      result.fold(
        (l) => emit(
          PrinterState.error(l.message ?? 'Gagal memuat pengaturan printer'),
        ),
        (r) => emit(PrinterState.loaded(r)),
      );
    });

    // --- EKSEKUSI TEST PRINT KE HARDWARE ---
    on<_TestPrint>((event, emit) async {
      // 1. Simpan state saat ini (daftar printer) agar UI tidak hilang/berkedip
      final currentState = state;

      try {
        // 2. Panggil fungsi dari PrinterService untuk mencetak
        await PrinterService().printTest(event.printerData);
      } catch (e) {
        // 3. Jika gagal (kertas habis/koneksi putus), pancarkan error
        emit(PrinterState.error('Gagal mencetak: ${e.toString()}'));

        // 4. Segera kembalikan ke state daftar printer agar UI tetap aman
        await Future.delayed(const Duration(milliseconds: 100));
        emit(currentState);
      }
    });
  }
}
