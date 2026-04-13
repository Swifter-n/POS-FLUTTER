// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_bill_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OpenBillEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenBillEventCopyWith<$Res> {
  factory $OpenBillEventCopyWith(
    OpenBillEvent value,
    $Res Function(OpenBillEvent) then,
  ) = _$OpenBillEventCopyWithImpl<$Res, OpenBillEvent>;
}

/// @nodoc
class _$OpenBillEventCopyWithImpl<$Res, $Val extends OpenBillEvent>
    implements $OpenBillEventCopyWith<$Res> {
  _$OpenBillEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchOpenBillsImplCopyWith<$Res> {
  factory _$$FetchOpenBillsImplCopyWith(
    _$FetchOpenBillsImpl value,
    $Res Function(_$FetchOpenBillsImpl) then,
  ) = __$$FetchOpenBillsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOpenBillsImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$FetchOpenBillsImpl>
    implements _$$FetchOpenBillsImplCopyWith<$Res> {
  __$$FetchOpenBillsImplCopyWithImpl(
    _$FetchOpenBillsImpl _value,
    $Res Function(_$FetchOpenBillsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOpenBillsImpl implements _FetchOpenBills {
  const _$FetchOpenBillsImpl();

  @override
  String toString() {
    return 'OpenBillEvent.fetchOpenBills()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOpenBillsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return fetchOpenBills();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return fetchOpenBills?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (fetchOpenBills != null) {
      return fetchOpenBills();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return fetchOpenBills(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return fetchOpenBills?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (fetchOpenBills != null) {
      return fetchOpenBills(this);
    }
    return orElse();
  }
}

abstract class _FetchOpenBills implements OpenBillEvent {
  const factory _FetchOpenBills() = _$FetchOpenBillsImpl;
}

/// @nodoc
abstract class _$$CreateOpenBillImplCopyWith<$Res> {
  factory _$$CreateOpenBillImplCopyWith(
    _$CreateOpenBillImpl value,
    $Res Function(_$CreateOpenBillImpl) then,
  ) = __$$CreateOpenBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OpenBillPayload payload});

  $OpenBillPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$CreateOpenBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$CreateOpenBillImpl>
    implements _$$CreateOpenBillImplCopyWith<$Res> {
  __$$CreateOpenBillImplCopyWithImpl(
    _$CreateOpenBillImpl _value,
    $Res Function(_$CreateOpenBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$CreateOpenBillImpl(
        null == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as OpenBillPayload,
      ),
    );
  }

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenBillPayloadCopyWith<$Res> get payload {
    return $OpenBillPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc

class _$CreateOpenBillImpl implements _CreateOpenBill {
  const _$CreateOpenBillImpl(this.payload);

  @override
  final OpenBillPayload payload;

  @override
  String toString() {
    return 'OpenBillEvent.createOpenBill(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOpenBillImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOpenBillImplCopyWith<_$CreateOpenBillImpl> get copyWith =>
      __$$CreateOpenBillImplCopyWithImpl<_$CreateOpenBillImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return createOpenBill(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return createOpenBill?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (createOpenBill != null) {
      return createOpenBill(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return createOpenBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return createOpenBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (createOpenBill != null) {
      return createOpenBill(this);
    }
    return orElse();
  }
}

abstract class _CreateOpenBill implements OpenBillEvent {
  const factory _CreateOpenBill(final OpenBillPayload payload) =
      _$CreateOpenBillImpl;

  OpenBillPayload get payload;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOpenBillImplCopyWith<_$CreateOpenBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemToBillImplCopyWith<$Res> {
  factory _$$AddItemToBillImplCopyWith(
    _$AddItemToBillImpl value,
    $Res Function(_$AddItemToBillImpl) then,
  ) = __$$AddItemToBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, CartItemPayload item});

  $CartItemPayloadCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemToBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$AddItemToBillImpl>
    implements _$$AddItemToBillImplCopyWith<$Res> {
  __$$AddItemToBillImplCopyWithImpl(
    _$AddItemToBillImpl _value,
    $Res Function(_$AddItemToBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? item = null}) {
    return _then(
      _$AddItemToBillImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as CartItemPayload,
      ),
    );
  }

  /// Create a copy of OpenBillEvent
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

class _$AddItemToBillImpl implements _AddItemToBill {
  const _$AddItemToBillImpl(this.orderId, this.item);

  @override
  final int orderId;
  @override
  final CartItemPayload item;

  @override
  String toString() {
    return 'OpenBillEvent.addItemToBill(orderId: $orderId, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemToBillImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, item);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemToBillImplCopyWith<_$AddItemToBillImpl> get copyWith =>
      __$$AddItemToBillImplCopyWithImpl<_$AddItemToBillImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return addItemToBill(orderId, item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return addItemToBill?.call(orderId, item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (addItemToBill != null) {
      return addItemToBill(orderId, item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return addItemToBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return addItemToBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (addItemToBill != null) {
      return addItemToBill(this);
    }
    return orElse();
  }
}

abstract class _AddItemToBill implements OpenBillEvent {
  const factory _AddItemToBill(final int orderId, final CartItemPayload item) =
      _$AddItemToBillImpl;

  int get orderId;
  CartItemPayload get item;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemToBillImplCopyWith<_$AddItemToBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemsToBillImplCopyWith<$Res> {
  factory _$$AddItemsToBillImplCopyWith(
    _$AddItemsToBillImpl value,
    $Res Function(_$AddItemsToBillImpl) then,
  ) = __$$AddItemsToBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, List<CartItemPayload> items});
}

/// @nodoc
class __$$AddItemsToBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$AddItemsToBillImpl>
    implements _$$AddItemsToBillImplCopyWith<$Res> {
  __$$AddItemsToBillImplCopyWithImpl(
    _$AddItemsToBillImpl _value,
    $Res Function(_$AddItemsToBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? items = null}) {
    return _then(
      _$AddItemsToBillImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItemPayload>,
      ),
    );
  }
}

/// @nodoc

class _$AddItemsToBillImpl implements _AddItemsToBill {
  const _$AddItemsToBillImpl(this.orderId, final List<CartItemPayload> items)
    : _items = items;

  @override
  final int orderId;
  final List<CartItemPayload> _items;
  @override
  List<CartItemPayload> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OpenBillEvent.addItemsToBill(orderId: $orderId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemsToBillImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemsToBillImplCopyWith<_$AddItemsToBillImpl> get copyWith =>
      __$$AddItemsToBillImplCopyWithImpl<_$AddItemsToBillImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return addItemsToBill(orderId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return addItemsToBill?.call(orderId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (addItemsToBill != null) {
      return addItemsToBill(orderId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return addItemsToBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return addItemsToBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (addItemsToBill != null) {
      return addItemsToBill(this);
    }
    return orElse();
  }
}

abstract class _AddItemsToBill implements OpenBillEvent {
  const factory _AddItemsToBill(
    final int orderId,
    final List<CartItemPayload> items,
  ) = _$AddItemsToBillImpl;

  int get orderId;
  List<CartItemPayload> get items;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemsToBillImplCopyWith<_$AddItemsToBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemFromBillImplCopyWith<$Res> {
  factory _$$RemoveItemFromBillImplCopyWith(
    _$RemoveItemFromBillImpl value,
    $Res Function(_$RemoveItemFromBillImpl) then,
  ) = __$$RemoveItemFromBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, int itemId});
}

/// @nodoc
class __$$RemoveItemFromBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$RemoveItemFromBillImpl>
    implements _$$RemoveItemFromBillImplCopyWith<$Res> {
  __$$RemoveItemFromBillImplCopyWithImpl(
    _$RemoveItemFromBillImpl _value,
    $Res Function(_$RemoveItemFromBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? itemId = null}) {
    return _then(
      _$RemoveItemFromBillImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoveItemFromBillImpl implements _RemoveItemFromBill {
  const _$RemoveItemFromBillImpl(this.orderId, this.itemId);

  @override
  final int orderId;
  @override
  final int itemId;

  @override
  String toString() {
    return 'OpenBillEvent.removeItemFromBill(orderId: $orderId, itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemFromBillImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, itemId);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemFromBillImplCopyWith<_$RemoveItemFromBillImpl> get copyWith =>
      __$$RemoveItemFromBillImplCopyWithImpl<_$RemoveItemFromBillImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return removeItemFromBill(orderId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return removeItemFromBill?.call(orderId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (removeItemFromBill != null) {
      return removeItemFromBill(orderId, itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return removeItemFromBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return removeItemFromBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (removeItemFromBill != null) {
      return removeItemFromBill(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemFromBill implements OpenBillEvent {
  const factory _RemoveItemFromBill(final int orderId, final int itemId) =
      _$RemoveItemFromBillImpl;

  int get orderId;
  int get itemId;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemFromBillImplCopyWith<_$RemoveItemFromBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayBillImplCopyWith<$Res> {
  factory _$$PayBillImplCopyWith(
    _$PayBillImpl value,
    $Res Function(_$PayBillImpl) then,
  ) = __$$PayBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, Map<String, dynamic> paymentData});
}

/// @nodoc
class __$$PayBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$PayBillImpl>
    implements _$$PayBillImplCopyWith<$Res> {
  __$$PayBillImplCopyWithImpl(
    _$PayBillImpl _value,
    $Res Function(_$PayBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? paymentData = null}) {
    return _then(
      _$PayBillImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == paymentData
            ? _value._paymentData
            : paymentData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$PayBillImpl implements _PayBill {
  const _$PayBillImpl(this.orderId, final Map<String, dynamic> paymentData)
    : _paymentData = paymentData;

  @override
  final int orderId;
  final Map<String, dynamic> _paymentData;
  @override
  Map<String, dynamic> get paymentData {
    if (_paymentData is EqualUnmodifiableMapView) return _paymentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_paymentData);
  }

  @override
  String toString() {
    return 'OpenBillEvent.payBill(orderId: $orderId, paymentData: $paymentData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayBillImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality().equals(
              other._paymentData,
              _paymentData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    const DeepCollectionEquality().hash(_paymentData),
  );

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayBillImplCopyWith<_$PayBillImpl> get copyWith =>
      __$$PayBillImplCopyWithImpl<_$PayBillImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return payBill(orderId, paymentData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return payBill?.call(orderId, paymentData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (payBill != null) {
      return payBill(orderId, paymentData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return payBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return payBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (payBill != null) {
      return payBill(this);
    }
    return orElse();
  }
}

abstract class _PayBill implements OpenBillEvent {
  const factory _PayBill(
    final int orderId,
    final Map<String, dynamic> paymentData,
  ) = _$PayBillImpl;

  int get orderId;
  Map<String, dynamic> get paymentData;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayBillImplCopyWith<_$PayBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelBillImplCopyWith<$Res> {
  factory _$$CancelBillImplCopyWith(
    _$CancelBillImpl value,
    $Res Function(_$CancelBillImpl) then,
  ) = __$$CancelBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId});
}

/// @nodoc
class __$$CancelBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$CancelBillImpl>
    implements _$$CancelBillImplCopyWith<$Res> {
  __$$CancelBillImplCopyWithImpl(
    _$CancelBillImpl _value,
    $Res Function(_$CancelBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$CancelBillImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CancelBillImpl implements _CancelBill {
  const _$CancelBillImpl(this.orderId);

  @override
  final int orderId;

  @override
  String toString() {
    return 'OpenBillEvent.cancelBill(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelBillImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelBillImplCopyWith<_$CancelBillImpl> get copyWith =>
      __$$CancelBillImplCopyWithImpl<_$CancelBillImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return cancelBill(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return cancelBill?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (cancelBill != null) {
      return cancelBill(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return cancelBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return cancelBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (cancelBill != null) {
      return cancelBill(this);
    }
    return orElse();
  }
}

abstract class _CancelBill implements OpenBillEvent {
  const factory _CancelBill(final int orderId) = _$CancelBillImpl;

  int get orderId;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelBillImplCopyWith<_$CancelBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectBillImplCopyWith<$Res> {
  factory _$$SelectBillImplCopyWith(
    _$SelectBillImpl value,
    $Res Function(_$SelectBillImpl) then,
  ) = __$$SelectBillImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel bill});

  $OrderModelCopyWith<$Res> get bill;
}

/// @nodoc
class __$$SelectBillImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$SelectBillImpl>
    implements _$$SelectBillImplCopyWith<$Res> {
  __$$SelectBillImplCopyWithImpl(
    _$SelectBillImpl _value,
    $Res Function(_$SelectBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bill = null}) {
    return _then(
      _$SelectBillImpl(
        null == bill
            ? _value.bill
            : bill // ignore: cast_nullable_to_non_nullable
                  as OrderModel,
      ),
    );
  }

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get bill {
    return $OrderModelCopyWith<$Res>(_value.bill, (value) {
      return _then(_value.copyWith(bill: value));
    });
  }
}

/// @nodoc

class _$SelectBillImpl implements _SelectBill {
  const _$SelectBillImpl(this.bill);

  @override
  final OrderModel bill;

  @override
  String toString() {
    return 'OpenBillEvent.selectBill(bill: $bill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectBillImpl &&
            (identical(other.bill, bill) || other.bill == bill));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bill);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectBillImplCopyWith<_$SelectBillImpl> get copyWith =>
      __$$SelectBillImplCopyWithImpl<_$SelectBillImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return selectBill(bill);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return selectBill?.call(bill);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (selectBill != null) {
      return selectBill(bill);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return selectBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return selectBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (selectBill != null) {
      return selectBill(this);
    }
    return orElse();
  }
}

abstract class _SelectBill implements OpenBillEvent {
  const factory _SelectBill(final OrderModel bill) = _$SelectBillImpl;

  OrderModel get bill;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectBillImplCopyWith<_$SelectBillImpl> get copyWith =>
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
    extends _$OpenBillEventCopyWithImpl<$Res, _$IgnorePromoImpl>
    implements _$$IgnorePromoImplCopyWith<$Res> {
  __$$IgnorePromoImplCopyWithImpl(
    _$IgnorePromoImpl _value,
    $Res Function(_$IgnorePromoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
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
    return 'OpenBillEvent.ignorePromo(ruleName: $ruleName)';
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

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IgnorePromoImplCopyWith<_$IgnorePromoImpl> get copyWith =>
      __$$IgnorePromoImplCopyWithImpl<_$IgnorePromoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return ignorePromo(ruleName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return ignorePromo?.call(ruleName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
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
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return ignorePromo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return ignorePromo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (ignorePromo != null) {
      return ignorePromo(this);
    }
    return orElse();
  }
}

abstract class _IgnorePromo implements OpenBillEvent {
  const factory _IgnorePromo(final String ruleName) = _$IgnorePromoImpl;

  String get ruleName;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IgnorePromoImplCopyWith<_$IgnorePromoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetIgnoredImplCopyWith<$Res> {
  factory _$$ResetIgnoredImplCopyWith(
    _$ResetIgnoredImpl value,
    $Res Function(_$ResetIgnoredImpl) then,
  ) = __$$ResetIgnoredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetIgnoredImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$ResetIgnoredImpl>
    implements _$$ResetIgnoredImplCopyWith<$Res> {
  __$$ResetIgnoredImplCopyWithImpl(
    _$ResetIgnoredImpl _value,
    $Res Function(_$ResetIgnoredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetIgnoredImpl implements _ResetIgnored {
  const _$ResetIgnoredImpl();

  @override
  String toString() {
    return 'OpenBillEvent.resetIgnored()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetIgnoredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return resetIgnored();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return resetIgnored?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (resetIgnored != null) {
      return resetIgnored();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return resetIgnored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return resetIgnored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (resetIgnored != null) {
      return resetIgnored(this);
    }
    return orElse();
  }
}

abstract class _ResetIgnored implements OpenBillEvent {
  const factory _ResetIgnored() = _$ResetIgnoredImpl;
}

/// @nodoc
abstract class _$$ToggleUsePointsImplCopyWith<$Res> {
  factory _$$ToggleUsePointsImplCopyWith(
    _$ToggleUsePointsImpl value,
    $Res Function(_$ToggleUsePointsImpl) then,
  ) = __$$ToggleUsePointsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool use});
}

/// @nodoc
class __$$ToggleUsePointsImplCopyWithImpl<$Res>
    extends _$OpenBillEventCopyWithImpl<$Res, _$ToggleUsePointsImpl>
    implements _$$ToggleUsePointsImplCopyWith<$Res> {
  __$$ToggleUsePointsImplCopyWithImpl(
    _$ToggleUsePointsImpl _value,
    $Res Function(_$ToggleUsePointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? use = null}) {
    return _then(
      _$ToggleUsePointsImpl(
        null == use
            ? _value.use
            : use // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ToggleUsePointsImpl implements _ToggleUsePoints {
  const _$ToggleUsePointsImpl(this.use);

  @override
  final bool use;

  @override
  String toString() {
    return 'OpenBillEvent.toggleUsePoints(use: $use)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleUsePointsImpl &&
            (identical(other.use, use) || other.use == use));
  }

  @override
  int get hashCode => Object.hash(runtimeType, use);

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleUsePointsImplCopyWith<_$ToggleUsePointsImpl> get copyWith =>
      __$$ToggleUsePointsImplCopyWithImpl<_$ToggleUsePointsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOpenBills,
    required TResult Function(OpenBillPayload payload) createOpenBill,
    required TResult Function(int orderId, CartItemPayload item) addItemToBill,
    required TResult Function(int orderId, List<CartItemPayload> items)
    addItemsToBill,
    required TResult Function(int orderId, int itemId) removeItemFromBill,
    required TResult Function(int orderId, Map<String, dynamic> paymentData)
    payBill,
    required TResult Function(int orderId) cancelBill,
    required TResult Function(OrderModel bill) selectBill,
    required TResult Function(String ruleName) ignorePromo,
    required TResult Function() resetIgnored,
    required TResult Function(bool use) toggleUsePoints,
  }) {
    return toggleUsePoints(use);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchOpenBills,
    TResult? Function(OpenBillPayload payload)? createOpenBill,
    TResult? Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult? Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult? Function(int orderId, int itemId)? removeItemFromBill,
    TResult? Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult? Function(int orderId)? cancelBill,
    TResult? Function(OrderModel bill)? selectBill,
    TResult? Function(String ruleName)? ignorePromo,
    TResult? Function()? resetIgnored,
    TResult? Function(bool use)? toggleUsePoints,
  }) {
    return toggleUsePoints?.call(use);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOpenBills,
    TResult Function(OpenBillPayload payload)? createOpenBill,
    TResult Function(int orderId, CartItemPayload item)? addItemToBill,
    TResult Function(int orderId, List<CartItemPayload> items)? addItemsToBill,
    TResult Function(int orderId, int itemId)? removeItemFromBill,
    TResult Function(int orderId, Map<String, dynamic> paymentData)? payBill,
    TResult Function(int orderId)? cancelBill,
    TResult Function(OrderModel bill)? selectBill,
    TResult Function(String ruleName)? ignorePromo,
    TResult Function()? resetIgnored,
    TResult Function(bool use)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (toggleUsePoints != null) {
      return toggleUsePoints(use);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOpenBills value) fetchOpenBills,
    required TResult Function(_CreateOpenBill value) createOpenBill,
    required TResult Function(_AddItemToBill value) addItemToBill,
    required TResult Function(_AddItemsToBill value) addItemsToBill,
    required TResult Function(_RemoveItemFromBill value) removeItemFromBill,
    required TResult Function(_PayBill value) payBill,
    required TResult Function(_CancelBill value) cancelBill,
    required TResult Function(_SelectBill value) selectBill,
    required TResult Function(_IgnorePromo value) ignorePromo,
    required TResult Function(_ResetIgnored value) resetIgnored,
    required TResult Function(_ToggleUsePoints value) toggleUsePoints,
  }) {
    return toggleUsePoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchOpenBills value)? fetchOpenBills,
    TResult? Function(_CreateOpenBill value)? createOpenBill,
    TResult? Function(_AddItemToBill value)? addItemToBill,
    TResult? Function(_AddItemsToBill value)? addItemsToBill,
    TResult? Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult? Function(_PayBill value)? payBill,
    TResult? Function(_CancelBill value)? cancelBill,
    TResult? Function(_SelectBill value)? selectBill,
    TResult? Function(_IgnorePromo value)? ignorePromo,
    TResult? Function(_ResetIgnored value)? resetIgnored,
    TResult? Function(_ToggleUsePoints value)? toggleUsePoints,
  }) {
    return toggleUsePoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOpenBills value)? fetchOpenBills,
    TResult Function(_CreateOpenBill value)? createOpenBill,
    TResult Function(_AddItemToBill value)? addItemToBill,
    TResult Function(_AddItemsToBill value)? addItemsToBill,
    TResult Function(_RemoveItemFromBill value)? removeItemFromBill,
    TResult Function(_PayBill value)? payBill,
    TResult Function(_CancelBill value)? cancelBill,
    TResult Function(_SelectBill value)? selectBill,
    TResult Function(_IgnorePromo value)? ignorePromo,
    TResult Function(_ResetIgnored value)? resetIgnored,
    TResult Function(_ToggleUsePoints value)? toggleUsePoints,
    required TResult orElse(),
  }) {
    if (toggleUsePoints != null) {
      return toggleUsePoints(this);
    }
    return orElse();
  }
}

abstract class _ToggleUsePoints implements OpenBillEvent {
  const factory _ToggleUsePoints(final bool use) = _$ToggleUsePointsImpl;

  bool get use;

  /// Create a copy of OpenBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleUsePointsImplCopyWith<_$ToggleUsePointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpenBillState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenBillStateCopyWith<$Res> {
  factory $OpenBillStateCopyWith(
    OpenBillState value,
    $Res Function(OpenBillState) then,
  ) = _$OpenBillStateCopyWithImpl<$Res, OpenBillState>;
}

/// @nodoc
class _$OpenBillStateCopyWithImpl<$Res, $Val extends OpenBillState>
    implements $OpenBillStateCopyWith<$Res> {
  _$OpenBillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenBillState
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
    extends _$OpenBillStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OpenBillState.initial()';
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OpenBillState {
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
    extends _$OpenBillStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OpenBillState.loading()';
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OpenBillState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$OpenBillStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OpenBillState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements OpenBillState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$OpenBillStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillState
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
    return 'OpenBillState.error(message: $message)';
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

  /// Create a copy of OpenBillState
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OpenBillState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<OrderModel> orders,
    OrderModel? selectedOrder,
    bool usePoints,
    List<String> ignoredRules,
  });

  $OrderModelCopyWith<$Res>? get selectedOrder;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$OpenBillStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? selectedOrder = freezed,
    Object? usePoints = null,
    Object? ignoredRules = null,
  }) {
    return _then(
      _$LoadedImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderModel>,
        selectedOrder: freezed == selectedOrder
            ? _value.selectedOrder
            : selectedOrder // ignore: cast_nullable_to_non_nullable
                  as OrderModel?,
        usePoints: null == usePoints
            ? _value.usePoints
            : usePoints // ignore: cast_nullable_to_non_nullable
                  as bool,
        ignoredRules: null == ignoredRules
            ? _value._ignoredRules
            : ignoredRules // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get selectedOrder {
    if (_value.selectedOrder == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_value.selectedOrder!, (value) {
      return _then(_value.copyWith(selectedOrder: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    final List<OrderModel> orders = const [],
    this.selectedOrder,
    this.usePoints = false,
    final List<String> ignoredRules = const [],
  }) : _orders = orders,
       _ignoredRules = ignoredRules;

  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final OrderModel? selectedOrder;
  @override
  @JsonKey()
  final bool usePoints;
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
    return 'OpenBillState.loaded(orders: $orders, selectedOrder: $selectedOrder, usePoints: $usePoints, ignoredRules: $ignoredRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.selectedOrder, selectedOrder) ||
                other.selectedOrder == selectedOrder) &&
            (identical(other.usePoints, usePoints) ||
                other.usePoints == usePoints) &&
            const DeepCollectionEquality().equals(
              other._ignoredRules,
              _ignoredRules,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    selectedOrder,
    usePoints,
    const DeepCollectionEquality().hash(_ignoredRules),
  );

  /// Create a copy of OpenBillState
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )
    loaded,
  }) {
    return loaded(orders, selectedOrder, usePoints, ignoredRules);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
  }) {
    return loaded?.call(orders, selectedOrder, usePoints, ignoredRules);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(
      List<OrderModel> orders,
      OrderModel? selectedOrder,
      bool usePoints,
      List<String> ignoredRules,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders, selectedOrder, usePoints, ignoredRules);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements OpenBillState {
  const factory _Loaded({
    final List<OrderModel> orders,
    final OrderModel? selectedOrder,
    final bool usePoints,
    final List<String> ignoredRules,
  }) = _$LoadedImpl;

  List<OrderModel> get orders;
  OrderModel? get selectedOrder;
  bool get usePoints;
  List<String> get ignoredRules;

  /// Create a copy of OpenBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
