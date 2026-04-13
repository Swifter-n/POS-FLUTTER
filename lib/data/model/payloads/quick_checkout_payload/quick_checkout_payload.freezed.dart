// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_checkout_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuickCheckoutPayload _$QuickCheckoutPayloadFromJson(Map<String, dynamic> json) {
  return _QuickCheckoutPayload.fromJson(json);
}

/// @nodoc
mixin _$QuickCheckoutPayload {
  // --- KOMPONEN UTAMA (WAJIB) ---
  List<CartItemPayload> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_order')
  String get typeOrder => throw _privateConstructorUsedError; // --- KOMPONEN PEMBAYARAN BARU ---
  // Sangat penting untuk kalkulasi kembalian dan validasi uang pas
  @JsonKey(name: 'amount_paid')
  double get amountPaid => throw _privateConstructorUsedError; // --- MANAJEMEN MEJA ---
  // Saya sertakan keduanya agar Anda fleksibel.
  // Jika backend butuh ID relasi pakai table_id, jika butuh string nama pakai table_number
  @JsonKey(name: 'table_id')
  int? get tableId => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_number')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count')
  int? get guestCount => throw _privateConstructorUsedError; // --- INFO PELANGGAN & CRM ---
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  int? get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_points')
  bool get usePoints => throw _privateConstructorUsedError; // --- PROMO & DISKON ---
  @JsonKey(name: 'promo_code_input')
  String? get promoCodeInput => throw _privateConstructorUsedError;
  @JsonKey(name: 'ignored_rules')
  List<String> get ignoredRules => throw _privateConstructorUsedError;

  /// Serializes this QuickCheckoutPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickCheckoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickCheckoutPayloadCopyWith<QuickCheckoutPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickCheckoutPayloadCopyWith<$Res> {
  factory $QuickCheckoutPayloadCopyWith(
    QuickCheckoutPayload value,
    $Res Function(QuickCheckoutPayload) then,
  ) = _$QuickCheckoutPayloadCopyWithImpl<$Res, QuickCheckoutPayload>;
  @useResult
  $Res call({
    List<CartItemPayload> items,
    @JsonKey(name: 'payment_method') String paymentMethod,
    @JsonKey(name: 'type_order') String typeOrder,
    @JsonKey(name: 'amount_paid') double amountPaid,
    @JsonKey(name: 'table_id') int? tableId,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'member_id') int? memberId,
    @JsonKey(name: 'use_points') bool usePoints,
    @JsonKey(name: 'promo_code_input') String? promoCodeInput,
    @JsonKey(name: 'ignored_rules') List<String> ignoredRules,
  });
}

/// @nodoc
class _$QuickCheckoutPayloadCopyWithImpl<
  $Res,
  $Val extends QuickCheckoutPayload
>
    implements $QuickCheckoutPayloadCopyWith<$Res> {
  _$QuickCheckoutPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickCheckoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? paymentMethod = null,
    Object? typeOrder = null,
    Object? amountPaid = null,
    Object? tableId = freezed,
    Object? tableNumber = freezed,
    Object? guestCount = freezed,
    Object? customerName = freezed,
    Object? memberId = freezed,
    Object? usePoints = null,
    Object? promoCodeInput = freezed,
    Object? ignoredRules = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CartItemPayload>,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            typeOrder: null == typeOrder
                ? _value.typeOrder
                : typeOrder // ignore: cast_nullable_to_non_nullable
                      as String,
            amountPaid: null == amountPaid
                ? _value.amountPaid
                : amountPaid // ignore: cast_nullable_to_non_nullable
                      as double,
            tableId: freezed == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
                      as int?,
            tableNumber: freezed == tableNumber
                ? _value.tableNumber
                : tableNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: freezed == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            customerName: freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            memberId: freezed == memberId
                ? _value.memberId
                : memberId // ignore: cast_nullable_to_non_nullable
                      as int?,
            usePoints: null == usePoints
                ? _value.usePoints
                : usePoints // ignore: cast_nullable_to_non_nullable
                      as bool,
            promoCodeInput: freezed == promoCodeInput
                ? _value.promoCodeInput
                : promoCodeInput // ignore: cast_nullable_to_non_nullable
                      as String?,
            ignoredRules: null == ignoredRules
                ? _value.ignoredRules
                : ignoredRules // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuickCheckoutPayloadImplCopyWith<$Res>
    implements $QuickCheckoutPayloadCopyWith<$Res> {
  factory _$$QuickCheckoutPayloadImplCopyWith(
    _$QuickCheckoutPayloadImpl value,
    $Res Function(_$QuickCheckoutPayloadImpl) then,
  ) = __$$QuickCheckoutPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CartItemPayload> items,
    @JsonKey(name: 'payment_method') String paymentMethod,
    @JsonKey(name: 'type_order') String typeOrder,
    @JsonKey(name: 'amount_paid') double amountPaid,
    @JsonKey(name: 'table_id') int? tableId,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'member_id') int? memberId,
    @JsonKey(name: 'use_points') bool usePoints,
    @JsonKey(name: 'promo_code_input') String? promoCodeInput,
    @JsonKey(name: 'ignored_rules') List<String> ignoredRules,
  });
}

/// @nodoc
class __$$QuickCheckoutPayloadImplCopyWithImpl<$Res>
    extends _$QuickCheckoutPayloadCopyWithImpl<$Res, _$QuickCheckoutPayloadImpl>
    implements _$$QuickCheckoutPayloadImplCopyWith<$Res> {
  __$$QuickCheckoutPayloadImplCopyWithImpl(
    _$QuickCheckoutPayloadImpl _value,
    $Res Function(_$QuickCheckoutPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuickCheckoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? paymentMethod = null,
    Object? typeOrder = null,
    Object? amountPaid = null,
    Object? tableId = freezed,
    Object? tableNumber = freezed,
    Object? guestCount = freezed,
    Object? customerName = freezed,
    Object? memberId = freezed,
    Object? usePoints = null,
    Object? promoCodeInput = freezed,
    Object? ignoredRules = null,
  }) {
    return _then(
      _$QuickCheckoutPayloadImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItemPayload>,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        typeOrder: null == typeOrder
            ? _value.typeOrder
            : typeOrder // ignore: cast_nullable_to_non_nullable
                  as String,
        amountPaid: null == amountPaid
            ? _value.amountPaid
            : amountPaid // ignore: cast_nullable_to_non_nullable
                  as double,
        tableId: freezed == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as int?,
        tableNumber: freezed == tableNumber
            ? _value.tableNumber
            : tableNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: freezed == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        customerName: freezed == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        memberId: freezed == memberId
            ? _value.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as int?,
        usePoints: null == usePoints
            ? _value.usePoints
            : usePoints // ignore: cast_nullable_to_non_nullable
                  as bool,
        promoCodeInput: freezed == promoCodeInput
            ? _value.promoCodeInput
            : promoCodeInput // ignore: cast_nullable_to_non_nullable
                  as String?,
        ignoredRules: null == ignoredRules
            ? _value._ignoredRules
            : ignoredRules // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickCheckoutPayloadImpl implements _QuickCheckoutPayload {
  const _$QuickCheckoutPayloadImpl({
    required final List<CartItemPayload> items,
    @JsonKey(name: 'payment_method') required this.paymentMethod,
    @JsonKey(name: 'type_order') required this.typeOrder,
    @JsonKey(name: 'amount_paid') required this.amountPaid,
    @JsonKey(name: 'table_id') this.tableId,
    @JsonKey(name: 'table_number') this.tableNumber,
    @JsonKey(name: 'guest_count') this.guestCount,
    @JsonKey(name: 'customer_name') this.customerName,
    @JsonKey(name: 'member_id') this.memberId,
    @JsonKey(name: 'use_points') this.usePoints = false,
    @JsonKey(name: 'promo_code_input') this.promoCodeInput,
    @JsonKey(name: 'ignored_rules') final List<String> ignoredRules = const [],
  }) : _items = items,
       _ignoredRules = ignoredRules;

  factory _$QuickCheckoutPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickCheckoutPayloadImplFromJson(json);

  // --- KOMPONEN UTAMA (WAJIB) ---
  final List<CartItemPayload> _items;
  // --- KOMPONEN UTAMA (WAJIB) ---
  @override
  List<CartItemPayload> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'type_order')
  final String typeOrder;
  // --- KOMPONEN PEMBAYARAN BARU ---
  // Sangat penting untuk kalkulasi kembalian dan validasi uang pas
  @override
  @JsonKey(name: 'amount_paid')
  final double amountPaid;
  // --- MANAJEMEN MEJA ---
  // Saya sertakan keduanya agar Anda fleksibel.
  // Jika backend butuh ID relasi pakai table_id, jika butuh string nama pakai table_number
  @override
  @JsonKey(name: 'table_id')
  final int? tableId;
  @override
  @JsonKey(name: 'table_number')
  final String? tableNumber;
  @override
  @JsonKey(name: 'guest_count')
  final int? guestCount;
  // --- INFO PELANGGAN & CRM ---
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'member_id')
  final int? memberId;
  @override
  @JsonKey(name: 'use_points')
  final bool usePoints;
  // --- PROMO & DISKON ---
  @override
  @JsonKey(name: 'promo_code_input')
  final String? promoCodeInput;
  final List<String> _ignoredRules;
  @override
  @JsonKey(name: 'ignored_rules')
  List<String> get ignoredRules {
    if (_ignoredRules is EqualUnmodifiableListView) return _ignoredRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ignoredRules);
  }

  @override
  String toString() {
    return 'QuickCheckoutPayload(items: $items, paymentMethod: $paymentMethod, typeOrder: $typeOrder, amountPaid: $amountPaid, tableId: $tableId, tableNumber: $tableNumber, guestCount: $guestCount, customerName: $customerName, memberId: $memberId, usePoints: $usePoints, promoCodeInput: $promoCodeInput, ignoredRules: $ignoredRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickCheckoutPayloadImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.typeOrder, typeOrder) ||
                other.typeOrder == typeOrder) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.usePoints, usePoints) ||
                other.usePoints == usePoints) &&
            (identical(other.promoCodeInput, promoCodeInput) ||
                other.promoCodeInput == promoCodeInput) &&
            const DeepCollectionEquality().equals(
              other._ignoredRules,
              _ignoredRules,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    paymentMethod,
    typeOrder,
    amountPaid,
    tableId,
    tableNumber,
    guestCount,
    customerName,
    memberId,
    usePoints,
    promoCodeInput,
    const DeepCollectionEquality().hash(_ignoredRules),
  );

  /// Create a copy of QuickCheckoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickCheckoutPayloadImplCopyWith<_$QuickCheckoutPayloadImpl>
  get copyWith =>
      __$$QuickCheckoutPayloadImplCopyWithImpl<_$QuickCheckoutPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickCheckoutPayloadImplToJson(this);
  }
}

abstract class _QuickCheckoutPayload implements QuickCheckoutPayload {
  const factory _QuickCheckoutPayload({
    required final List<CartItemPayload> items,
    @JsonKey(name: 'payment_method') required final String paymentMethod,
    @JsonKey(name: 'type_order') required final String typeOrder,
    @JsonKey(name: 'amount_paid') required final double amountPaid,
    @JsonKey(name: 'table_id') final int? tableId,
    @JsonKey(name: 'table_number') final String? tableNumber,
    @JsonKey(name: 'guest_count') final int? guestCount,
    @JsonKey(name: 'customer_name') final String? customerName,
    @JsonKey(name: 'member_id') final int? memberId,
    @JsonKey(name: 'use_points') final bool usePoints,
    @JsonKey(name: 'promo_code_input') final String? promoCodeInput,
    @JsonKey(name: 'ignored_rules') final List<String> ignoredRules,
  }) = _$QuickCheckoutPayloadImpl;

  factory _QuickCheckoutPayload.fromJson(Map<String, dynamic> json) =
      _$QuickCheckoutPayloadImpl.fromJson;

  // --- KOMPONEN UTAMA (WAJIB) ---
  @override
  List<CartItemPayload> get items;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  @JsonKey(name: 'type_order')
  String get typeOrder; // --- KOMPONEN PEMBAYARAN BARU ---
  // Sangat penting untuk kalkulasi kembalian dan validasi uang pas
  @override
  @JsonKey(name: 'amount_paid')
  double get amountPaid; // --- MANAJEMEN MEJA ---
  // Saya sertakan keduanya agar Anda fleksibel.
  // Jika backend butuh ID relasi pakai table_id, jika butuh string nama pakai table_number
  @override
  @JsonKey(name: 'table_id')
  int? get tableId;
  @override
  @JsonKey(name: 'table_number')
  String? get tableNumber;
  @override
  @JsonKey(name: 'guest_count')
  int? get guestCount; // --- INFO PELANGGAN & CRM ---
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'member_id')
  int? get memberId;
  @override
  @JsonKey(name: 'use_points')
  bool get usePoints; // --- PROMO & DISKON ---
  @override
  @JsonKey(name: 'promo_code_input')
  String? get promoCodeInput;
  @override
  @JsonKey(name: 'ignored_rules')
  List<String> get ignoredRules;

  /// Create a copy of QuickCheckoutPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickCheckoutPayloadImplCopyWith<_$QuickCheckoutPayloadImpl>
  get copyWith => throw _privateConstructorUsedError;
}
