import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_bill_payload.freezed.dart';
part 'open_bill_payload.g.dart';

@freezed
class OpenBillPayload with _$OpenBillPayload {
  @JsonSerializable(explicitToJson: true)
  const factory OpenBillPayload({
    @JsonKey(name: 'type_order') required String typeOrder,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'member_id') int? memberId,
    List<CartItemPayload>? items,
  }) = _OpenBillPayload;

  factory OpenBillPayload.fromJson(Map<String, dynamic> json) =>
      _$OpenBillPayloadFromJson(json);
}
