// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartItemPayload _$CartItemPayloadFromJson(Map<String, dynamic> json) {
  return _CartItemPayload.fromJson(json);
}

/// @nodoc
mixin _$CartItemPayload {
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get uom => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<OrderItemAddonRequest> get addons => throw _privateConstructorUsedError;

  /// Serializes this CartItemPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemPayloadCopyWith<CartItemPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemPayloadCopyWith<$Res> {
  factory $CartItemPayloadCopyWith(
    CartItemPayload value,
    $Res Function(CartItemPayload) then,
  ) = _$CartItemPayloadCopyWithImpl<$Res, CartItemPayload>;
  @useResult
  $Res call({
    @JsonKey(name: 'product_id') int productId,
    String? productName,
    double quantity,
    String uom,
    double price,
    String? note,
    List<OrderItemAddonRequest> addons,
  });
}

/// @nodoc
class _$CartItemPayloadCopyWithImpl<$Res, $Val extends CartItemPayload>
    implements $CartItemPayloadCopyWith<$Res> {
  _$CartItemPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = freezed,
    Object? quantity = null,
    Object? uom = null,
    Object? price = null,
    Object? note = freezed,
    Object? addons = null,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            uom: null == uom
                ? _value.uom
                : uom // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            addons: null == addons
                ? _value.addons
                : addons // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemAddonRequest>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemPayloadImplCopyWith<$Res>
    implements $CartItemPayloadCopyWith<$Res> {
  factory _$$CartItemPayloadImplCopyWith(
    _$CartItemPayloadImpl value,
    $Res Function(_$CartItemPayloadImpl) then,
  ) = __$$CartItemPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'product_id') int productId,
    String? productName,
    double quantity,
    String uom,
    double price,
    String? note,
    List<OrderItemAddonRequest> addons,
  });
}

/// @nodoc
class __$$CartItemPayloadImplCopyWithImpl<$Res>
    extends _$CartItemPayloadCopyWithImpl<$Res, _$CartItemPayloadImpl>
    implements _$$CartItemPayloadImplCopyWith<$Res> {
  __$$CartItemPayloadImplCopyWithImpl(
    _$CartItemPayloadImpl _value,
    $Res Function(_$CartItemPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = freezed,
    Object? quantity = null,
    Object? uom = null,
    Object? price = null,
    Object? note = freezed,
    Object? addons = null,
  }) {
    return _then(
      _$CartItemPayloadImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        uom: null == uom
            ? _value.uom
            : uom // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        addons: null == addons
            ? _value._addons
            : addons // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemAddonRequest>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemPayloadImpl implements _CartItemPayload {
  const _$CartItemPayloadImpl({
    @JsonKey(name: 'product_id') required this.productId,
    this.productName,
    required this.quantity,
    required this.uom,
    required this.price,
    this.note,
    final List<OrderItemAddonRequest> addons = const [],
  }) : _addons = addons;

  factory _$CartItemPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  final String? productName;
  @override
  final double quantity;
  @override
  final String uom;
  @override
  final double price;
  @override
  final String? note;
  final List<OrderItemAddonRequest> _addons;
  @override
  @JsonKey()
  List<OrderItemAddonRequest> get addons {
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addons);
  }

  @override
  String toString() {
    return 'CartItemPayload(productId: $productId, productName: $productName, quantity: $quantity, uom: $uom, price: $price, note: $note, addons: $addons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemPayloadImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._addons, _addons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    productName,
    quantity,
    uom,
    price,
    note,
    const DeepCollectionEquality().hash(_addons),
  );

  /// Create a copy of CartItemPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemPayloadImplCopyWith<_$CartItemPayloadImpl> get copyWith =>
      __$$CartItemPayloadImplCopyWithImpl<_$CartItemPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemPayloadImplToJson(this);
  }
}

abstract class _CartItemPayload implements CartItemPayload {
  const factory _CartItemPayload({
    @JsonKey(name: 'product_id') required final int productId,
    final String? productName,
    required final double quantity,
    required final String uom,
    required final double price,
    final String? note,
    final List<OrderItemAddonRequest> addons,
  }) = _$CartItemPayloadImpl;

  factory _CartItemPayload.fromJson(Map<String, dynamic> json) =
      _$CartItemPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  String? get productName;
  @override
  double get quantity;
  @override
  String get uom;
  @override
  double get price;
  @override
  String? get note;
  @override
  List<OrderItemAddonRequest> get addons;

  /// Create a copy of CartItemPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemPayloadImplCopyWith<_$CartItemPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
