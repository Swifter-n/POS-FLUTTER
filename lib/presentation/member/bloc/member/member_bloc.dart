import 'package:avis_pos/data/model/responses/member_model/member_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final IPosRepository _repository;

  MemberBloc(this._repository) : super(const MemberState.initial()) {
    // Tarik Semua Data Member (Bisa dengan keyword pencarian)
    on<_FetchMembers>((event, emit) async {
      emit(const MemberState.loading());
      final result = await _repository.getMembers(search: event.search);
      result.fold(
        (l) => emit(MemberState.error(l.message ?? 'Gagal memuat data member')),
        (r) => emit(MemberState.loaded(r)),
      );
    });

    // Cek 1 Member Spesifik (Untuk digunakan saat Checkout Kasir)
    on<_CheckMember>((event, emit) async {
      emit(const MemberState.loading());
      final result = await _repository.checkMember(event.codeOrPhone);
      result.fold(
        (l) => emit(MemberState.error(l.message ?? 'Member tidak ditemukan')),
        (r) => emit(MemberState.memberFound(r)),
      );
    });

    // Daftar Member Baru
    on<_RegisterMember>((event, emit) async {
      emit(const MemberState.loading());
      final result = await _repository.registerMember(event.data);
      result.fold(
        (l) => emit(MemberState.error(l.message ?? 'Gagal mendaftar member')),
        (r) {
          emit(const MemberState.success('Member berhasil didaftarkan!'));
          // Langsung jadikan member tersebut sebagai yang terpilih
          emit(MemberState.memberFound(r));
        },
      );
    });

    // Hapus pilihan member saat ini
    on<_ClearSelected>((event, emit) {
      emit(const MemberState.initial());
    });

    on<_UpdateMember>((event, emit) async {
      emit(const MemberState.loading());

      // Pastikan fungsi updateMember sudah Anda buat di IPosRepository & PosRemoteDataSourceImpl
      final result = await _repository.updateMember(event.id, event.data);

      result.fold(
        (l) => emit(
          MemberState.error(l.message ?? 'Gagal mengupdate data member'),
        ),
        (r) {
          emit(const MemberState.success('Data member berhasil diperbarui!'));
          // Langsung refresh list member setelah berhasil update
          add(const MemberEvent.fetchMembers());
        },
      );
    });
  }
}
