import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:avis_pos/data/model/responses/settings_model/settings_model.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final IPosRepository repository;

  SettingsBloc(this.repository) : super(const SettingsState.initial()) {
    on<_GetSettings>((event, emit) async {
      emit(const SettingsState.loading());
      final result = await repository.getPosSettings();
      result.fold(
        (l) =>
            emit(SettingsState.error(l.message ?? 'Gagal memuat pengaturan')),
        (r) => emit(SettingsState.loaded(r)),
      );
    });
  }
}
