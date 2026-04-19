// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_count_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StockCountTaskModel _$StockCountTaskModelFromJson(Map<String, dynamic> json) {
  return _StockCountTaskModel.fromJson(json);
}

/// @nodoc
mixin _$StockCountTaskModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_number')
  String? get countNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this StockCountTaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockCountTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCountTaskModelCopyWith<StockCountTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountTaskModelCopyWith<$Res> {
  factory $StockCountTaskModelCopyWith(
    StockCountTaskModel value,
    $Res Function(StockCountTaskModel) then,
  ) = _$StockCountTaskModelCopyWithImpl<$Res, StockCountTaskModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'count_number') String? countNumber,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  });
}

/// @nodoc
class _$StockCountTaskModelCopyWithImpl<$Res, $Val extends StockCountTaskModel>
    implements $StockCountTaskModelCopyWith<$Res> {
  _$StockCountTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countNumber = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            countNumber: freezed == countNumber
                ? _value.countNumber
                : countNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StockCountTaskModelImplCopyWith<$Res>
    implements $StockCountTaskModelCopyWith<$Res> {
  factory _$$StockCountTaskModelImplCopyWith(
    _$StockCountTaskModelImpl value,
    $Res Function(_$StockCountTaskModelImpl) then,
  ) = __$$StockCountTaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'count_number') String? countNumber,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  });
}

/// @nodoc
class __$$StockCountTaskModelImplCopyWithImpl<$Res>
    extends _$StockCountTaskModelCopyWithImpl<$Res, _$StockCountTaskModelImpl>
    implements _$$StockCountTaskModelImplCopyWith<$Res> {
  __$$StockCountTaskModelImplCopyWithImpl(
    _$StockCountTaskModelImpl _value,
    $Res Function(_$StockCountTaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countNumber = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$StockCountTaskModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        countNumber: freezed == countNumber
            ? _value.countNumber
            : countNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StockCountTaskModelImpl implements _StockCountTaskModel {
  const _$StockCountTaskModelImpl({
    this.id,
    @JsonKey(name: 'count_number') this.countNumber,
    this.status,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'completed_at') this.completedAt,
  });

  factory _$StockCountTaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockCountTaskModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'count_number')
  final String? countNumber;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;

  @override
  String toString() {
    return 'StockCountTaskModel(id: $id, countNumber: $countNumber, status: $status, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCountTaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countNumber, countNumber) ||
                other.countNumber == countNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, countNumber, status, createdAt, completedAt);

  /// Create a copy of StockCountTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCountTaskModelImplCopyWith<_$StockCountTaskModelImpl> get copyWith =>
      __$$StockCountTaskModelImplCopyWithImpl<_$StockCountTaskModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StockCountTaskModelImplToJson(this);
  }
}

abstract class _StockCountTaskModel implements StockCountTaskModel {
  const factory _StockCountTaskModel({
    final int? id,
    @JsonKey(name: 'count_number') final String? countNumber,
    final String? status,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'completed_at') final String? completedAt,
  }) = _$StockCountTaskModelImpl;

  factory _StockCountTaskModel.fromJson(Map<String, dynamic> json) =
      _$StockCountTaskModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'count_number')
  String? get countNumber;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;

  /// Create a copy of StockCountTaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCountTaskModelImplCopyWith<_$StockCountTaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
