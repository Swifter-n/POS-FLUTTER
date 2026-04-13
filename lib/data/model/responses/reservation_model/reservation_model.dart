import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

@freezed
class ReservationModel with _$ReservationModel {
  const factory ReservationModel({
    required int id,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'guest_count') required int guestCount,

    // Waktu reservasi (biasanya dalam format ISO-8601 atau YYYY-MM-DD HH:MM:SS)
    @JsonKey(name: 'reservation_time') required String reservationTime,

    String? status, // 'booked', 'seated', 'cancelled', 'completed'
    String? notes,

    // Foreign key (Berguna saat membuat/update data sebelum relasi di-load)
    @JsonKey(name: 'table_id') int? tableId,

    // Nested object dari relasi tabel
    TableModel? table,
  }) = _ReservationModel;

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);
}
