// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_addon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductAddonModel _$ProductAddonModelFromJson(Map<String, dynamic> json) {
  return _ProductAddonModel.fromJson(json);
}

/// @nodoc
mixin _$ProductAddonModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this ProductAddonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAddonModelCopyWith<ProductAddonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAddonModelCopyWith<$Res> {
  factory $ProductAddonModelCopyWith(
    ProductAddonModel value,
    $Res Function(ProductAddonModel) then,
  ) = _$ProductAddonModelCopyWithImpl<$Res, ProductAddonModel>;
  @useResult
  $Res call({
    int id,
    String name,
    double price,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class _$ProductAddonModelCopyWithImpl<$Res, $Val extends ProductAddonModel>
    implements $ProductAddonModelCopyWith<$Res> {
  _$ProductAddonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductAddonModelImplCopyWith<$Res>
    implements $ProductAddonModelCopyWith<$Res> {
  factory _$$ProductAddonModelImplCopyWith(
    _$ProductAddonModelImpl value,
    $Res Function(_$ProductAddonModelImpl) then,
  ) = __$$ProductAddonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    double price,
    @JsonKey(name: 'is_active') bool isActive,
  });
}

/// @nodoc
class __$$ProductAddonModelImplCopyWithImpl<$Res>
    extends _$ProductAddonModelCopyWithImpl<$Res, _$ProductAddonModelImpl>
    implements _$$ProductAddonModelImplCopyWith<$Res> {
  __$$ProductAddonModelImplCopyWithImpl(
    _$ProductAddonModelImpl _value,
    $Res Function(_$ProductAddonModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isActive = null,
  }) {
    return _then(
      _$ProductAddonModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAddonModelImpl implements _ProductAddonModel {
  const _$ProductAddonModelImpl({
    required this.id,
    required this.name,
    required this.price,
    @JsonKey(name: 'is_active') this.isActive = true,
  });

  factory _$ProductAddonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAddonModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'ProductAddonModel(id: $id, name: $name, price: $price, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, isActive);

  /// Create a copy of ProductAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddonModelImplCopyWith<_$ProductAddonModelImpl> get copyWith =>
      __$$ProductAddonModelImplCopyWithImpl<_$ProductAddonModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAddonModelImplToJson(this);
  }
}

abstract class _ProductAddonModel implements ProductAddonModel {
  const factory _ProductAddonModel({
    required final int id,
    required final String name,
    required final double price,
    @JsonKey(name: 'is_active') final bool isActive,
  }) = _$ProductAddonModelImpl;

  factory _ProductAddonModel.fromJson(Map<String, dynamic> json) =
      _$ProductAddonModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;

  /// Create a copy of ProductAddonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAddonModelImplCopyWith<_$ProductAddonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
