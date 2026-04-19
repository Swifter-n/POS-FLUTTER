// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_count_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StockCountItemModel _$StockCountItemModelFromJson(Map<String, dynamic> json) {
  return _StockCountItemModel.fromJson(json);
}

/// @nodoc
mixin _$StockCountItemModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'system_stock')
  double? get systemStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'counted_qty')
  double? get countedQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_zero_count')
  bool? get isZeroCount => throw _privateConstructorUsedError;

  /// Serializes this StockCountItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockCountItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockCountItemModelCopyWith<StockCountItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountItemModelCopyWith<$Res> {
  factory $StockCountItemModelCopyWith(
    StockCountItemModel value,
    $Res Function(StockCountItemModel) then,
  ) = _$StockCountItemModelCopyWithImpl<$Res, StockCountItemModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? uom,
    @JsonKey(name: 'system_stock') double? systemStock,
    @JsonKey(name: 'counted_qty') double? countedQty,
    @JsonKey(name: 'is_zero_count') bool? isZeroCount,
  });
}

/// @nodoc
class _$StockCountItemModelCopyWithImpl<$Res, $Val extends StockCountItemModel>
    implements $StockCountItemModelCopyWith<$Res> {
  _$StockCountItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? uom = freezed,
    Object? systemStock = freezed,
    Object? countedQty = freezed,
    Object? isZeroCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            productId: freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            uom: freezed == uom
                ? _value.uom
                : uom // ignore: cast_nullable_to_non_nullable
                      as String?,
            systemStock: freezed == systemStock
                ? _value.systemStock
                : systemStock // ignore: cast_nullable_to_non_nullable
                      as double?,
            countedQty: freezed == countedQty
                ? _value.countedQty
                : countedQty // ignore: cast_nullable_to_non_nullable
                      as double?,
            isZeroCount: freezed == isZeroCount
                ? _value.isZeroCount
                : isZeroCount // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StockCountItemModelImplCopyWith<$Res>
    implements $StockCountItemModelCopyWith<$Res> {
  factory _$$StockCountItemModelImplCopyWith(
    _$StockCountItemModelImpl value,
    $Res Function(_$StockCountItemModelImpl) then,
  ) = __$$StockCountItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? uom,
    @JsonKey(name: 'system_stock') double? systemStock,
    @JsonKey(name: 'counted_qty') double? countedQty,
    @JsonKey(name: 'is_zero_count') bool? isZeroCount,
  });
}

/// @nodoc
class __$$StockCountItemModelImplCopyWithImpl<$Res>
    extends _$StockCountItemModelCopyWithImpl<$Res, _$StockCountItemModelImpl>
    implements _$$StockCountItemModelImplCopyWith<$Res> {
  __$$StockCountItemModelImplCopyWithImpl(
    _$StockCountItemModelImpl _value,
    $Res Function(_$StockCountItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? uom = freezed,
    Object? systemStock = freezed,
    Object? countedQty = freezed,
    Object? isZeroCount = freezed,
  }) {
    return _then(
      _$StockCountItemModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        productId: freezed == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        uom: freezed == uom
            ? _value.uom
            : uom // ignore: cast_nullable_to_non_nullable
                  as String?,
        systemStock: freezed == systemStock
            ? _value.systemStock
            : systemStock // ignore: cast_nullable_to_non_nullable
                  as double?,
        countedQty: freezed == countedQty
            ? _value.countedQty
            : countedQty // ignore: cast_nullable_to_non_nullable
                  as double?,
        isZeroCount: freezed == isZeroCount
            ? _value.isZeroCount
            : isZeroCount // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StockCountItemModelImpl implements _StockCountItemModel {
  const _$StockCountItemModelImpl({
    this.id,
    @JsonKey(name: 'product_id') this.productId,
    @JsonKey(name: 'product_name') this.productName,
    this.uom,
    @JsonKey(name: 'system_stock') this.systemStock,
    @JsonKey(name: 'counted_qty') this.countedQty,
    @JsonKey(name: 'is_zero_count') this.isZeroCount,
  });

  factory _$StockCountItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockCountItemModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  final String? uom;
  @override
  @JsonKey(name: 'system_stock')
  final double? systemStock;
  @override
  @JsonKey(name: 'counted_qty')
  final double? countedQty;
  @override
  @JsonKey(name: 'is_zero_count')
  final bool? isZeroCount;

  @override
  String toString() {
    return 'StockCountItemModel(id: $id, productId: $productId, productName: $productName, uom: $uom, systemStock: $systemStock, countedQty: $countedQty, isZeroCount: $isZeroCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockCountItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.systemStock, systemStock) ||
                other.systemStock == systemStock) &&
            (identical(other.countedQty, countedQty) ||
                other.countedQty == countedQty) &&
            (identical(other.isZeroCount, isZeroCount) ||
                other.isZeroCount == isZeroCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    productName,
    uom,
    systemStock,
    countedQty,
    isZeroCount,
  );

  /// Create a copy of StockCountItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockCountItemModelImplCopyWith<_$StockCountItemModelImpl> get copyWith =>
      __$$StockCountItemModelImplCopyWithImpl<_$StockCountItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StockCountItemModelImplToJson(this);
  }
}

abstract class _StockCountItemModel implements StockCountItemModel {
  const factory _StockCountItemModel({
    final int? id,
    @JsonKey(name: 'product_id') final int? productId,
    @JsonKey(name: 'product_name') final String? productName,
    final String? uom,
    @JsonKey(name: 'system_stock') final double? systemStock,
    @JsonKey(name: 'counted_qty') final double? countedQty,
    @JsonKey(name: 'is_zero_count') final bool? isZeroCount,
  }) = _$StockCountItemModelImpl;

  factory _StockCountItemModel.fromJson(Map<String, dynamic> json) =
      _$StockCountItemModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  String? get uom;
  @override
  @JsonKey(name: 'system_stock')
  double? get systemStock;
  @override
  @JsonKey(name: 'counted_qty')
  double? get countedQty;
  @override
  @JsonKey(name: 'is_zero_count')
  bool? get isZeroCount;

  /// Create a copy of StockCountItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockCountItemModelImplCopyWith<_$StockCountItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
