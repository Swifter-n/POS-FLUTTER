import 'package:avis_pos/data/model/responses/reward_model.dart/reward_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_event.dart';
part 'reward_state.dart';
part 'reward_bloc.freezed.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  final IPosRepository _repository;

  RewardBloc(this._repository) : super(const RewardState.initial()) {
    // --- MENGAMBIL KATALOG HADIAH ---
    on<_FetchCatalog>((event, emit) async {
      emit(const RewardState.loading());
      final result = await _repository.getRewardCatalog();

      result.fold(
        (l) =>
            emit(RewardState.error(l.message ?? 'Gagal memuat katalog hadiah')),
        (r) => emit(RewardState.catalogLoaded(r)),
      );
    });

    // --- MENUKARKAN POIN DENGAN HADIAH ---
    on<_RedeemReward>((event, emit) async {
      emit(const RewardState.loading());
      final result = await _repository.redeemReward(
        event.rewardId,
        event.memberId,
      );

      result.fold(
        (l) => emit(RewardState.error(l.message ?? 'Gagal menukarkan poin')),
        (r) {
          // API merespons dengan data voucher_code dan remaining_points
          final data = r['data'];
          emit(
            RewardState.redeemSuccess(
              data['voucher_code'] ?? '-',
              data['remaining_points'] ?? 0,
            ),
          );
        },
      );
    });
  }
}
