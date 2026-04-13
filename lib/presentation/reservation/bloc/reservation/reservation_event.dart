part of 'reservation_bloc.dart';

@freezed
class ReservationEvent with _$ReservationEvent {
  const factory ReservationEvent.fetch() = _Fetch;

  const factory ReservationEvent.create(Map<String, dynamic> data) = _Create;

  const factory ReservationEvent.updateStatus({
    required int id,
    required String status,
  }) = _UpdateStatus;

  const factory ReservationEvent.select(ReservationModel reservation) = _Select;
}
