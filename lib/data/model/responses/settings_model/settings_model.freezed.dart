// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  TaxSetting get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'global_discount')
  GlobalDiscountSetting get globalDiscount =>
      throw _privateConstructorUsedError;

  /// Serializes this SettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
    SettingsModel value,
    $Res Function(SettingsModel) then,
  ) = _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call({
    TaxSetting tax,
    @JsonKey(name: 'global_discount') GlobalDiscountSetting globalDiscount,
  });

  $TaxSettingCopyWith<$Res> get tax;
  $GlobalDiscountSettingCopyWith<$Res> get globalDiscount;
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tax = null, Object? globalDiscount = null}) {
    return _then(
      _value.copyWith(
            tax: null == tax
                ? _value.tax
                : tax // ignore: cast_nullable_to_non_nullable
                      as TaxSetting,
            globalDiscount: null == globalDiscount
                ? _value.globalDiscount
                : globalDiscount // ignore: cast_nullable_to_non_nullable
                      as GlobalDiscountSetting,
          )
          as $Val,
    );
  }

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaxSettingCopyWith<$Res> get tax {
    return $TaxSettingCopyWith<$Res>(_value.tax, (value) {
      return _then(_value.copyWith(tax: value) as $Val);
    });
  }

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalDiscountSettingCopyWith<$Res> get globalDiscount {
    return $GlobalDiscountSettingCopyWith<$Res>(_value.globalDiscount, (value) {
      return _then(_value.copyWith(globalDiscount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
    _$SettingsModelImpl value,
    $Res Function(_$SettingsModelImpl) then,
  ) = __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TaxSetting tax,
    @JsonKey(name: 'global_discount') GlobalDiscountSetting globalDiscount,
  });

  @override
  $TaxSettingCopyWith<$Res> get tax;
  @override
  $GlobalDiscountSettingCopyWith<$Res> get globalDiscount;
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
    _$SettingsModelImpl _value,
    $Res Function(_$SettingsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tax = null, Object? globalDiscount = null}) {
    return _then(
      _$SettingsModelImpl(
        tax: null == tax
            ? _value.tax
            : tax // ignore: cast_nullable_to_non_nullable
                  as TaxSetting,
        globalDiscount: null == globalDiscount
            ? _value.globalDiscount
            : globalDiscount // ignore: cast_nullable_to_non_nullable
                  as GlobalDiscountSetting,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl implements _SettingsModel {
  const _$SettingsModelImpl({
    required this.tax,
    @JsonKey(name: 'global_discount') required this.globalDiscount,
  });

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  final TaxSetting tax;
  @override
  @JsonKey(name: 'global_discount')
  final GlobalDiscountSetting globalDiscount;

  @override
  String toString() {
    return 'SettingsModel(tax: $tax, globalDiscount: $globalDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.globalDiscount, globalDiscount) ||
                other.globalDiscount == globalDiscount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tax, globalDiscount);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsModelImplToJson(this);
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel({
    required final TaxSetting tax,
    @JsonKey(name: 'global_discount')
    required final GlobalDiscountSetting globalDiscount,
  }) = _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  TaxSetting get tax;
  @override
  @JsonKey(name: 'global_discount')
  GlobalDiscountSetting get globalDiscount;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxSetting _$TaxSettingFromJson(Map<String, dynamic> json) {
  return _TaxSetting.fromJson(json);
}

/// @nodoc
mixin _$TaxSetting {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate_percent')
  double get ratePercent => throw _privateConstructorUsedError;

  /// Serializes this TaxSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxSettingCopyWith<TaxSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxSettingCopyWith<$Res> {
  factory $TaxSettingCopyWith(
    TaxSetting value,
    $Res Function(TaxSetting) then,
  ) = _$TaxSettingCopyWithImpl<$Res, TaxSetting>;
  @useResult
  $Res call({String name, @JsonKey(name: 'rate_percent') double ratePercent});
}

/// @nodoc
class _$TaxSettingCopyWithImpl<$Res, $Val extends TaxSetting>
    implements $TaxSettingCopyWith<$Res> {
  _$TaxSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? ratePercent = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            ratePercent: null == ratePercent
                ? _value.ratePercent
                : ratePercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaxSettingImplCopyWith<$Res>
    implements $TaxSettingCopyWith<$Res> {
  factory _$$TaxSettingImplCopyWith(
    _$TaxSettingImpl value,
    $Res Function(_$TaxSettingImpl) then,
  ) = __$$TaxSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'rate_percent') double ratePercent});
}

/// @nodoc
class __$$TaxSettingImplCopyWithImpl<$Res>
    extends _$TaxSettingCopyWithImpl<$Res, _$TaxSettingImpl>
    implements _$$TaxSettingImplCopyWith<$Res> {
  __$$TaxSettingImplCopyWithImpl(
    _$TaxSettingImpl _value,
    $Res Function(_$TaxSettingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaxSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? ratePercent = null}) {
    return _then(
      _$TaxSettingImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        ratePercent: null == ratePercent
            ? _value.ratePercent
            : ratePercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxSettingImpl implements _TaxSetting {
  const _$TaxSettingImpl({
    required this.name,
    @JsonKey(name: 'rate_percent') required this.ratePercent,
  });

  factory _$TaxSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxSettingImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'rate_percent')
  final double ratePercent;

  @override
  String toString() {
    return 'TaxSetting(name: $name, ratePercent: $ratePercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxSettingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ratePercent, ratePercent) ||
                other.ratePercent == ratePercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, ratePercent);

  /// Create a copy of TaxSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxSettingImplCopyWith<_$TaxSettingImpl> get copyWith =>
      __$$TaxSettingImplCopyWithImpl<_$TaxSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxSettingImplToJson(this);
  }
}

abstract class _TaxSetting implements TaxSetting {
  const factory _TaxSetting({
    required final String name,
    @JsonKey(name: 'rate_percent') required final double ratePercent,
  }) = _$TaxSettingImpl;

  factory _TaxSetting.fromJson(Map<String, dynamic> json) =
      _$TaxSettingImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'rate_percent')
  double get ratePercent;

  /// Create a copy of TaxSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxSettingImplCopyWith<_$TaxSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalDiscountSetting _$GlobalDiscountSettingFromJson(
  Map<String, dynamic> json,
) {
  return _GlobalDiscountSetting.fromJson(json);
}

/// @nodoc
mixin _$GlobalDiscountSetting {
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError; // 'fixed', 'percent'
  double get value => throw _privateConstructorUsedError;

  /// Serializes this GlobalDiscountSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlobalDiscountSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalDiscountSettingCopyWith<GlobalDiscountSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalDiscountSettingCopyWith<$Res> {
  factory $GlobalDiscountSettingCopyWith(
    GlobalDiscountSetting value,
    $Res Function(GlobalDiscountSetting) then,
  ) = _$GlobalDiscountSettingCopyWithImpl<$Res, GlobalDiscountSetting>;
  @useResult
  $Res call({String? name, String? type, double value});
}

/// @nodoc
class _$GlobalDiscountSettingCopyWithImpl<
  $Res,
  $Val extends GlobalDiscountSetting
>
    implements $GlobalDiscountSettingCopyWith<$Res> {
  _$GlobalDiscountSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalDiscountSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? value = null,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GlobalDiscountSettingImplCopyWith<$Res>
    implements $GlobalDiscountSettingCopyWith<$Res> {
  factory _$$GlobalDiscountSettingImplCopyWith(
    _$GlobalDiscountSettingImpl value,
    $Res Function(_$GlobalDiscountSettingImpl) then,
  ) = __$$GlobalDiscountSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? type, double value});
}

/// @nodoc
class __$$GlobalDiscountSettingImplCopyWithImpl<$Res>
    extends
        _$GlobalDiscountSettingCopyWithImpl<$Res, _$GlobalDiscountSettingImpl>
    implements _$$GlobalDiscountSettingImplCopyWith<$Res> {
  __$$GlobalDiscountSettingImplCopyWithImpl(
    _$GlobalDiscountSettingImpl _value,
    $Res Function(_$GlobalDiscountSettingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GlobalDiscountSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? value = null,
  }) {
    return _then(
      _$GlobalDiscountSettingImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalDiscountSettingImpl implements _GlobalDiscountSetting {
  const _$GlobalDiscountSettingImpl({
    this.name,
    this.type,
    required this.value,
  });

  factory _$GlobalDiscountSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalDiscountSettingImplFromJson(json);

  @override
  final String? name;
  @override
  final String? type;
  // 'fixed', 'percent'
  @override
  final double value;

  @override
  String toString() {
    return 'GlobalDiscountSetting(name: $name, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalDiscountSettingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, value);

  /// Create a copy of GlobalDiscountSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalDiscountSettingImplCopyWith<_$GlobalDiscountSettingImpl>
  get copyWith =>
      __$$GlobalDiscountSettingImplCopyWithImpl<_$GlobalDiscountSettingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalDiscountSettingImplToJson(this);
  }
}

abstract class _GlobalDiscountSetting implements GlobalDiscountSetting {
  const factory _GlobalDiscountSetting({
    final String? name,
    final String? type,
    required final double value,
  }) = _$GlobalDiscountSettingImpl;

  factory _GlobalDiscountSetting.fromJson(Map<String, dynamic> json) =
      _$GlobalDiscountSettingImpl.fromJson;

  @override
  String? get name;
  @override
  String? get type; // 'fixed', 'percent'
  @override
  double get value;

  /// Create a copy of GlobalDiscountSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalDiscountSettingImplCopyWith<_$GlobalDiscountSettingImpl>
  get copyWith => throw _privateConstructorUsedError;
}
