// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) {
  return _RewardModel.fromJson(json);
}

/// @nodoc
mixin _$RewardModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_required')
  int get pointsRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this RewardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardModelCopyWith<RewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardModelCopyWith<$Res> {
  factory $RewardModelCopyWith(
    RewardModel value,
    $Res Function(RewardModel) then,
  ) = _$RewardModelCopyWithImpl<$Res, RewardModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    String? image,
    @JsonKey(name: 'points_required') int pointsRequired,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class _$RewardModelCopyWithImpl<$Res, $Val extends RewardModel>
    implements $RewardModelCopyWith<$Res> {
  _$RewardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? pointsRequired = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            pointsRequired: null == pointsRequired
                ? _value.pointsRequired
                : pointsRequired // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RewardModelImplCopyWith<$Res>
    implements $RewardModelCopyWith<$Res> {
  factory _$$RewardModelImplCopyWith(
    _$RewardModelImpl value,
    $Res Function(_$RewardModelImpl) then,
  ) = __$$RewardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    String? image,
    @JsonKey(name: 'points_required') int pointsRequired,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class __$$RewardModelImplCopyWithImpl<$Res>
    extends _$RewardModelCopyWithImpl<$Res, _$RewardModelImpl>
    implements _$$RewardModelImplCopyWith<$Res> {
  __$$RewardModelImplCopyWithImpl(
    _$RewardModelImpl _value,
    $Res Function(_$RewardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? pointsRequired = null,
    Object? isActive = null,
  }) {
    return _then(
      _$RewardModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        pointsRequired: null == pointsRequired
            ? _value.pointsRequired
            : pointsRequired // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardModelImpl implements _RewardModel {
  const _$RewardModelImpl({
    required this.id,
    required this.name,
    this.description,
    this.image,
    @JsonKey(name: 'points_required') required this.pointsRequired,
    @JsonKey(name: 'is_active') required this.isActive,
  });

  factory _$RewardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  @JsonKey(name: 'points_required')
  final int pointsRequired;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'RewardModel(id: $id, name: $name, description: $description, image: $image, pointsRequired: $pointsRequired, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.pointsRequired, pointsRequired) ||
                other.pointsRequired == pointsRequired) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    image,
    pointsRequired,
    isActive,
  );

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      __$$RewardModelImplCopyWithImpl<_$RewardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardModelImplToJson(this);
  }
}

abstract class _RewardModel implements RewardModel {
  const factory _RewardModel({
    required final int id,
    required final String name,
    final String? description,
    final String? image,
    @JsonKey(name: 'points_required') required final int pointsRequired,
    @JsonKey(name: 'is_active') required final bool isActive,
  }) = _$RewardModelImpl;

  factory _RewardModel.fromJson(Map<String, dynamic> json) =
      _$RewardModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get image;
  @override
  @JsonKey(name: 'points_required')
  int get pointsRequired;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
