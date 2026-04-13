// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginPayloadImpl _$$LoginPayloadImplFromJson(Map<String, dynamic> json) =>
    _$LoginPayloadImpl(
      credential: json['credential'] as String,
      password: json['password'] as String,
      device_name: json['device_name'] as String,
    );

Map<String, dynamic> _$$LoginPayloadImplToJson(_$LoginPayloadImpl instance) =>
    <String, dynamic>{
      'credential': instance.credential,
      'password': instance.password,
      'device_name': instance.device_name,
    };
