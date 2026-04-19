// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) {
  return _MemberModel.fromJson(json);
}

/// @nodoc
mixin _$MemberModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_code')
  String? get memberCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'points', readValue: _readPoints)
  double? get currentPoints => throw _privateConstructorUsedError;
  String get tier => throw _privateConstructorUsedError;
  List<MemberVoucherModel> get vouchers =>
      throw _privateConstructorUsedError; // Insight CRM
  @JsonKey(name: 'last_visit', readValue: _readLastVisit)
  String? get lastVisit => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
  String? get favoriteProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
  double? get totalSpend => throw _privateConstructorUsedError;

  /// Serializes this MemberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberModelCopyWith<MemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberModelCopyWith<$Res> {
  factory $MemberModelCopyWith(
    MemberModel value,
    $Res Function(MemberModel) then,
  ) = _$MemberModelCopyWithImpl<$Res, MemberModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String phone,
    String? email,
    @JsonKey(name: 'member_code') String? memberCode,
    @JsonKey(name: 'points', readValue: _readPoints) double? currentPoints,
    String tier,
    List<MemberVoucherModel> vouchers,
    @JsonKey(name: 'last_visit', readValue: _readLastVisit) String? lastVisit,
    @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
    String? favoriteProduct,
    @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
    double? totalSpend,
  });
}

/// @nodoc
class _$MemberModelCopyWithImpl<$Res, $Val extends MemberModel>
    implements $MemberModelCopyWith<$Res> {
  _$MemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? memberCode = freezed,
    Object? currentPoints = freezed,
    Object? tier = null,
    Object? vouchers = null,
    Object? lastVisit = freezed,
    Object? favoriteProduct = freezed,
    Object? totalSpend = freezed,
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
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            memberCode: freezed == memberCode
                ? _value.memberCode
                : memberCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentPoints: freezed == currentPoints
                ? _value.currentPoints
                : currentPoints // ignore: cast_nullable_to_non_nullable
                      as double?,
            tier: null == tier
                ? _value.tier
                : tier // ignore: cast_nullable_to_non_nullable
                      as String,
            vouchers: null == vouchers
                ? _value.vouchers
                : vouchers // ignore: cast_nullable_to_non_nullable
                      as List<MemberVoucherModel>,
            lastVisit: freezed == lastVisit
                ? _value.lastVisit
                : lastVisit // ignore: cast_nullable_to_non_nullable
                      as String?,
            favoriteProduct: freezed == favoriteProduct
                ? _value.favoriteProduct
                : favoriteProduct // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalSpend: freezed == totalSpend
                ? _value.totalSpend
                : totalSpend // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemberModelImplCopyWith<$Res>
    implements $MemberModelCopyWith<$Res> {
  factory _$$MemberModelImplCopyWith(
    _$MemberModelImpl value,
    $Res Function(_$MemberModelImpl) then,
  ) = __$$MemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String phone,
    String? email,
    @JsonKey(name: 'member_code') String? memberCode,
    @JsonKey(name: 'points', readValue: _readPoints) double? currentPoints,
    String tier,
    List<MemberVoucherModel> vouchers,
    @JsonKey(name: 'last_visit', readValue: _readLastVisit) String? lastVisit,
    @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
    String? favoriteProduct,
    @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
    double? totalSpend,
  });
}

/// @nodoc
class __$$MemberModelImplCopyWithImpl<$Res>
    extends _$MemberModelCopyWithImpl<$Res, _$MemberModelImpl>
    implements _$$MemberModelImplCopyWith<$Res> {
  __$$MemberModelImplCopyWithImpl(
    _$MemberModelImpl _value,
    $Res Function(_$MemberModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? memberCode = freezed,
    Object? currentPoints = freezed,
    Object? tier = null,
    Object? vouchers = null,
    Object? lastVisit = freezed,
    Object? favoriteProduct = freezed,
    Object? totalSpend = freezed,
  }) {
    return _then(
      _$MemberModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        memberCode: freezed == memberCode
            ? _value.memberCode
            : memberCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentPoints: freezed == currentPoints
            ? _value.currentPoints
            : currentPoints // ignore: cast_nullable_to_non_nullable
                  as double?,
        tier: null == tier
            ? _value.tier
            : tier // ignore: cast_nullable_to_non_nullable
                  as String,
        vouchers: null == vouchers
            ? _value._vouchers
            : vouchers // ignore: cast_nullable_to_non_nullable
                  as List<MemberVoucherModel>,
        lastVisit: freezed == lastVisit
            ? _value.lastVisit
            : lastVisit // ignore: cast_nullable_to_non_nullable
                  as String?,
        favoriteProduct: freezed == favoriteProduct
            ? _value.favoriteProduct
            : favoriteProduct // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalSpend: freezed == totalSpend
            ? _value.totalSpend
            : totalSpend // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberModelImpl implements _MemberModel {
  const _$MemberModelImpl({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    @JsonKey(name: 'member_code') this.memberCode,
    @JsonKey(name: 'points', readValue: _readPoints) this.currentPoints,
    this.tier = 'Basic',
    final List<MemberVoucherModel> vouchers = const [],
    @JsonKey(name: 'last_visit', readValue: _readLastVisit) this.lastVisit,
    @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
    this.favoriteProduct,
    @JsonKey(name: 'total_spend', readValue: _readTotalSpend) this.totalSpend,
  }) : _vouchers = vouchers;

  factory _$MemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'member_code')
  final String? memberCode;
  @override
  @JsonKey(name: 'points', readValue: _readPoints)
  final double? currentPoints;
  @override
  @JsonKey()
  final String tier;
  final List<MemberVoucherModel> _vouchers;
  @override
  @JsonKey()
  List<MemberVoucherModel> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  // Insight CRM
  @override
  @JsonKey(name: 'last_visit', readValue: _readLastVisit)
  final String? lastVisit;
  @override
  @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
  final String? favoriteProduct;
  @override
  @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
  final double? totalSpend;

  @override
  String toString() {
    return 'MemberModel(id: $id, name: $name, phone: $phone, email: $email, memberCode: $memberCode, currentPoints: $currentPoints, tier: $tier, vouchers: $vouchers, lastVisit: $lastVisit, favoriteProduct: $favoriteProduct, totalSpend: $totalSpend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.memberCode, memberCode) ||
                other.memberCode == memberCode) &&
            (identical(other.currentPoints, currentPoints) ||
                other.currentPoints == currentPoints) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit) &&
            (identical(other.favoriteProduct, favoriteProduct) ||
                other.favoriteProduct == favoriteProduct) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    email,
    memberCode,
    currentPoints,
    tier,
    const DeepCollectionEquality().hash(_vouchers),
    lastVisit,
    favoriteProduct,
    totalSpend,
  );

  /// Create a copy of MemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      __$$MemberModelImplCopyWithImpl<_$MemberModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberModelImplToJson(this);
  }
}

abstract class _MemberModel implements MemberModel {
  const factory _MemberModel({
    required final int id,
    required final String name,
    required final String phone,
    final String? email,
    @JsonKey(name: 'member_code') final String? memberCode,
    @JsonKey(name: 'points', readValue: _readPoints)
    final double? currentPoints,
    final String tier,
    final List<MemberVoucherModel> vouchers,
    @JsonKey(name: 'last_visit', readValue: _readLastVisit)
    final String? lastVisit,
    @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
    final String? favoriteProduct,
    @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
    final double? totalSpend,
  }) = _$MemberModelImpl;

  factory _MemberModel.fromJson(Map<String, dynamic> json) =
      _$MemberModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'member_code')
  String? get memberCode;
  @override
  @JsonKey(name: 'points', readValue: _readPoints)
  double? get currentPoints;
  @override
  String get tier;
  @override
  List<MemberVoucherModel> get vouchers; // Insight CRM
  @override
  @JsonKey(name: 'last_visit', readValue: _readLastVisit)
  String? get lastVisit;
  @override
  @JsonKey(name: 'favorite_product', readValue: _readFavoriteProduct)
  String? get favoriteProduct;
  @override
  @JsonKey(name: 'total_spend', readValue: _readTotalSpend)
  double? get totalSpend;

  /// Create a copy of MemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
