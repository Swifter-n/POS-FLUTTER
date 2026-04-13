// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @JsonKey(readValue: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_number')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_order')
  String? get typeOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_total', readValue: _parseDouble)
  double get subTotal => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parseDouble)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parseDouble)
  double get discount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id', readValue: _parseInt)
  int get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_earned', readValue: _parseInt)
  int get pointsEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_redeemed', readValue: _parseInt)
  int get pointsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'applied_rules', readValue: _parseRules)
  List<String> get appliedRules => throw _privateConstructorUsedError;
  String? get proof => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count', readValue: _parseInt)
  int get guestCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<OrderItemModel> get items => throw _privateConstructorUsedError;
  MemberModel? get member => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    @JsonKey(readValue: _parseInt) int id,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'type_order') String? typeOrder,
    @JsonKey(name: 'total_price', readValue: _parseDouble) double totalPrice,
    @JsonKey(name: 'sub_total', readValue: _parseDouble) double subTotal,
    @JsonKey(readValue: _parseDouble) double tax,
    @JsonKey(readValue: _parseDouble) double discount,
    String status,
    @JsonKey(name: 'member_id', readValue: _parseInt) int memberId,
    @JsonKey(name: 'points_earned', readValue: _parseInt) int pointsEarned,
    @JsonKey(name: 'points_redeemed', readValue: _parseInt) int pointsRedeemed,
    @JsonKey(name: 'applied_rules', readValue: _parseRules)
    List<String> appliedRules,
    String? proof,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'guest_count', readValue: _parseInt) int guestCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    List<OrderItemModel> items,
    MemberModel? member,
  });

  $MemberModelCopyWith<$Res>? get member;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = freezed,
    Object? tableNumber = freezed,
    Object? typeOrder = freezed,
    Object? totalPrice = null,
    Object? subTotal = null,
    Object? tax = null,
    Object? discount = null,
    Object? status = null,
    Object? memberId = null,
    Object? pointsEarned = null,
    Object? pointsRedeemed = null,
    Object? appliedRules = null,
    Object? proof = freezed,
    Object? paymentMethod = freezed,
    Object? guestCount = null,
    Object? createdAt = freezed,
    Object? items = null,
    Object? member = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            customerName: freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            tableNumber: freezed == tableNumber
                ? _value.tableNumber
                : tableNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            typeOrder: freezed == typeOrder
                ? _value.typeOrder
                : typeOrder // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            subTotal: null == subTotal
                ? _value.subTotal
                : subTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            tax: null == tax
                ? _value.tax
                : tax // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            memberId: null == memberId
                ? _value.memberId
                : memberId // ignore: cast_nullable_to_non_nullable
                      as int,
            pointsEarned: null == pointsEarned
                ? _value.pointsEarned
                : pointsEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            pointsRedeemed: null == pointsRedeemed
                ? _value.pointsRedeemed
                : pointsRedeemed // ignore: cast_nullable_to_non_nullable
                      as int,
            appliedRules: null == appliedRules
                ? _value.appliedRules
                : appliedRules // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            proof: freezed == proof
                ? _value.proof
                : proof // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemModel>,
            member: freezed == member
                ? _value.member
                : member // ignore: cast_nullable_to_non_nullable
                      as MemberModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberModelCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(readValue: _parseInt) int id,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'table_number') String? tableNumber,
    @JsonKey(name: 'type_order') String? typeOrder,
    @JsonKey(name: 'total_price', readValue: _parseDouble) double totalPrice,
    @JsonKey(name: 'sub_total', readValue: _parseDouble) double subTotal,
    @JsonKey(readValue: _parseDouble) double tax,
    @JsonKey(readValue: _parseDouble) double discount,
    String status,
    @JsonKey(name: 'member_id', readValue: _parseInt) int memberId,
    @JsonKey(name: 'points_earned', readValue: _parseInt) int pointsEarned,
    @JsonKey(name: 'points_redeemed', readValue: _parseInt) int pointsRedeemed,
    @JsonKey(name: 'applied_rules', readValue: _parseRules)
    List<String> appliedRules,
    String? proof,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'guest_count', readValue: _parseInt) int guestCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    List<OrderItemModel> items,
    MemberModel? member,
  });

  @override
  $MemberModelCopyWith<$Res>? get member;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? customerName = freezed,
    Object? tableNumber = freezed,
    Object? typeOrder = freezed,
    Object? totalPrice = null,
    Object? subTotal = null,
    Object? tax = null,
    Object? discount = null,
    Object? status = null,
    Object? memberId = null,
    Object? pointsEarned = null,
    Object? pointsRedeemed = null,
    Object? appliedRules = null,
    Object? proof = freezed,
    Object? paymentMethod = freezed,
    Object? guestCount = null,
    Object? createdAt = freezed,
    Object? items = null,
    Object? member = freezed,
  }) {
    return _then(
      _$OrderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        customerName: freezed == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableNumber: freezed == tableNumber
            ? _value.tableNumber
            : tableNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        typeOrder: freezed == typeOrder
            ? _value.typeOrder
            : typeOrder // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        subTotal: null == subTotal
            ? _value.subTotal
            : subTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        tax: null == tax
            ? _value.tax
            : tax // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        memberId: null == memberId
            ? _value.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as int,
        pointsEarned: null == pointsEarned
            ? _value.pointsEarned
            : pointsEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        pointsRedeemed: null == pointsRedeemed
            ? _value.pointsRedeemed
            : pointsRedeemed // ignore: cast_nullable_to_non_nullable
                  as int,
        appliedRules: null == appliedRules
            ? _value._appliedRules
            : appliedRules // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        proof: freezed == proof
            ? _value.proof
            : proof // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemModel>,
        member: freezed == member
            ? _value.member
            : member // ignore: cast_nullable_to_non_nullable
                  as MemberModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl({
    @JsonKey(readValue: _parseInt) this.id = 0,
    @JsonKey(name: 'order_number') this.orderNumber = '-',
    @JsonKey(name: 'customer_name') this.customerName,
    @JsonKey(name: 'table_number') this.tableNumber,
    @JsonKey(name: 'type_order') this.typeOrder,
    @JsonKey(name: 'total_price', readValue: _parseDouble)
    this.totalPrice = 0.0,
    @JsonKey(name: 'sub_total', readValue: _parseDouble) this.subTotal = 0.0,
    @JsonKey(readValue: _parseDouble) this.tax = 0.0,
    @JsonKey(readValue: _parseDouble) this.discount = 0.0,
    this.status = 'pending',
    @JsonKey(name: 'member_id', readValue: _parseInt) this.memberId = 0,
    @JsonKey(name: 'points_earned', readValue: _parseInt) this.pointsEarned = 0,
    @JsonKey(name: 'points_redeemed', readValue: _parseInt)
    this.pointsRedeemed = 0,
    @JsonKey(name: 'applied_rules', readValue: _parseRules)
    final List<String> appliedRules = const [],
    this.proof,
    @JsonKey(name: 'payment_method') this.paymentMethod,
    @JsonKey(name: 'guest_count', readValue: _parseInt) this.guestCount = 1,
    @JsonKey(name: 'created_at') this.createdAt,
    final List<OrderItemModel> items = const [],
    this.member,
  }) : _appliedRules = appliedRules,
       _items = items;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey(readValue: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'table_number')
  final String? tableNumber;
  @override
  @JsonKey(name: 'type_order')
  final String? typeOrder;
  @override
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  final double totalPrice;
  @override
  @JsonKey(name: 'sub_total', readValue: _parseDouble)
  final double subTotal;
  @override
  @JsonKey(readValue: _parseDouble)
  final double tax;
  @override
  @JsonKey(readValue: _parseDouble)
  final double discount;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'member_id', readValue: _parseInt)
  final int memberId;
  @override
  @JsonKey(name: 'points_earned', readValue: _parseInt)
  final int pointsEarned;
  @override
  @JsonKey(name: 'points_redeemed', readValue: _parseInt)
  final int pointsRedeemed;
  final List<String> _appliedRules;
  @override
  @JsonKey(name: 'applied_rules', readValue: _parseRules)
  List<String> get appliedRules {
    if (_appliedRules is EqualUnmodifiableListView) return _appliedRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appliedRules);
  }

  @override
  final String? proof;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'guest_count', readValue: _parseInt)
  final int guestCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final List<OrderItemModel> _items;
  @override
  @JsonKey()
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final MemberModel? member;

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, customerName: $customerName, tableNumber: $tableNumber, typeOrder: $typeOrder, totalPrice: $totalPrice, subTotal: $subTotal, tax: $tax, discount: $discount, status: $status, memberId: $memberId, pointsEarned: $pointsEarned, pointsRedeemed: $pointsRedeemed, appliedRules: $appliedRules, proof: $proof, paymentMethod: $paymentMethod, guestCount: $guestCount, createdAt: $createdAt, items: $items, member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.typeOrder, typeOrder) ||
                other.typeOrder == typeOrder) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.pointsRedeemed, pointsRedeemed) ||
                other.pointsRedeemed == pointsRedeemed) &&
            const DeepCollectionEquality().equals(
              other._appliedRules,
              _appliedRules,
            ) &&
            (identical(other.proof, proof) || other.proof == proof) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.member, member) || other.member == member));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    orderNumber,
    customerName,
    tableNumber,
    typeOrder,
    totalPrice,
    subTotal,
    tax,
    discount,
    status,
    memberId,
    pointsEarned,
    pointsRedeemed,
    const DeepCollectionEquality().hash(_appliedRules),
    proof,
    paymentMethod,
    guestCount,
    createdAt,
    const DeepCollectionEquality().hash(_items),
    member,
  ]);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel({
    @JsonKey(readValue: _parseInt) final int id,
    @JsonKey(name: 'order_number') final String orderNumber,
    @JsonKey(name: 'customer_name') final String? customerName,
    @JsonKey(name: 'table_number') final String? tableNumber,
    @JsonKey(name: 'type_order') final String? typeOrder,
    @JsonKey(name: 'total_price', readValue: _parseDouble)
    final double totalPrice,
    @JsonKey(name: 'sub_total', readValue: _parseDouble) final double subTotal,
    @JsonKey(readValue: _parseDouble) final double tax,
    @JsonKey(readValue: _parseDouble) final double discount,
    final String status,
    @JsonKey(name: 'member_id', readValue: _parseInt) final int memberId,
    @JsonKey(name: 'points_earned', readValue: _parseInt)
    final int pointsEarned,
    @JsonKey(name: 'points_redeemed', readValue: _parseInt)
    final int pointsRedeemed,
    @JsonKey(name: 'applied_rules', readValue: _parseRules)
    final List<String> appliedRules,
    final String? proof,
    @JsonKey(name: 'payment_method') final String? paymentMethod,
    @JsonKey(name: 'guest_count', readValue: _parseInt) final int guestCount,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    final List<OrderItemModel> items,
    final MemberModel? member,
  }) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @JsonKey(readValue: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'table_number')
  String? get tableNumber;
  @override
  @JsonKey(name: 'type_order')
  String? get typeOrder;
  @override
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  double get totalPrice;
  @override
  @JsonKey(name: 'sub_total', readValue: _parseDouble)
  double get subTotal;
  @override
  @JsonKey(readValue: _parseDouble)
  double get tax;
  @override
  @JsonKey(readValue: _parseDouble)
  double get discount;
  @override
  String get status;
  @override
  @JsonKey(name: 'member_id', readValue: _parseInt)
  int get memberId;
  @override
  @JsonKey(name: 'points_earned', readValue: _parseInt)
  int get pointsEarned;
  @override
  @JsonKey(name: 'points_redeemed', readValue: _parseInt)
  int get pointsRedeemed;
  @override
  @JsonKey(name: 'applied_rules', readValue: _parseRules)
  List<String> get appliedRules;
  @override
  String? get proof;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'guest_count', readValue: _parseInt)
  int get guestCount;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  List<OrderItemModel> get items;
  @override
  MemberModel? get member;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
