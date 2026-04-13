// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uom_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UomModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get conversionRate => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UomModelCopyWith<UomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UomModelCopyWith<$Res> {
  factory $UomModelCopyWith(UomModel value, $Res Function(UomModel) then) =
      _$UomModelCopyWithImpl<$Res, UomModel>;
  @useResult
  $Res call({int? id, String? name, double? conversionRate, double? price});
}

/// @nodoc
class _$UomModelCopyWithImpl<$Res, $Val extends UomModel>
    implements $UomModelCopyWith<$Res> {
  _$UomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? conversionRate = freezed,
    Object? price = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            conversionRate: freezed == conversionRate
                ? _value.conversionRate
                : conversionRate // ignore: cast_nullable_to_non_nullable
                      as double?,
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
abstract class _$$UomModelImplCopyWith<$Res>
    implements $UomModelCopyWith<$Res> {
  factory _$$UomModelImplCopyWith(
    _$UomModelImpl value,
    $Res Function(_$UomModelImpl) then,
  ) = __$$UomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, double? conversionRate, double? price});
}

/// @nodoc
class __$$UomModelImplCopyWithImpl<$Res>
    extends _$UomModelCopyWithImpl<$Res, _$UomModelImpl>
    implements _$$UomModelImplCopyWith<$Res> {
  __$$UomModelImplCopyWithImpl(
    _$UomModelImpl _value,
    $Res Function(_$UomModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? conversionRate = freezed,
    Object? price = freezed,
  }) {
    return _then(
      _$UomModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        conversionRate: freezed == conversionRate
            ? _value.conversionRate
            : conversionRate // ignore: cast_nullable_to_non_nullable
                  as double?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$UomModelImpl extends _UomModel {
  const _$UomModelImpl({this.id, this.name, this.conversionRate, this.price})
    : super._();

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? conversionRate;
  @override
  final double? price;

  @override
  String toString() {
    return 'UomModel(id: $id, name: $name, conversionRate: $conversionRate, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, conversionRate, price);

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UomModelImplCopyWith<_$UomModelImpl> get copyWith =>
      __$$UomModelImplCopyWithImpl<_$UomModelImpl>(this, _$identity);
}

abstract class _UomModel extends UomModel {
  const factory _UomModel({
    final int? id,
    final String? name,
    final double? conversionRate,
    final double? price,
  }) = _$UomModelImpl;
  const _UomModel._() : super._();

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get conversionRate;
  @override
  double? get price;

  /// Create a copy of UomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UomModelImplCopyWith<_$UomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
