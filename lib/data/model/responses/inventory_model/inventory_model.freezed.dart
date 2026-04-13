// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) {
  return _InventoryModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_stock')
  double? get minimumStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this InventoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryModelCopyWith<InventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryModelCopyWith<$Res> {
  factory $InventoryModelCopyWith(
    InventoryModel value,
    $Res Function(InventoryModel) then,
  ) = _$InventoryModelCopyWithImpl<$Res, InventoryModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? sku,
    double? quantity,
    String? uom,
    @JsonKey(name: 'minimum_stock') double? minimumStock,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  });
}

/// @nodoc
class _$InventoryModelCopyWithImpl<$Res, $Val extends InventoryModel>
    implements $InventoryModelCopyWith<$Res> {
  _$InventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? sku = freezed,
    Object? quantity = freezed,
    Object? uom = freezed,
    Object? minimumStock = freezed,
    Object? lastUpdated = freezed,
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
            sku: freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double?,
            uom: freezed == uom
                ? _value.uom
                : uom // ignore: cast_nullable_to_non_nullable
                      as String?,
            minimumStock: freezed == minimumStock
                ? _value.minimumStock
                : minimumStock // ignore: cast_nullable_to_non_nullable
                      as double?,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InventoryModelImplCopyWith<$Res>
    implements $InventoryModelCopyWith<$Res> {
  factory _$$InventoryModelImplCopyWith(
    _$InventoryModelImpl value,
    $Res Function(_$InventoryModelImpl) then,
  ) = __$$InventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name') String? productName,
    String? sku,
    double? quantity,
    String? uom,
    @JsonKey(name: 'minimum_stock') double? minimumStock,
    @JsonKey(name: 'last_updated') String? lastUpdated,
  });
}

/// @nodoc
class __$$InventoryModelImplCopyWithImpl<$Res>
    extends _$InventoryModelCopyWithImpl<$Res, _$InventoryModelImpl>
    implements _$$InventoryModelImplCopyWith<$Res> {
  __$$InventoryModelImplCopyWithImpl(
    _$InventoryModelImpl _value,
    $Res Function(_$InventoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? sku = freezed,
    Object? quantity = freezed,
    Object? uom = freezed,
    Object? minimumStock = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$InventoryModelImpl(
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
        sku: freezed == sku
            ? _value.sku
            : sku // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double?,
        uom: freezed == uom
            ? _value.uom
            : uom // ignore: cast_nullable_to_non_nullable
                  as String?,
        minimumStock: freezed == minimumStock
            ? _value.minimumStock
            : minimumStock // ignore: cast_nullable_to_non_nullable
                  as double?,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryModelImpl implements _InventoryModel {
  const _$InventoryModelImpl({
    this.id,
    @JsonKey(name: 'product_id') this.productId,
    @JsonKey(name: 'product_name') this.productName,
    this.sku,
    this.quantity,
    this.uom,
    @JsonKey(name: 'minimum_stock') this.minimumStock,
    @JsonKey(name: 'last_updated') this.lastUpdated,
  });

  factory _$InventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  final String? sku;
  @override
  final double? quantity;
  @override
  final String? uom;
  @override
  @JsonKey(name: 'minimum_stock')
  final double? minimumStock;
  @override
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  @override
  String toString() {
    return 'InventoryModel(id: $id, productId: $productId, productName: $productName, sku: $sku, quantity: $quantity, uom: $uom, minimumStock: $minimumStock, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.minimumStock, minimumStock) ||
                other.minimumStock == minimumStock) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    productName,
    sku,
    quantity,
    uom,
    minimumStock,
    lastUpdated,
  );

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      __$$InventoryModelImplCopyWithImpl<_$InventoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryModelImplToJson(this);
  }
}

abstract class _InventoryModel implements InventoryModel {
  const factory _InventoryModel({
    final int? id,
    @JsonKey(name: 'product_id') final int? productId,
    @JsonKey(name: 'product_name') final String? productName,
    final String? sku,
    final double? quantity,
    final String? uom,
    @JsonKey(name: 'minimum_stock') final double? minimumStock,
    @JsonKey(name: 'last_updated') final String? lastUpdated,
  }) = _$InventoryModelImpl;

  factory _InventoryModel.fromJson(Map<String, dynamic> json) =
      _$InventoryModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  String? get sku;
  @override
  double? get quantity;
  @override
  String? get uom;
  @override
  @JsonKey(name: 'minimum_stock')
  double? get minimumStock;
  @override
  @JsonKey(name: 'last_updated')
  String? get lastUpdated;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
