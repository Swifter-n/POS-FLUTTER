// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CartEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddItemImplCopyWith<$Res> {
  factory _$$AddItemImplCopyWith(
    _$AddItemImpl value,
    $Res Function(_$AddItemImpl) then,
  ) = __$$AddItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItemPayload item});

  $CartItemPayloadCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddItemImpl>
    implements _$$AddItemImplCopyWith<$Res> {
  __$$AddItemImplCopyWithImpl(
    _$AddItemImpl _value,
    $Res Function(_$AddItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _$AddItemImpl(
        null == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as CartItemPayload,
      ),
    );
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemPayloadCopyWith<$Res> get item {
    return $CartItemPayloadCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddItemImpl implements _AddItem {
  const _$AddItemImpl(this.item);

  @override
  final CartItemPayload item;

  @override
  String toString() {
    return 'CartEvent.addItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      __$$AddItemImplCopyWithImpl<_$AddItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return addItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return addItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class _AddItem implements CartEvent {
  const factory _AddItem(final CartItemPayload item) = _$AddItemImpl;

  CartItemPayload get item;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemImplCopyWith<$Res> {
  factory _$$RemoveItemImplCopyWith(
    _$RemoveItemImpl value,
    $Res Function(_$RemoveItemImpl) then,
  ) = __$$RemoveItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, String uom});
}

/// @nodoc
class __$$RemoveItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveItemImpl>
    implements _$$RemoveItemImplCopyWith<$Res> {
  __$$RemoveItemImplCopyWithImpl(
    _$RemoveItemImpl _value,
    $Res Function(_$RemoveItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? uom = null}) {
    return _then(
      _$RemoveItemImpl(
        null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == uom
            ? _value.uom
            : uom // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveItemImpl implements _RemoveItem {
  const _$RemoveItemImpl(this.productId, this.uom);

  @override
  final int productId;
  @override
  final String uom;

  @override
  String toString() {
    return 'CartEvent.removeItem(productId: $productId, uom: $uom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.uom, uom) || other.uom == uom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, uom);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      __$$RemoveItemImplCopyWithImpl<_$RemoveItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return removeItem(productId, uom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return removeItem?.call(productId, uom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(productId, uom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class _RemoveItem implements CartEvent {
  const factory _RemoveItem(final int productId, final String uom) =
      _$RemoveItemImpl;

  int get productId;
  String get uom;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(
    _$UpdateQuantityImpl value,
    $Res Function(_$UpdateQuantityImpl) then,
  ) = __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, String uom, double quantity});
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
    _$UpdateQuantityImpl _value,
    $Res Function(_$UpdateQuantityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? uom = null,
    Object? quantity = null,
  }) {
    return _then(
      _$UpdateQuantityImpl(
        null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == uom
            ? _value.uom
            : uom // ignore: cast_nullable_to_non_nullable
                  as String,
        null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements _UpdateQuantity {
  const _$UpdateQuantityImpl(this.productId, this.uom, this.quantity);

  @override
  final int productId;
  @override
  final String uom;
  @override
  final double quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(productId: $productId, uom: $uom, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, uom, quantity);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return updateQuantity(productId, uom, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return updateQuantity?.call(productId, uom, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(productId, uom, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CartEvent {
  const factory _UpdateQuantity(
    final int productId,
    final String uom,
    final double quantity,
  ) = _$UpdateQuantityImpl;

  int get productId;
  String get uom;
  double get quantity;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
    _$ClearCartImpl value,
    $Res Function(_$ClearCartImpl) then,
  ) = __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
    _$ClearCartImpl _value,
    $Res Function(_$ClearCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$CheckoutImplCopyWith<$Res> {
  factory _$$CheckoutImplCopyWith(
    _$CheckoutImpl value,
    $Res Function(_$CheckoutImpl) then,
  ) = __$$CheckoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuickCheckoutPayload payload});

  $QuickCheckoutPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$CheckoutImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CheckoutImpl>
    implements _$$CheckoutImplCopyWith<$Res> {
  __$$CheckoutImplCopyWithImpl(
    _$CheckoutImpl _value,
    $Res Function(_$CheckoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$CheckoutImpl(
        null == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as QuickCheckoutPayload,
      ),
    );
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuickCheckoutPayloadCopyWith<$Res> get payload {
    return $QuickCheckoutPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc

class _$CheckoutImpl implements _Checkout {
  const _$CheckoutImpl(this.payload);

  @override
  final QuickCheckoutPayload payload;

  @override
  String toString() {
    return 'CartEvent.checkout(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutImplCopyWith<_$CheckoutImpl> get copyWith =>
      __$$CheckoutImplCopyWithImpl<_$CheckoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return checkout(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return checkout?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (checkout != null) {
      return checkout(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return checkout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return checkout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (checkout != null) {
      return checkout(this);
    }
    return orElse();
  }
}

abstract class _Checkout implements CartEvent {
  const factory _Checkout(final QuickCheckoutPayload payload) = _$CheckoutImpl;

  QuickCheckoutPayload get payload;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutImplCopyWith<_$CheckoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IgnorePromoImplCopyWith<$Res> {
  factory _$$IgnorePromoImplCopyWith(
    _$IgnorePromoImpl value,
    $Res Function(_$IgnorePromoImpl) then,
  ) = __$$IgnorePromoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ruleName});
}

/// @nodoc
class __$$IgnorePromoImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$IgnorePromoImpl>
    implements _$$IgnorePromoImplCopyWith<$Res> {
  __$$IgnorePromoImplCopyWithImpl(
    _$IgnorePromoImpl _value,
    $Res Function(_$IgnorePromoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ruleName = null}) {
    return _then(
      _$IgnorePromoImpl(
        null == ruleName
            ? _value.ruleName
            : ruleName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$IgnorePromoImpl implements _IgnorePromo {
  const _$IgnorePromoImpl(this.ruleName);

  @override
  final String ruleName;

  @override
  String toString() {
    return 'CartEvent.ignorePromo(ruleName: $ruleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IgnorePromoImpl &&
            (identical(other.ruleName, ruleName) ||
                other.ruleName == ruleName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ruleName);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IgnorePromoImplCopyWith<_$IgnorePromoImpl> get copyWith =>
      __$$IgnorePromoImplCopyWithImpl<_$IgnorePromoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(CartItemPayload item) addItem,
    required TResult Function(int productId, String uom) removeItem,
    required TResult Function(int productId, String uom, double quantity)
    updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(QuickCheckoutPayload payload) checkout,
    required TResult Function(String ruleName) ignorePromo,
  }) {
    return ignorePromo(ruleName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(CartItemPayload item)? addItem,
    TResult? Function(int productId, String uom)? removeItem,
    TResult? Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(QuickCheckoutPayload payload)? checkout,
    TResult? Function(String ruleName)? ignorePromo,
  }) {
    return ignorePromo?.call(ruleName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(CartItemPayload item)? addItem,
    TResult Function(int productId, String uom)? removeItem,
    TResult Function(int productId, String uom, double quantity)?
    updateQuantity,
    TResult Function()? clearCart,
    TResult Function(QuickCheckoutPayload payload)? checkout,
    TResult Function(String ruleName)? ignorePromo,
    required TResult orElse(),
  }) {
    if (ignorePromo != null) {
      return ignorePromo(ruleName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_Checkout value) checkout,
    required TResult Function(_IgnorePromo value) ignorePromo,
  }) {
    return ignorePromo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_Checkout value)? checkout,
    TResult? Function(_IgnorePromo value)? ignorePromo,
  }) {
    return ignorePromo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_Checkout value)? checkout,
    TResult Function(_IgnorePromo value)? ignorePromo,
    required TResult orElse(),
  }) {
    if (ignorePromo != null) {
      return ignorePromo(this);
    }
    return orElse();
  }
}

abstract class _IgnorePromo implements CartEvent {
  const factory _IgnorePromo(final String ruleName) = _$IgnorePromoImpl;

  String get ruleName;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IgnorePromoImplCopyWith<_$IgnorePromoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CartState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<CartItemPayload> items,
    double subtotal,
    double discount,
    double tax,
    List<String> appliedPromos,
    List<String> ignoredRules,
  });
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? tax = null,
    Object? appliedPromos = null,
    Object? ignoredRules = null,
  }) {
    return _then(
      _$LoadedImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItemPayload>,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        tax: null == tax
            ? _value.tax
            : tax // ignore: cast_nullable_to_non_nullable
                  as double,
        appliedPromos: null == appliedPromos
            ? _value._appliedPromos
            : appliedPromos // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        ignoredRules: null == ignoredRules
            ? _value._ignoredRules
            : ignoredRules // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    final List<CartItemPayload> items = const [],
    this.subtotal = 0,
    this.discount = 0,
    this.tax = 0,
    final List<String> appliedPromos = const [],
    final List<String> ignoredRules = const [],
  }) : _items = items,
       _appliedPromos = appliedPromos,
       _ignoredRules = ignoredRules;

  final List<CartItemPayload> _items;
  @override
  @JsonKey()
  List<CartItemPayload> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double tax;
  final List<String> _appliedPromos;
  @override
  @JsonKey()
  List<String> get appliedPromos {
    if (_appliedPromos is EqualUnmodifiableListView) return _appliedPromos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appliedPromos);
  }

  final List<String> _ignoredRules;
  @override
  @JsonKey()
  List<String> get ignoredRules {
    if (_ignoredRules is EqualUnmodifiableListView) return _ignoredRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ignoredRules);
  }

  @override
  String toString() {
    return 'CartState.loaded(items: $items, subtotal: $subtotal, discount: $discount, tax: $tax, appliedPromos: $appliedPromos, ignoredRules: $ignoredRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            const DeepCollectionEquality().equals(
              other._appliedPromos,
              _appliedPromos,
            ) &&
            const DeepCollectionEquality().equals(
              other._ignoredRules,
              _ignoredRules,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    subtotal,
    discount,
    tax,
    const DeepCollectionEquality().hash(_appliedPromos),
    const DeepCollectionEquality().hash(_ignoredRules),
  );

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) {
    return loaded(items, subtotal, discount, tax, appliedPromos, ignoredRules);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
      items,
      subtotal,
      discount,
      tax,
      appliedPromos,
      ignoredRules,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        items,
        subtotal,
        discount,
        tax,
        appliedPromos,
        ignoredRules,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CartState {
  const factory _Loaded({
    final List<CartItemPayload> items,
    final double subtotal,
    final double discount,
    final double tax,
    final List<String> appliedPromos,
    final List<String> ignoredRules,
  }) = _$LoadedImpl;

  List<CartItemPayload> get items;
  double get subtotal;
  double get discount;
  double get tax;
  List<String> get appliedPromos;
  List<String> get ignoredRules;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutSuccessImplCopyWith<$Res> {
  factory _$$CheckoutSuccessImplCopyWith(
    _$CheckoutSuccessImpl value,
    $Res Function(_$CheckoutSuccessImpl) then,
  ) = __$$CheckoutSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order});

  $OrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$CheckoutSuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CheckoutSuccessImpl>
    implements _$$CheckoutSuccessImplCopyWith<$Res> {
  __$$CheckoutSuccessImplCopyWithImpl(
    _$CheckoutSuccessImpl _value,
    $Res Function(_$CheckoutSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? order = null}) {
    return _then(
      _$CheckoutSuccessImpl(
        null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as OrderModel,
      ),
    );
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get order {
    return $OrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$CheckoutSuccessImpl implements _CheckoutSuccess {
  const _$CheckoutSuccessImpl(this.order);

  @override
  final OrderModel order;

  @override
  String toString() {
    return 'CartState.checkoutSuccess(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutSuccessImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutSuccessImplCopyWith<_$CheckoutSuccessImpl> get copyWith =>
      __$$CheckoutSuccessImplCopyWithImpl<_$CheckoutSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) {
    return checkoutSuccess(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) {
    return checkoutSuccess?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (checkoutSuccess != null) {
      return checkoutSuccess(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) {
    return checkoutSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return checkoutSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checkoutSuccess != null) {
      return checkoutSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckoutSuccess implements CartState {
  const factory _CheckoutSuccess(final OrderModel order) =
      _$CheckoutSuccessImpl;

  OrderModel get order;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutSuccessImplCopyWith<_$CheckoutSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )
    loaded,
    required TResult Function(OrderModel order) checkoutSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult? Function(OrderModel order)? checkoutSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<CartItemPayload> items,
      double subtotal,
      double discount,
      double tax,
      List<String> appliedPromos,
      List<String> ignoredRules,
    )?
    loaded,
    TResult Function(OrderModel order)? checkoutSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_CheckoutSuccess value) checkoutSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_CheckoutSuccess value)? checkoutSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CartState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
