// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_bill_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenBillPayload _$OpenBillPayloadFromJson(Map<String, dynamic> json) {
  return _OpenBillPayload.fromJson(json);
}

/// @nodoc
mixin _$OpenBillPayload {
  @JsonKey(name: 'type_order')
  String get typeOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_number')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count')
  int? get guestCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  int? get memberId => throw _privateConstructorUsedError;

  /// Serializes this OpenBillPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenBillPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenBillPayloadCopyWith<OpenBillPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenBillPayloadCopyWith<$Res> {
  factory $OpenBillPayloadCopyWith(
    OpenBillPayload value,
    $Res Function(OpenBillPayload) then,
  ) = _$OpenBillPayloadCopyWithImpl<$Res, OpenBillPayload>;
  @useResult
  $Res call({
    @JsonKey(name: 'type_order') String typeOrder,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'member_id') int? memberId,
  });
}

/// @nodoc
class _$OpenBillPayloadCopyWithImpl<$Res, $Val extends OpenBillPayload>
    implements $OpenBillPayloadCopyWith<$Res> {
  _$OpenBillPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenBillPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeOrder = null,
    Object? tableNumber = freezed,
    Object? customerName = freezed,
    Object? guestCount = freezed,
    Object? memberId = freezed,
  }) {
    return _then(
      _value.copyWith(
            typeOrder: null == typeOrder
                ? _value.typeOrder
                : typeOrder // ignore: cast_nullable_to_non_nullable
                      as String,
            tableNumber: freezed == tableNumber
                ? _value.tableNumber
                : tableNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerName: freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: freezed == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            memberId: freezed == memberId
                ? _value.memberId
                : memberId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenBillPayloadImplCopyWith<$Res>
    implements $OpenBillPayloadCopyWith<$Res> {
  factory _$$OpenBillPayloadImplCopyWith(
    _$OpenBillPayloadImpl value,
    $Res Function(_$OpenBillPayloadImpl) then,
  ) = __$$OpenBillPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'type_order') String typeOrder,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'guest_count') int? guestCount,
    @JsonKey(name: 'member_id') int? memberId,
  });
}

/// @nodoc
class __$$OpenBillPayloadImplCopyWithImpl<$Res>
    extends _$OpenBillPayloadCopyWithImpl<$Res, _$OpenBillPayloadImpl>
    implements _$$OpenBillPayloadImplCopyWith<$Res> {
  __$$OpenBillPayloadImplCopyWithImpl(
    _$OpenBillPayloadImpl _value,
    $Res Function(_$OpenBillPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenBillPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeOrder = null,
    Object? tableNumber = freezed,
    Object? customerName = freezed,
    Object? guestCount = freezed,
    Object? memberId = freezed,
  }) {
    return _then(
      _$OpenBillPayloadImpl(
        typeOrder: null == typeOrder
            ? _value.typeOrder
            : typeOrder // ignore: cast_nullable_to_non_nullable
                  as String,
        tableNumber: freezed == tableNumber
            ? _value.tableNumber
            : tableNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerName: freezed == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: freezed == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        memberId: freezed == memberId
            ? _value.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OpenBillPayloadImpl implements _OpenBillPayload {
  const _$OpenBillPayloadImpl({
    @JsonKey(name: 'type_order') required this.typeOrder,
    @JsonKey(name: 'table_number') this.tableNumber,
    @JsonKey(name: 'customer_name') this.customerName,
    @JsonKey(name: 'guest_count') this.guestCount,
    @JsonKey(name: 'member_id') this.memberId,
  });

  factory _$OpenBillPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenBillPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'type_order')
  final String typeOrder;
  @override
  @JsonKey(name: 'table_number')
  final String? tableNumber;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'guest_count')
  final int? guestCount;
  @override
  @JsonKey(name: 'member_id')
  final int? memberId;

  @override
  String toString() {
    return 'OpenBillPayload(typeOrder: $typeOrder, tableNumber: $tableNumber, customerName: $customerName, guestCount: $guestCount, memberId: $memberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenBillPayloadImpl &&
            (identical(other.typeOrder, typeOrder) ||
                other.typeOrder == typeOrder) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    typeOrder,
    tableNumber,
    customerName,
    guestCount,
    memberId,
  );

  /// Create a copy of OpenBillPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenBillPayloadImplCopyWith<_$OpenBillPayloadImpl> get copyWith =>
      __$$OpenBillPayloadImplCopyWithImpl<_$OpenBillPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenBillPayloadImplToJson(this);
  }
}

abstract class _OpenBillPayload implements OpenBillPayload {
  const factory _OpenBillPayload({
    @JsonKey(name: 'type_order') required final String typeOrder,
    @JsonKey(name: 'table_number') final String? tableNumber,
    @JsonKey(name: 'customer_name') final String? customerName,
    @JsonKey(name: 'guest_count') final int? guestCount,
    @JsonKey(name: 'member_id') final int? memberId,
  }) = _$OpenBillPayloadImpl;

  factory _OpenBillPayload.fromJson(Map<String, dynamic> json) =
      _$OpenBillPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'type_order')
  String get typeOrder;
  @override
  @JsonKey(name: 'table_number')
  String? get tableNumber;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'guest_count')
  int? get guestCount;
  @override
  @JsonKey(name: 'member_id')
  int? get memberId;

  /// Create a copy of OpenBillPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenBillPayloadImplCopyWith<_$OpenBillPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
