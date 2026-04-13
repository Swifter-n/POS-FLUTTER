// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(readValue: _parseInt)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', readValue: _parseInt)
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parseDouble)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_uom', readValue: _parseDouble)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  double get total => throw _privateConstructorUsedError;
  String? get note =>
      throw _privateConstructorUsedError; // Ganti class di bawah ini dengan OrderItemAddonModel jika itu yang Anda gunakan
  List<OrderItemAddonModel> get addons => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories', readValue: _parseInt)
  int get calories => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
    OrderItemModel value,
    $Res Function(OrderItemModel) then,
  ) = _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call({
    @JsonKey(readValue: _parseInt) int id,
    @JsonKey(name: 'product_id', readValue: _parseInt) int productId,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(readValue: _parseDouble) double quantity,
    @JsonKey(name: 'price_per_uom', readValue: _parseDouble) double price,
    @JsonKey(name: 'total_price', readValue: _parseDouble) double total,
    String? note,
    List<OrderItemAddonModel> addons,
    @JsonKey(name: 'calories', readValue: _parseInt) int calories,
  });
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
    Object? note = freezed,
    Object? addons = null,
    Object? calories = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
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
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            addons: null == addons
                ? _value.addons
                : addons // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemAddonModel>,
            calories: null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(
    _$OrderItemModelImpl value,
    $Res Function(_$OrderItemModelImpl) then,
  ) = __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(readValue: _parseInt) int id,
    @JsonKey(name: 'product_id', readValue: _parseInt) int productId,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(readValue: _parseDouble) double quantity,
    @JsonKey(name: 'price_per_uom', readValue: _parseDouble) double price,
    @JsonKey(name: 'total_price', readValue: _parseDouble) double total,
    String? note,
    List<OrderItemAddonModel> addons,
    @JsonKey(name: 'calories', readValue: _parseInt) int calories,
  });
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
    _$OrderItemModelImpl _value,
    $Res Function(_$OrderItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
    Object? note = freezed,
    Object? addons = null,
    Object? calories = null,
  }) {
    return _then(
      _$OrderItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
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
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        addons: null == addons
            ? _value._addons
            : addons // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemAddonModel>,
        calories: null == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl({
    @JsonKey(readValue: _parseInt) this.id = 0,
    @JsonKey(name: 'product_id', readValue: _parseInt) this.productId = 0,
    @JsonKey(name: 'product_name') this.productName = '-',
    @JsonKey(readValue: _parseDouble) this.quantity = 0.0,
    @JsonKey(name: 'price_per_uom', readValue: _parseDouble) this.price = 0.0,
    @JsonKey(name: 'total_price', readValue: _parseDouble) this.total = 0.0,
    this.note,
    final List<OrderItemAddonModel> addons = const [],
    @JsonKey(name: 'calories', readValue: _parseInt) this.calories = 0,
  }) : _addons = addons;

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _parseInt)
  final int id;
  @override
  @JsonKey(name: 'product_id', readValue: _parseInt)
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(readValue: _parseDouble)
  final double quantity;
  @override
  @JsonKey(name: 'price_per_uom', readValue: _parseDouble)
  final double price;
  @override
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  final double total;
  @override
  final String? note;
  // Ganti class di bawah ini dengan OrderItemAddonModel jika itu yang Anda gunakan
  final List<OrderItemAddonModel> _addons;
  // Ganti class di bawah ini dengan OrderItemAddonModel jika itu yang Anda gunakan
  @override
  @JsonKey()
  List<OrderItemAddonModel> get addons {
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addons);
  }

  @override
  @JsonKey(name: 'calories', readValue: _parseInt)
  final int calories;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, productId: $productId, productName: $productName, quantity: $quantity, price: $price, total: $total, note: $note, addons: $addons, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._addons, _addons) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    productName,
    quantity,
    price,
    total,
    note,
    const DeepCollectionEquality().hash(_addons),
    calories,
  );

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(this);
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel({
    @JsonKey(readValue: _parseInt) final int id,
    @JsonKey(name: 'product_id', readValue: _parseInt) final int productId,
    @JsonKey(name: 'product_name') final String productName,
    @JsonKey(readValue: _parseDouble) final double quantity,
    @JsonKey(name: 'price_per_uom', readValue: _parseDouble) final double price,
    @JsonKey(name: 'total_price', readValue: _parseDouble) final double total,
    final String? note,
    final List<OrderItemAddonModel> addons,
    @JsonKey(name: 'calories', readValue: _parseInt) final int calories,
  }) = _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _parseInt)
  int get id;
  @override
  @JsonKey(name: 'product_id', readValue: _parseInt)
  int get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(readValue: _parseDouble)
  double get quantity;
  @override
  @JsonKey(name: 'price_per_uom', readValue: _parseDouble)
  double get price;
  @override
  @JsonKey(name: 'total_price', readValue: _parseDouble)
  double get total;
  @override
  String? get note; // Ganti class di bawah ini dengan OrderItemAddonModel jika itu yang Anda gunakan
  @override
  List<OrderItemAddonModel> get addons;
  @override
  @JsonKey(name: 'calories', readValue: _parseInt)
  int get calories;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
