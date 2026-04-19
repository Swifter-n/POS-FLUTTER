// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrinterSettingsModel _$PrinterSettingsModelFromJson(Map<String, dynamic> json) {
  return _PrinterSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$PrinterSettingsModel {
  @JsonKey(name: 'default_printer')
  PrinterModel? get defaultPrinter => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_printers')
  List<PrinterModel> get allPrinters => throw _privateConstructorUsedError;

  /// Serializes this PrinterSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterSettingsModelCopyWith<PrinterSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterSettingsModelCopyWith<$Res> {
  factory $PrinterSettingsModelCopyWith(
    PrinterSettingsModel value,
    $Res Function(PrinterSettingsModel) then,
  ) = _$PrinterSettingsModelCopyWithImpl<$Res, PrinterSettingsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'default_printer') PrinterModel? defaultPrinter,
    @JsonKey(name: 'all_printers') List<PrinterModel> allPrinters,
  });

  $PrinterModelCopyWith<$Res>? get defaultPrinter;
}

/// @nodoc
class _$PrinterSettingsModelCopyWithImpl<
  $Res,
  $Val extends PrinterSettingsModel
>
    implements $PrinterSettingsModelCopyWith<$Res> {
  _$PrinterSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? defaultPrinter = freezed, Object? allPrinters = null}) {
    return _then(
      _value.copyWith(
            defaultPrinter: freezed == defaultPrinter
                ? _value.defaultPrinter
                : defaultPrinter // ignore: cast_nullable_to_non_nullable
                      as PrinterModel?,
            allPrinters: null == allPrinters
                ? _value.allPrinters
                : allPrinters // ignore: cast_nullable_to_non_nullable
                      as List<PrinterModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterModelCopyWith<$Res>? get defaultPrinter {
    if (_value.defaultPrinter == null) {
      return null;
    }

    return $PrinterModelCopyWith<$Res>(_value.defaultPrinter!, (value) {
      return _then(_value.copyWith(defaultPrinter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrinterSettingsModelImplCopyWith<$Res>
    implements $PrinterSettingsModelCopyWith<$Res> {
  factory _$$PrinterSettingsModelImplCopyWith(
    _$PrinterSettingsModelImpl value,
    $Res Function(_$PrinterSettingsModelImpl) then,
  ) = __$$PrinterSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'default_printer') PrinterModel? defaultPrinter,
    @JsonKey(name: 'all_printers') List<PrinterModel> allPrinters,
  });

  @override
  $PrinterModelCopyWith<$Res>? get defaultPrinter;
}

/// @nodoc
class __$$PrinterSettingsModelImplCopyWithImpl<$Res>
    extends _$PrinterSettingsModelCopyWithImpl<$Res, _$PrinterSettingsModelImpl>
    implements _$$PrinterSettingsModelImplCopyWith<$Res> {
  __$$PrinterSettingsModelImplCopyWithImpl(
    _$PrinterSettingsModelImpl _value,
    $Res Function(_$PrinterSettingsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? defaultPrinter = freezed, Object? allPrinters = null}) {
    return _then(
      _$PrinterSettingsModelImpl(
        defaultPrinter: freezed == defaultPrinter
            ? _value.defaultPrinter
            : defaultPrinter // ignore: cast_nullable_to_non_nullable
                  as PrinterModel?,
        allPrinters: null == allPrinters
            ? _value._allPrinters
            : allPrinters // ignore: cast_nullable_to_non_nullable
                  as List<PrinterModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrinterSettingsModelImpl implements _PrinterSettingsModel {
  const _$PrinterSettingsModelImpl({
    @JsonKey(name: 'default_printer') this.defaultPrinter,
    @JsonKey(name: 'all_printers')
    final List<PrinterModel> allPrinters = const [],
  }) : _allPrinters = allPrinters;

  factory _$PrinterSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterSettingsModelImplFromJson(json);

  @override
  @JsonKey(name: 'default_printer')
  final PrinterModel? defaultPrinter;
  final List<PrinterModel> _allPrinters;
  @override
  @JsonKey(name: 'all_printers')
  List<PrinterModel> get allPrinters {
    if (_allPrinters is EqualUnmodifiableListView) return _allPrinters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPrinters);
  }

  @override
  String toString() {
    return 'PrinterSettingsModel(defaultPrinter: $defaultPrinter, allPrinters: $allPrinters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterSettingsModelImpl &&
            (identical(other.defaultPrinter, defaultPrinter) ||
                other.defaultPrinter == defaultPrinter) &&
            const DeepCollectionEquality().equals(
              other._allPrinters,
              _allPrinters,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultPrinter,
    const DeepCollectionEquality().hash(_allPrinters),
  );

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterSettingsModelImplCopyWith<_$PrinterSettingsModelImpl>
  get copyWith =>
      __$$PrinterSettingsModelImplCopyWithImpl<_$PrinterSettingsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterSettingsModelImplToJson(this);
  }
}

abstract class _PrinterSettingsModel implements PrinterSettingsModel {
  const factory _PrinterSettingsModel({
    @JsonKey(name: 'default_printer') final PrinterModel? defaultPrinter,
    @JsonKey(name: 'all_printers') final List<PrinterModel> allPrinters,
  }) = _$PrinterSettingsModelImpl;

  factory _PrinterSettingsModel.fromJson(Map<String, dynamic> json) =
      _$PrinterSettingsModelImpl.fromJson;

  @override
  @JsonKey(name: 'default_printer')
  PrinterModel? get defaultPrinter;
  @override
  @JsonKey(name: 'all_printers')
  List<PrinterModel> get allPrinters;

  /// Create a copy of PrinterSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterSettingsModelImplCopyWith<_$PrinterSettingsModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PrinterModel _$PrinterModelFromJson(Map<String, dynamic> json) {
  return _PrinterModel.fromJson(json);
}

/// @nodoc
mixin _$PrinterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_type')
  String get connectionType => throw _privateConstructorUsedError; // 'bluetooth', 'usb', 'network'
  @JsonKey(name: 'mac_address')
  String? get macAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'paper_width')
  int get paperWidth => throw _privateConstructorUsedError; // 58, 80
  @JsonKey(name: 'default')
  bool get defaultStatus => throw _privateConstructorUsedError;

  /// Serializes this PrinterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterModelCopyWith<PrinterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterModelCopyWith<$Res> {
  factory $PrinterModelCopyWith(
    PrinterModel value,
    $Res Function(PrinterModel) then,
  ) = _$PrinterModelCopyWithImpl<$Res, PrinterModel>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'connection_type') String connectionType,
    @JsonKey(name: 'mac_address') String? macAddress,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'paper_width') int paperWidth,
    @JsonKey(name: 'default') bool defaultStatus,
  });
}

/// @nodoc
class _$PrinterModelCopyWithImpl<$Res, $Val extends PrinterModel>
    implements $PrinterModelCopyWith<$Res> {
  _$PrinterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectionType = null,
    Object? macAddress = freezed,
    Object? ipAddress = freezed,
    Object? paperWidth = null,
    Object? defaultStatus = null,
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
            connectionType: null == connectionType
                ? _value.connectionType
                : connectionType // ignore: cast_nullable_to_non_nullable
                      as String,
            macAddress: freezed == macAddress
                ? _value.macAddress
                : macAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            ipAddress: freezed == ipAddress
                ? _value.ipAddress
                : ipAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            paperWidth: null == paperWidth
                ? _value.paperWidth
                : paperWidth // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultStatus: null == defaultStatus
                ? _value.defaultStatus
                : defaultStatus // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrinterModelImplCopyWith<$Res>
    implements $PrinterModelCopyWith<$Res> {
  factory _$$PrinterModelImplCopyWith(
    _$PrinterModelImpl value,
    $Res Function(_$PrinterModelImpl) then,
  ) = __$$PrinterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'connection_type') String connectionType,
    @JsonKey(name: 'mac_address') String? macAddress,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'paper_width') int paperWidth,
    @JsonKey(name: 'default') bool defaultStatus,
  });
}

/// @nodoc
class __$$PrinterModelImplCopyWithImpl<$Res>
    extends _$PrinterModelCopyWithImpl<$Res, _$PrinterModelImpl>
    implements _$$PrinterModelImplCopyWith<$Res> {
  __$$PrinterModelImplCopyWithImpl(
    _$PrinterModelImpl _value,
    $Res Function(_$PrinterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? connectionType = null,
    Object? macAddress = freezed,
    Object? ipAddress = freezed,
    Object? paperWidth = null,
    Object? defaultStatus = null,
  }) {
    return _then(
      _$PrinterModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        connectionType: null == connectionType
            ? _value.connectionType
            : connectionType // ignore: cast_nullable_to_non_nullable
                  as String,
        macAddress: freezed == macAddress
            ? _value.macAddress
            : macAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipAddress: freezed == ipAddress
            ? _value.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        paperWidth: null == paperWidth
            ? _value.paperWidth
            : paperWidth // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultStatus: null == defaultStatus
            ? _value.defaultStatus
            : defaultStatus // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrinterModelImpl implements _PrinterModel {
  const _$PrinterModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'connection_type') required this.connectionType,
    @JsonKey(name: 'mac_address') this.macAddress,
    @JsonKey(name: 'ip_address') this.ipAddress,
    @JsonKey(name: 'paper_width') required this.paperWidth,
    @JsonKey(name: 'default') this.defaultStatus = false,
  });

  factory _$PrinterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'connection_type')
  final String connectionType;
  // 'bluetooth', 'usb', 'network'
  @override
  @JsonKey(name: 'mac_address')
  final String? macAddress;
  @override
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @override
  @JsonKey(name: 'paper_width')
  final int paperWidth;
  // 58, 80
  @override
  @JsonKey(name: 'default')
  final bool defaultStatus;

  @override
  String toString() {
    return 'PrinterModel(id: $id, name: $name, connectionType: $connectionType, macAddress: $macAddress, ipAddress: $ipAddress, paperWidth: $paperWidth, defaultStatus: $defaultStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.connectionType, connectionType) ||
                other.connectionType == connectionType) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.paperWidth, paperWidth) ||
                other.paperWidth == paperWidth) &&
            (identical(other.defaultStatus, defaultStatus) ||
                other.defaultStatus == defaultStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    connectionType,
    macAddress,
    ipAddress,
    paperWidth,
    defaultStatus,
  );

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterModelImplCopyWith<_$PrinterModelImpl> get copyWith =>
      __$$PrinterModelImplCopyWithImpl<_$PrinterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterModelImplToJson(this);
  }
}

abstract class _PrinterModel implements PrinterModel {
  const factory _PrinterModel({
    required final int id,
    required final String name,
    @JsonKey(name: 'connection_type') required final String connectionType,
    @JsonKey(name: 'mac_address') final String? macAddress,
    @JsonKey(name: 'ip_address') final String? ipAddress,
    @JsonKey(name: 'paper_width') required final int paperWidth,
    @JsonKey(name: 'default') final bool defaultStatus,
  }) = _$PrinterModelImpl;

  factory _PrinterModel.fromJson(Map<String, dynamic> json) =
      _$PrinterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'connection_type')
  String get connectionType; // 'bluetooth', 'usb', 'network'
  @override
  @JsonKey(name: 'mac_address')
  String? get macAddress;
  @override
  @JsonKey(name: 'ip_address')
  String? get ipAddress;
  @override
  @JsonKey(name: 'paper_width')
  int get paperWidth; // 58, 80
  @override
  @JsonKey(name: 'default')
  bool get defaultStatus;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterModelImplCopyWith<_$PrinterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
