// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_voucher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemberVoucherModel _$MemberVoucherModelFromJson(Map<String, dynamic> json) {
  return _MemberVoucherModel.fromJson(json);
}

/// @nodoc
mixin _$MemberVoucherModel {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double? get discountValue => throw _privateConstructorUsedError; // ✅ Bikin Nullable
  @JsonKey(name: 'min_purchase')
  double? get minPurchase => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until')
  String? get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_used')
  bool get isUsed => throw _privateConstructorUsedError;

  /// Serializes this MemberVoucherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberVoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberVoucherModelCopyWith<MemberVoucherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberVoucherModelCopyWith<$Res> {
  factory $MemberVoucherModelCopyWith(
    MemberVoucherModel value,
    $Res Function(MemberVoucherModel) then,
  ) = _$MemberVoucherModelCopyWithImpl<$Res, MemberVoucherModel>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    String description,
    @JsonKey(name: 'discount_type') String discountType,
    @JsonKey(name: 'discount_value') double? discountValue,
    @JsonKey(name: 'min_purchase') double? minPurchase,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'is_used') bool isUsed,
  });
}

/// @nodoc
class _$MemberVoucherModelCopyWithImpl<$Res, $Val extends MemberVoucherModel>
    implements $MemberVoucherModelCopyWith<$Res> {
  _$MemberVoucherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberVoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = freezed,
    Object? minPurchase = freezed,
    Object? validUntil = freezed,
    Object? isUsed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            discountType: null == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                      as String,
            discountValue: freezed == discountValue
                ? _value.discountValue
                : discountValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            minPurchase: freezed == minPurchase
                ? _value.minPurchase
                : minPurchase // ignore: cast_nullable_to_non_nullable
                      as double?,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as String?,
            isUsed: null == isUsed
                ? _value.isUsed
                : isUsed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemberVoucherModelImplCopyWith<$Res>
    implements $MemberVoucherModelCopyWith<$Res> {
  factory _$$MemberVoucherModelImplCopyWith(
    _$MemberVoucherModelImpl value,
    $Res Function(_$MemberVoucherModelImpl) then,
  ) = __$$MemberVoucherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    String description,
    @JsonKey(name: 'discount_type') String discountType,
    @JsonKey(name: 'discount_value') double? discountValue,
    @JsonKey(name: 'min_purchase') double? minPurchase,
    @JsonKey(name: 'valid_until') String? validUntil,
    @JsonKey(name: 'is_used') bool isUsed,
  });
}

/// @nodoc
class __$$MemberVoucherModelImplCopyWithImpl<$Res>
    extends _$MemberVoucherModelCopyWithImpl<$Res, _$MemberVoucherModelImpl>
    implements _$$MemberVoucherModelImplCopyWith<$Res> {
  __$$MemberVoucherModelImplCopyWithImpl(
    _$MemberVoucherModelImpl _value,
    $Res Function(_$MemberVoucherModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberVoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = null,
    Object? discountType = null,
    Object? discountValue = freezed,
    Object? minPurchase = freezed,
    Object? validUntil = freezed,
    Object? isUsed = null,
  }) {
    return _then(
      _$MemberVoucherModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        discountType: null == discountType
            ? _value.discountType
            : discountType // ignore: cast_nullable_to_non_nullable
                  as String,
        discountValue: freezed == discountValue
            ? _value.discountValue
            : discountValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        minPurchase: freezed == minPurchase
            ? _value.minPurchase
            : minPurchase // ignore: cast_nullable_to_non_nullable
                  as double?,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as String?,
        isUsed: null == isUsed
            ? _value.isUsed
            : isUsed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberVoucherModelImpl implements _MemberVoucherModel {
  const _$MemberVoucherModelImpl({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    @JsonKey(name: 'discount_type') required this.discountType,
    @JsonKey(name: 'discount_value') this.discountValue,
    @JsonKey(name: 'min_purchase') this.minPurchase,
    @JsonKey(name: 'valid_until') this.validUntil,
    @JsonKey(name: 'is_used') this.isUsed = false,
  });

  factory _$MemberVoucherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberVoucherModelImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'discount_type')
  final String discountType;
  @override
  @JsonKey(name: 'discount_value')
  final double? discountValue;
  // ✅ Bikin Nullable
  @override
  @JsonKey(name: 'min_purchase')
  final double? minPurchase;
  @override
  @JsonKey(name: 'valid_until')
  final String? validUntil;
  @override
  @JsonKey(name: 'is_used')
  final bool isUsed;

  @override
  String toString() {
    return 'MemberVoucherModel(id: $id, code: $code, name: $name, description: $description, discountType: $discountType, discountValue: $discountValue, minPurchase: $minPurchase, validUntil: $validUntil, isUsed: $isUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberVoucherModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.minPurchase, minPurchase) ||
                other.minPurchase == minPurchase) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    description,
    discountType,
    discountValue,
    minPurchase,
    validUntil,
    isUsed,
  );

  /// Create a copy of MemberVoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberVoucherModelImplCopyWith<_$MemberVoucherModelImpl> get copyWith =>
      __$$MemberVoucherModelImplCopyWithImpl<_$MemberVoucherModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberVoucherModelImplToJson(this);
  }
}

abstract class _MemberVoucherModel implements MemberVoucherModel {
  const factory _MemberVoucherModel({
    required final int id,
    required final String code,
    required final String name,
    required final String description,
    @JsonKey(name: 'discount_type') required final String discountType,
    @JsonKey(name: 'discount_value') final double? discountValue,
    @JsonKey(name: 'min_purchase') final double? minPurchase,
    @JsonKey(name: 'valid_until') final String? validUntil,
    @JsonKey(name: 'is_used') final bool isUsed,
  }) = _$MemberVoucherModelImpl;

  factory _MemberVoucherModel.fromJson(Map<String, dynamic> json) =
      _$MemberVoucherModelImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'discount_type')
  String get discountType;
  @override
  @JsonKey(name: 'discount_value')
  double? get discountValue; // ✅ Bikin Nullable
  @override
  @JsonKey(name: 'min_purchase')
  double? get minPurchase;
  @override
  @JsonKey(name: 'valid_until')
  String? get validUntil;
  @override
  @JsonKey(name: 'is_used')
  bool get isUsed;

  /// Create a copy of MemberVoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberVoucherModelImplCopyWith<_$MemberVoucherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
