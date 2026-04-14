// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'x')
  double get x => throw _privateConstructorUsedError;
  @JsonKey(name: 'y')
  double get y => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'available', 'occupied'
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_order_id')
  int? get activeOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_occupied')
  bool? get isOccupied => throw _privateConstructorUsedError;

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
    TableModel value,
    $Res Function(TableModel) then,
  ) = _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call({
    int id,
    String code,
    @JsonKey(name: 'x') double x,
    @JsonKey(name: 'y') double y,
    String status,
    int? capacity,
    @JsonKey(name: 'active_order_id') int? activeOrderId,
    @JsonKey(name: 'is_occupied') bool? isOccupied,
  });
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? x = null,
    Object? y = null,
    Object? status = null,
    Object? capacity = freezed,
    Object? activeOrderId = freezed,
    Object? isOccupied = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            x: null == x
                ? _value.x
                : x // ignore: cast_nullable_to_non_nullable
                      as double,
            y: null == y
                ? _value.y
                : y // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            capacity: freezed == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int?,
            activeOrderId: freezed == activeOrderId
                ? _value.activeOrderId
                : activeOrderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            isOccupied: freezed == isOccupied
                ? _value.isOccupied
                : isOccupied // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
    _$TableModelImpl value,
    $Res Function(_$TableModelImpl) then,
  ) = __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    @JsonKey(name: 'x') double x,
    @JsonKey(name: 'y') double y,
    String status,
    int? capacity,
    @JsonKey(name: 'active_order_id') int? activeOrderId,
    @JsonKey(name: 'is_occupied') bool? isOccupied,
  });
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
    _$TableModelImpl _value,
    $Res Function(_$TableModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? x = null,
    Object? y = null,
    Object? status = null,
    Object? capacity = freezed,
    Object? activeOrderId = freezed,
    Object? isOccupied = freezed,
  }) {
    return _then(
      _$TableModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        x: null == x
            ? _value.x
            : x // ignore: cast_nullable_to_non_nullable
                  as double,
        y: null == y
            ? _value.y
            : y // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        capacity: freezed == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int?,
        activeOrderId: freezed == activeOrderId
            ? _value.activeOrderId
            : activeOrderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        isOccupied: freezed == isOccupied
            ? _value.isOccupied
            : isOccupied // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TableModelImpl implements _TableModel {
  const _$TableModelImpl({
    required this.id,
    required this.code,
    @JsonKey(name: 'x') this.x = 0.0,
    @JsonKey(name: 'y') this.y = 0.0,
    this.status = 'available',
    this.capacity,
    @JsonKey(name: 'active_order_id') this.activeOrderId,
    @JsonKey(name: 'is_occupied') this.isOccupied,
  });

  factory _$TableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableModelImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  @JsonKey(name: 'x')
  final double x;
  @override
  @JsonKey(name: 'y')
  final double y;
  @override
  @JsonKey()
  final String status;
  // 'available', 'occupied'
  @override
  final int? capacity;
  @override
  @JsonKey(name: 'active_order_id')
  final int? activeOrderId;
  @override
  @JsonKey(name: 'is_occupied')
  final bool? isOccupied;

  @override
  String toString() {
    return 'TableModel(id: $id, code: $code, x: $x, y: $y, status: $status, capacity: $capacity, activeOrderId: $activeOrderId, isOccupied: $isOccupied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.activeOrderId, activeOrderId) ||
                other.activeOrderId == activeOrderId) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    x,
    y,
    status,
    capacity,
    activeOrderId,
    isOccupied,
  );

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableModelImplToJson(this);
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel({
    required final int id,
    required final String code,
    @JsonKey(name: 'x') final double x,
    @JsonKey(name: 'y') final double y,
    final String status,
    final int? capacity,
    @JsonKey(name: 'active_order_id') final int? activeOrderId,
    @JsonKey(name: 'is_occupied') final bool? isOccupied,
  }) = _$TableModelImpl;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$TableModelImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  @JsonKey(name: 'x')
  double get x;
  @override
  @JsonKey(name: 'y')
  double get y;
  @override
  String get status; // 'available', 'occupied'
  @override
  int? get capacity;
  @override
  @JsonKey(name: 'active_order_id')
  int? get activeOrderId;
  @override
  @JsonKey(name: 'is_occupied')
  bool? get isOccupied;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
