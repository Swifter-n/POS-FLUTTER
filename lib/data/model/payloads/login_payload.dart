import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_payload.freezed.dart';
part 'login_payload.g.dart';

@freezed
class LoginPayload with _$LoginPayload {
  @JsonSerializable(explicitToJson: true)
  const factory LoginPayload({
    required String credential,
    required String password,
    required String device_name,
  }) = _LoginPayload;

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);
}
