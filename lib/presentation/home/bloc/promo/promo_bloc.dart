import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:avis_pos/data/model/responses/discount_rule_model/discount_rule_model.dart';

part 'promo_event.dart';
part 'promo_state.dart';
part 'promo_bloc.freezed.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final IPosRepository repository;

  PromoBloc(this.repository) : super(const PromoState.initial()) {
    on<_FetchAll>((event, emit) async {
      emit(const PromoState.loading());
      final result = await repository.getPromos();
      result.fold(
        (l) => emit(PromoState.error(l.message ?? 'Gagal memuat promo')),
        (r) => emit(PromoState.loaded(r)),
      );
    });
  }
}
