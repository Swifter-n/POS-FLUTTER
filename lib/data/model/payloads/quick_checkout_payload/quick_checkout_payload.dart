import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_checkout_payload.freezed.dart';
part 'quick_checkout_payload.g.dart';

@freezed
class QuickCheckoutPayload with _$QuickCheckoutPayload {
  const factory QuickCheckoutPayload({
    // --- KOMPONEN UTAMA (WAJIB) ---
    required List<CartItemPayload> items,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'type_order') required String typeOrder,

    // --- KOMPONEN PEMBAYARAN BARU ---
    // Sangat penting untuk kalkulasi kembalian dan validasi uang pas
    @JsonKey(name: 'amount_paid') required double amountPaid,

    // --- MANAJEMEN MEJA ---
    // Saya sertakan keduanya agar Anda fleksibel.
    // Jika backend butuh ID relasi pakai table_id, jika butuh string nama pakai table_number
    @JsonKey(name: 'table_id') int? tableId,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'guest_count') int? guestCount,

    // --- INFO PELANGGAN & CRM ---
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'member_id') int? memberId,
    @JsonKey(name: 'use_points') @Default(false) bool usePoints,

    // --- PROMO & DISKON ---
    @JsonKey(name: 'promo_code_input') String? promoCodeInput,
    @JsonKey(name: 'ignored_rules') @Default([]) List<String> ignoredRules,
  }) = _QuickCheckoutPayload;

  factory QuickCheckoutPayload.fromJson(Map<String, dynamic> json) =>
      _$QuickCheckoutPayloadFromJson(json);
}
