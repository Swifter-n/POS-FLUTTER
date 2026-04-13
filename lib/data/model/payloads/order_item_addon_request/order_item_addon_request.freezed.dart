// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_addon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderItemAddonRequest _$OrderItemAddonRequestFromJson(
  Map<String, dynamic> json,
) {
  return _OrderItemAddonRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderItemAddonRequest {
  @JsonKey(name: 'addon_id')
  int get addonId => throw _privateConstructorUsedError;
  String? get addonName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  /// Serializes this OrderItemAddonRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemAddonRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemAddonRequestCopyWith<OrderItemAddonRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemAddonRequestCopyWith<$Res> {
  factory $OrderItemAddonRequestCopyWith(
    OrderItemAddonRequest value,
    $Res Function(OrderItemAddonRequest) then,
  ) = _$OrderItemAddonRequestCopyWithImpl<$Res, OrderItemAddonRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'addon_id') int addonId,
    String? addonName,
    double quantity,
    double? price,
  });
}

/// @nodoc
class _$OrderItemAddonRequestCopyWithImpl<
  $Res,
  $Val extends OrderItemAddonRequest
>
    implements $OrderItemAddonRequestCopyWith<$Res> {
  _$OrderItemAddonRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemAddonRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonId = null,
    Object? addonName = freezed,
    Object? quantity = null,
    Object? price = freezed,
  }) {
    return _then(
      _value.copyWith(
            addonId: null == addonId
                ? _value.addonId
                : addonId // ignore: cast_nullable_to_non_nullable
                      as int,
            addonName: freezed == addonName
                ? _value.addonName
                : addonName // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemAddonRequestImplCopyWith<$Res>
    implements $OrderItemAddonRequestCopyWith<$Res> {
  factory _$$OrderItemAddonRequestImplCopyWith(
    _$OrderItemAddonRequestImpl value,
    $Res Function(_$OrderItemAddonRequestImpl) then,
  ) = __$$OrderItemAddonRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'addon_id') int addonId,
    String? addonName,
    double quantity,
    double? price,
  });
}

/// @nodoc
class __$$OrderItemAddonRequestImplCopyWithImpl<$Res>
    extends
        _$OrderItemAddonRequestCopyWithImpl<$Res, _$OrderItemAddonRequestImpl>
    implements _$$OrderItemAddonRequestImplCopyWith<$Res> {
  __$$OrderItemAddonRequestImplCopyWithImpl(
    _$OrderItemAddonRequestImpl _value,
    $Res Function(_$OrderItemAddonRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemAddonRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonId = null,
    Object? addonName = freezed,
    Object? quantity = null,
    Object? price = freezed,
  }) {
    return _then(
      _$OrderItemAddonRequestImpl(
        addonId: null == addonId
            ? _value.addonId
            : addonId // ignore: cast_nullable_to_non_nullable
                  as int,
        addonName: freezed == addonName
            ? _value.addonName
            : addonName // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemAddonRequestImpl implements _OrderItemAddonRequest {
  const _$OrderItemAddonRequestImpl({
    @JsonKey(name: 'addon_id') required this.addonId,
    this.addonName,
    required this.quantity,
    this.price,
  });

  factory _$OrderItemAddonRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemAddonRequestImplFromJson(json);

  @override
  @JsonKey(name: 'addon_id')
  final int addonId;
  @override
  final String? addonName;
  @override
  final double quantity;
  @override
  final double? price;

  @override
  String toString() {
    return 'OrderItemAddonRequest(addonId: $addonId, addonName: $addonName, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemAddonRequestImpl &&
            (identical(other.addonId, addonId) || other.addonId == addonId) &&
            (identical(other.addonName, addonName) ||
                other.addonName == addonName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, addonId, addonName, quantity, price);

  /// Create a copy of OrderItemAddonRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemAddonRequestImplCopyWith<_$OrderItemAddonRequestImpl>
  get copyWith =>
      __$$OrderItemAddonRequestImplCopyWithImpl<_$OrderItemAddonRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemAddonRequestImplToJson(this);
  }
}

abstract class _OrderItemAddonRequest implements OrderItemAddonRequest {
  const factory _OrderItemAddonRequest({
    @JsonKey(name: 'addon_id') required final int addonId,
    final String? addonName,
    required final double quantity,
    final double? price,
  }) = _$OrderItemAddonRequestImpl;

  factory _OrderItemAddonRequest.fromJson(Map<String, dynamic> json) =
      _$OrderItemAddonRequestImpl.fromJson;

  @override
  @JsonKey(name: 'addon_id')
  int get addonId;
  @override
  String? get addonName;
  @override
  double get quantity;
  @override
  double? get price;

  /// Create a copy of OrderItemAddonRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemAddonRequestImplCopyWith<_$OrderItemAddonRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
