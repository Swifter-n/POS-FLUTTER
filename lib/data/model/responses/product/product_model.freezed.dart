// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: 'productId')
  int get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  List<UomModel> get uoms => throw _privateConstructorUsedError;
  List<ProductAddonModel> get addons => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_popular')
  bool? get isPopular => throw _privateConstructorUsedError;
  @JsonKey(name: 'promotions')
  List<dynamic>? get promotions => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock')
  double? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockInfo')
  Map<String, dynamic>? get stockInfo => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
    ProductModel value,
    $Res Function(ProductModel) then,
  ) = _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'productId') int productId,
    String name,
    double price,
    String category,
    String? thumbnail,
    String? barcode,
    List<UomModel> uoms,
    List<ProductAddonModel> addons,
    @JsonKey(name: 'is_popular') bool? isPopular,
    @JsonKey(name: 'promotions') List<dynamic>? promotions,
    int? calories,
    @JsonKey(name: 'stock') double? stock,
    @JsonKey(name: 'stockInfo') Map<String, dynamic>? stockInfo,
  });
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? category = null,
    Object? thumbnail = freezed,
    Object? barcode = freezed,
    Object? uoms = null,
    Object? addons = null,
    Object? isPopular = freezed,
    Object? promotions = freezed,
    Object? calories = freezed,
    Object? stock = freezed,
    Object? stockInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String?,
            barcode: freezed == barcode
                ? _value.barcode
                : barcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            uoms: null == uoms
                ? _value.uoms
                : uoms // ignore: cast_nullable_to_non_nullable
                      as List<UomModel>,
            addons: null == addons
                ? _value.addons
                : addons // ignore: cast_nullable_to_non_nullable
                      as List<ProductAddonModel>,
            isPopular: freezed == isPopular
                ? _value.isPopular
                : isPopular // ignore: cast_nullable_to_non_nullable
                      as bool?,
            promotions: freezed == promotions
                ? _value.promotions
                : promotions // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
            calories: freezed == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int?,
            stock: freezed == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as double?,
            stockInfo: freezed == stockInfo
                ? _value.stockInfo
                : stockInfo // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
    _$ProductModelImpl value,
    $Res Function(_$ProductModelImpl) then,
  ) = __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'productId') int productId,
    String name,
    double price,
    String category,
    String? thumbnail,
    String? barcode,
    List<UomModel> uoms,
    List<ProductAddonModel> addons,
    @JsonKey(name: 'is_popular') bool? isPopular,
    @JsonKey(name: 'promotions') List<dynamic>? promotions,
    int? calories,
    @JsonKey(name: 'stock') double? stock,
    @JsonKey(name: 'stockInfo') Map<String, dynamic>? stockInfo,
  });
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
    _$ProductModelImpl _value,
    $Res Function(_$ProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? category = null,
    Object? thumbnail = freezed,
    Object? barcode = freezed,
    Object? uoms = null,
    Object? addons = null,
    Object? isPopular = freezed,
    Object? promotions = freezed,
    Object? calories = freezed,
    Object? stock = freezed,
    Object? stockInfo = freezed,
  }) {
    return _then(
      _$ProductModelImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String?,
        barcode: freezed == barcode
            ? _value.barcode
            : barcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        uoms: null == uoms
            ? _value._uoms
            : uoms // ignore: cast_nullable_to_non_nullable
                  as List<UomModel>,
        addons: null == addons
            ? _value._addons
            : addons // ignore: cast_nullable_to_non_nullable
                  as List<ProductAddonModel>,
        isPopular: freezed == isPopular
            ? _value.isPopular
            : isPopular // ignore: cast_nullable_to_non_nullable
                  as bool?,
        promotions: freezed == promotions
            ? _value._promotions
            : promotions // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
        calories: freezed == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int?,
        stock: freezed == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as double?,
        stockInfo: freezed == stockInfo
            ? _value._stockInfo
            : stockInfo // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl({
    @JsonKey(name: 'productId') required this.productId,
    required this.name,
    required this.price,
    required this.category,
    this.thumbnail,
    this.barcode,
    required final List<UomModel> uoms,
    required final List<ProductAddonModel> addons,
    @JsonKey(name: 'is_popular') this.isPopular,
    @JsonKey(name: 'promotions') final List<dynamic>? promotions,
    this.calories,
    @JsonKey(name: 'stock') this.stock,
    @JsonKey(name: 'stockInfo') final Map<String, dynamic>? stockInfo,
  }) : _uoms = uoms,
       _addons = addons,
       _promotions = promotions,
       _stockInfo = stockInfo;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final int productId;
  @override
  final String name;
  @override
  final double price;
  @override
  final String category;
  @override
  final String? thumbnail;
  @override
  final String? barcode;
  final List<UomModel> _uoms;
  @override
  List<UomModel> get uoms {
    if (_uoms is EqualUnmodifiableListView) return _uoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uoms);
  }

  final List<ProductAddonModel> _addons;
  @override
  List<ProductAddonModel> get addons {
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addons);
  }

  @override
  @JsonKey(name: 'is_popular')
  final bool? isPopular;
  final List<dynamic>? _promotions;
  @override
  @JsonKey(name: 'promotions')
  List<dynamic>? get promotions {
    final value = _promotions;
    if (value == null) return null;
    if (_promotions is EqualUnmodifiableListView) return _promotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? calories;
  @override
  @JsonKey(name: 'stock')
  final double? stock;
  final Map<String, dynamic>? _stockInfo;
  @override
  @JsonKey(name: 'stockInfo')
  Map<String, dynamic>? get stockInfo {
    final value = _stockInfo;
    if (value == null) return null;
    if (_stockInfo is EqualUnmodifiableMapView) return _stockInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, price: $price, category: $category, thumbnail: $thumbnail, barcode: $barcode, uoms: $uoms, addons: $addons, isPopular: $isPopular, promotions: $promotions, calories: $calories, stock: $stock, stockInfo: $stockInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            const DeepCollectionEquality().equals(other._uoms, _uoms) &&
            const DeepCollectionEquality().equals(other._addons, _addons) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            const DeepCollectionEquality().equals(
              other._promotions,
              _promotions,
            ) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            const DeepCollectionEquality().equals(
              other._stockInfo,
              _stockInfo,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    name,
    price,
    category,
    thumbnail,
    barcode,
    const DeepCollectionEquality().hash(_uoms),
    const DeepCollectionEquality().hash(_addons),
    isPopular,
    const DeepCollectionEquality().hash(_promotions),
    calories,
    stock,
    const DeepCollectionEquality().hash(_stockInfo),
  );

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel({
    @JsonKey(name: 'productId') required final int productId,
    required final String name,
    required final double price,
    required final String category,
    final String? thumbnail,
    final String? barcode,
    required final List<UomModel> uoms,
    required final List<ProductAddonModel> addons,
    @JsonKey(name: 'is_popular') final bool? isPopular,
    @JsonKey(name: 'promotions') final List<dynamic>? promotions,
    final int? calories,
    @JsonKey(name: 'stock') final double? stock,
    @JsonKey(name: 'stockInfo') final Map<String, dynamic>? stockInfo,
  }) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @JsonKey(name: 'productId')
  int get productId;
  @override
  String get name;
  @override
  double get price;
  @override
  String get category;
  @override
  String? get thumbnail;
  @override
  String? get barcode;
  @override
  List<UomModel> get uoms;
  @override
  List<ProductAddonModel> get addons;
  @override
  @JsonKey(name: 'is_popular')
  bool? get isPopular;
  @override
  @JsonKey(name: 'promotions')
  List<dynamic>? get promotions;
  @override
  int? get calories;
  @override
  @JsonKey(name: 'stock')
  double? get stock;
  @override
  @JsonKey(name: 'stockInfo')
  Map<String, dynamic>? get stockInfo;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
