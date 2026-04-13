// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardModelImpl _$$RewardModelImplFromJson(Map<String, dynamic> json) =>
    _$RewardModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      pointsRequired: (json['points_required'] as num).toInt(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$RewardModelImplToJson(_$RewardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'points_required': instance.pointsRequired,
      'is_active': instance.isActive,
    };
