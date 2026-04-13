part of 'promo_bloc.dart';

@freezed
class PromoEvent with _$PromoEvent {
  const factory PromoEvent.started() = _Started;
  const factory PromoEvent.fetchAll() = _FetchAll;
}
