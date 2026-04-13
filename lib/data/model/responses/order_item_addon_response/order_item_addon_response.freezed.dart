// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_addon_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderItemAddonModel _$OrderItemAddonModelFromJson(Map<String, dynamic> json) {
  return _OrderItemAddonModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemAddonModel {
  @JsonKey(name: 'addon_product_id')
  int get addonProductId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this OrderItemAddonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemAddonModelCopyWith<OrderItemAddonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemAddonModelCopyWith<$Res> {
  factory $OrderItemAddonModelCopyWith(
    OrderItemAddonModel value,
    $Res Function(OrderItemAddonModel) then,
  ) = _$OrderItemAddonModelCopyWithImpl<$Res, OrderItemAddonModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'addon_product_id') int addonProductId,
    String name,
    double quantity,
    double price,
    double total,
  });
}

/// @nodoc
class _$OrderItemAddonModelCopyWithImpl<$Res, $Val extends OrderItemAddonModel>
    implements $OrderItemAddonModelCopyWith<$Res> {
  _$OrderItemAddonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonProductId = null,
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            addonProductId: null == addonProductId
                ? _value.addonProductId
                : addonProductId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemAddonModelImplCopyWith<$Res>
    implements $OrderItemAddonModelCopyWith<$Res> {
  factory _$$OrderItemAddonModelImplCopyWith(
    _$OrderItemAddonModelImpl value,
    $Res Function(_$OrderItemAddonModelImpl) then,
  ) = __$$OrderItemAddonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'addon_product_id') int addonProductId,
    String name,
    double quantity,
    double price,
    double total,
  });
}

/// @nodoc
class __$$OrderItemAddonModelImplCopyWithImpl<$Res>
    extends _$OrderItemAddonModelCopyWithImpl<$Res, _$OrderItemAddonModelImpl>
    implements _$$OrderItemAddonModelImplCopyWith<$Res> {
  __$$OrderItemAddonModelImplCopyWithImpl(
    _$OrderItemAddonModelImpl _value,
    $Res Function(_$OrderItemAddonModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonProductId = null,
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
  }) {
    return _then(
      _$OrderItemAddonModelImpl(
        addonProductId: null == addonProductId
            ? _value.addonProductId
            : addonProductId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemAddonModelImpl implements _OrderItemAddonModel {
  const _$OrderItemAddonModelImpl({
    @JsonKey(name: 'addon_product_id') this.addonProductId = 0,
    this.name = '',
    this.quantity = 0.0,
    this.price = 0.0,
    this.total = 0.0,
  });

  factory _$OrderItemAddonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemAddonModelImplFromJson(json);

  @override
  @JsonKey(name: 'addon_product_id')
  final int addonProductId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double total;

  @override
  String toString() {
    return 'OrderItemAddonModel(addonProductId: $addonProductId, name: $name, quantity: $quantity, price: $price, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemAddonModelImpl &&
            (identical(other.addonProductId, addonProductId) ||
                other.addonProductId == addonProductId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, addonProductId, name, quantity, price, total);

  /// Create a copy of OrderItemAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemAddonModelImplCopyWith<_$OrderItemAddonModelImpl> get copyWith =>
      __$$OrderItemAddonModelImplCopyWithImpl<_$OrderItemAddonModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemAddonModelImplToJson(this);
  }
}

abstract class _OrderItemAddonModel implements OrderItemAddonModel {
  const factory _OrderItemAddonModel({
    @JsonKey(name: 'addon_product_id') final int addonProductId,
    final String name,
    final double quantity,
    final double price,
    final double total,
  }) = _$OrderItemAddonModelImpl;

  factory _OrderItemAddonModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemAddonModelImpl.fromJson;

  @override
  @JsonKey(name: 'addon_product_id')
  int get addonProductId;
  @override
  String get name;
  @override
  double get quantity;
  @override
  double get price;
  @override
  double get total;

  /// Create a copy of OrderItemAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemAddonModelImplCopyWith<_$OrderItemAddonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
