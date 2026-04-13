// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiscountRuleModel _$DiscountRuleModelFromJson(Map<String, dynamic> json) {
  return _DiscountRuleModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountRuleModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get discountType =>
      throw _privateConstructorUsedError; // 'percent' atau 'fixed'
  // --- TAMBAHKAN fromJson: _parseDouble DI FIELD ANGKA INI ---
  @JsonKey(name: 'discount_value', fromJson: _parseDouble)
  double? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_purchase', fromJson: _parseDouble)
  double? get minPurchase => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_discount', fromJson: _parseDouble)
  double? get maxDiscount => throw _privateConstructorUsedError; // -----------------------------------------------------------
  String? get validFrom => throw _privateConstructorUsedError;
  String? get validUntil => throw _privateConstructorUsedError;

  /// Serializes this DiscountRuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountRuleModelCopyWith<DiscountRuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountRuleModelCopyWith<$Res> {
  factory $DiscountRuleModelCopyWith(
    DiscountRuleModel value,
    $Res Function(DiscountRuleModel) then,
  ) = _$DiscountRuleModelCopyWithImpl<$Res, DiscountRuleModel>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? type,
    String? discountType,
    @JsonKey(name: 'discount_value', fromJson: _parseDouble)
    double? discountValue,
    @JsonKey(name: 'min_purchase', fromJson: _parseDouble) double? minPurchase,
    @JsonKey(name: 'max_discount', fromJson: _parseDouble) double? maxDiscount,
    String? validFrom,
    String? validUntil,
  });
}

/// @nodoc
class _$DiscountRuleModelCopyWithImpl<$Res, $Val extends DiscountRuleModel>
    implements $DiscountRuleModelCopyWith<$Res> {
  _$DiscountRuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? minPurchase = freezed,
    Object? maxDiscount = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
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
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountType: freezed == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountValue: freezed == discountValue
                ? _value.discountValue
                : discountValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            minPurchase: freezed == minPurchase
                ? _value.minPurchase
                : minPurchase // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxDiscount: freezed == maxDiscount
                ? _value.maxDiscount
                : maxDiscount // ignore: cast_nullable_to_non_nullable
                      as double?,
            validFrom: freezed == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiscountRuleModelImplCopyWith<$Res>
    implements $DiscountRuleModelCopyWith<$Res> {
  factory _$$DiscountRuleModelImplCopyWith(
    _$DiscountRuleModelImpl value,
    $Res Function(_$DiscountRuleModelImpl) then,
  ) = __$$DiscountRuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? type,
    String? discountType,
    @JsonKey(name: 'discount_value', fromJson: _parseDouble)
    double? discountValue,
    @JsonKey(name: 'min_purchase', fromJson: _parseDouble) double? minPurchase,
    @JsonKey(name: 'max_discount', fromJson: _parseDouble) double? maxDiscount,
    String? validFrom,
    String? validUntil,
  });
}

/// @nodoc
class __$$DiscountRuleModelImplCopyWithImpl<$Res>
    extends _$DiscountRuleModelCopyWithImpl<$Res, _$DiscountRuleModelImpl>
    implements _$$DiscountRuleModelImplCopyWith<$Res> {
  __$$DiscountRuleModelImplCopyWithImpl(
    _$DiscountRuleModelImpl _value,
    $Res Function(_$DiscountRuleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscountRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? minPurchase = freezed,
    Object? maxDiscount = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
  }) {
    return _then(
      _$DiscountRuleModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountType: freezed == discountType
            ? _value.discountType
            : discountType // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountValue: freezed == discountValue
            ? _value.discountValue
            : discountValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        minPurchase: freezed == minPurchase
            ? _value.minPurchase
            : minPurchase // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxDiscount: freezed == maxDiscount
            ? _value.maxDiscount
            : maxDiscount // ignore: cast_nullable_to_non_nullable
                  as double?,
        validFrom: freezed == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountRuleModelImpl implements _DiscountRuleModel {
  const _$DiscountRuleModelImpl({
    this.id,
    this.name,
    this.type,
    this.discountType,
    @JsonKey(name: 'discount_value', fromJson: _parseDouble) this.discountValue,
    @JsonKey(name: 'min_purchase', fromJson: _parseDouble) this.minPurchase,
    @JsonKey(name: 'max_discount', fromJson: _parseDouble) this.maxDiscount,
    this.validFrom,
    this.validUntil,
  });

  factory _$DiscountRuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountRuleModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? discountType;
  // 'percent' atau 'fixed'
  // --- TAMBAHKAN fromJson: _parseDouble DI FIELD ANGKA INI ---
  @override
  @JsonKey(name: 'discount_value', fromJson: _parseDouble)
  final double? discountValue;
  @override
  @JsonKey(name: 'min_purchase', fromJson: _parseDouble)
  final double? minPurchase;
  @override
  @JsonKey(name: 'max_discount', fromJson: _parseDouble)
  final double? maxDiscount;
  // -----------------------------------------------------------
  @override
  final String? validFrom;
  @override
  final String? validUntil;

  @override
  String toString() {
    return 'DiscountRuleModel(id: $id, name: $name, type: $type, discountType: $discountType, discountValue: $discountValue, minPurchase: $minPurchase, maxDiscount: $maxDiscount, validFrom: $validFrom, validUntil: $validUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountRuleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.minPurchase, minPurchase) ||
                other.minPurchase == minPurchase) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    discountType,
    discountValue,
    minPurchase,
    maxDiscount,
    validFrom,
    validUntil,
  );

  /// Create a copy of DiscountRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountRuleModelImplCopyWith<_$DiscountRuleModelImpl> get copyWith =>
      __$$DiscountRuleModelImplCopyWithImpl<_$DiscountRuleModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountRuleModelImplToJson(this);
  }
}

abstract class _DiscountRuleModel implements DiscountRuleModel {
  const factory _DiscountRuleModel({
    final int? id,
    final String? name,
    final String? type,
    final String? discountType,
    @JsonKey(name: 'discount_value', fromJson: _parseDouble)
    final double? discountValue,
    @JsonKey(name: 'min_purchase', fromJson: _parseDouble)
    final double? minPurchase,
    @JsonKey(name: 'max_discount', fromJson: _parseDouble)
    final double? maxDiscount,
    final String? validFrom,
    final String? validUntil,
  }) = _$DiscountRuleModelImpl;

  factory _DiscountRuleModel.fromJson(Map<String, dynamic> json) =
      _$DiscountRuleModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get discountType; // 'percent' atau 'fixed'
  // --- TAMBAHKAN fromJson: _parseDouble DI FIELD ANGKA INI ---
  @override
  @JsonKey(name: 'discount_value', fromJson: _parseDouble)
  double? get discountValue;
  @override
  @JsonKey(name: 'min_purchase', fromJson: _parseDouble)
  double? get minPurchase;
  @override
  @JsonKey(name: 'max_discount', fromJson: _parseDouble)
  double? get maxDiscount; // -----------------------------------------------------------
  @override
  String? get validFrom;
  @override
  String? get validUntil;

  /// Create a copy of DiscountRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountRuleModelImplCopyWith<_$DiscountRuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
