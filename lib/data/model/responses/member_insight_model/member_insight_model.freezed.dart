// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_insight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemberInsightModel _$MemberInsightModelFromJson(Map<String, dynamic> json) {
  return _MemberInsightModel.fromJson(json);
}

/// @nodoc
mixin _$MemberInsightModel {
  @JsonKey(name: 'last_visit')
  String? get lastVisit => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double? get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_product')
  String? get favoriteProduct => throw _privateConstructorUsedError;

  /// Serializes this MemberInsightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberInsightModelCopyWith<MemberInsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberInsightModelCopyWith<$Res> {
  factory $MemberInsightModelCopyWith(
    MemberInsightModel value,
    $Res Function(MemberInsightModel) then,
  ) = _$MemberInsightModelCopyWithImpl<$Res, MemberInsightModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'last_visit') String? lastVisit,
    @JsonKey(name: 'total_spend') double? totalSpend,
    @JsonKey(name: 'favorite_product') String? favoriteProduct,
  });
}

/// @nodoc
class _$MemberInsightModelCopyWithImpl<$Res, $Val extends MemberInsightModel>
    implements $MemberInsightModelCopyWith<$Res> {
  _$MemberInsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastVisit = freezed,
    Object? totalSpend = freezed,
    Object? favoriteProduct = freezed,
  }) {
    return _then(
      _value.copyWith(
            lastVisit: freezed == lastVisit
                ? _value.lastVisit
                : lastVisit // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalSpend: freezed == totalSpend
                ? _value.totalSpend
                : totalSpend // ignore: cast_nullable_to_non_nullable
                      as double?,
            favoriteProduct: freezed == favoriteProduct
                ? _value.favoriteProduct
                : favoriteProduct // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemberInsightModelImplCopyWith<$Res>
    implements $MemberInsightModelCopyWith<$Res> {
  factory _$$MemberInsightModelImplCopyWith(
    _$MemberInsightModelImpl value,
    $Res Function(_$MemberInsightModelImpl) then,
  ) = __$$MemberInsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'last_visit') String? lastVisit,
    @JsonKey(name: 'total_spend') double? totalSpend,
    @JsonKey(name: 'favorite_product') String? favoriteProduct,
  });
}

/// @nodoc
class __$$MemberInsightModelImplCopyWithImpl<$Res>
    extends _$MemberInsightModelCopyWithImpl<$Res, _$MemberInsightModelImpl>
    implements _$$MemberInsightModelImplCopyWith<$Res> {
  __$$MemberInsightModelImplCopyWithImpl(
    _$MemberInsightModelImpl _value,
    $Res Function(_$MemberInsightModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastVisit = freezed,
    Object? totalSpend = freezed,
    Object? favoriteProduct = freezed,
  }) {
    return _then(
      _$MemberInsightModelImpl(
        lastVisit: freezed == lastVisit
            ? _value.lastVisit
            : lastVisit // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalSpend: freezed == totalSpend
            ? _value.totalSpend
            : totalSpend // ignore: cast_nullable_to_non_nullable
                  as double?,
        favoriteProduct: freezed == favoriteProduct
            ? _value.favoriteProduct
            : favoriteProduct // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberInsightModelImpl implements _MemberInsightModel {
  const _$MemberInsightModelImpl({
    @JsonKey(name: 'last_visit') this.lastVisit,
    @JsonKey(name: 'total_spend') this.totalSpend,
    @JsonKey(name: 'favorite_product') this.favoriteProduct,
  });

  factory _$MemberInsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberInsightModelImplFromJson(json);

  @override
  @JsonKey(name: 'last_visit')
  final String? lastVisit;
  @override
  @JsonKey(name: 'total_spend')
  final double? totalSpend;
  @override
  @JsonKey(name: 'favorite_product')
  final String? favoriteProduct;

  @override
  String toString() {
    return 'MemberInsightModel(lastVisit: $lastVisit, totalSpend: $totalSpend, favoriteProduct: $favoriteProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberInsightModelImpl &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.favoriteProduct, favoriteProduct) ||
                other.favoriteProduct == favoriteProduct));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastVisit, totalSpend, favoriteProduct);

  /// Create a copy of MemberInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberInsightModelImplCopyWith<_$MemberInsightModelImpl> get copyWith =>
      __$$MemberInsightModelImplCopyWithImpl<_$MemberInsightModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberInsightModelImplToJson(this);
  }
}

abstract class _MemberInsightModel implements MemberInsightModel {
  const factory _MemberInsightModel({
    @JsonKey(name: 'last_visit') final String? lastVisit,
    @JsonKey(name: 'total_spend') final double? totalSpend,
    @JsonKey(name: 'favorite_product') final String? favoriteProduct,
  }) = _$MemberInsightModelImpl;

  factory _MemberInsightModel.fromJson(Map<String, dynamic> json) =
      _$MemberInsightModelImpl.fromJson;

  @override
  @JsonKey(name: 'last_visit')
  String? get lastVisit;
  @override
  @JsonKey(name: 'total_spend')
  double? get totalSpend;
  @override
  @JsonKey(name: 'favorite_product')
  String? get favoriteProduct;

  /// Create a copy of MemberInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberInsightModelImplCopyWith<_$MemberInsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
