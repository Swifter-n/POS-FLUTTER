// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) {
  return _ReservationModel.fromJson(json);
}

/// @nodoc
mixin _$ReservationModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_phone')
  String? get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'guest_count')
  int get guestCount => throw _privateConstructorUsedError; // Waktu reservasi (biasanya dalam format ISO-8601 atau YYYY-MM-DD HH:MM:SS)
  @JsonKey(name: 'reservation_time')
  String get reservationTime => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // 'booked', 'seated', 'cancelled', 'completed'
  String? get notes =>
      throw _privateConstructorUsedError; // Foreign key (Berguna saat membuat/update data sebelum relasi di-load)
  @JsonKey(name: 'table_id')
  int? get tableId => throw _privateConstructorUsedError; // Nested object dari relasi tabel
  TableModel? get table => throw _privateConstructorUsedError;

  /// Serializes this ReservationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationModelCopyWith<ReservationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationModelCopyWith<$Res> {
  factory $ReservationModelCopyWith(
    ReservationModel value,
    $Res Function(ReservationModel) then,
  ) = _$ReservationModelCopyWithImpl<$Res, ReservationModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'customer_name') String customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'guest_count') int guestCount,
    @JsonKey(name: 'reservation_time') String reservationTime,
    String? status,
    String? notes,
    @JsonKey(name: 'table_id') int? tableId,
    TableModel? table,
  });

  $TableModelCopyWith<$Res>? get table;
}

/// @nodoc
class _$ReservationModelCopyWithImpl<$Res, $Val extends ReservationModel>
    implements $ReservationModelCopyWith<$Res> {
  _$ReservationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerPhone = freezed,
    Object? guestCount = null,
    Object? reservationTime = null,
    Object? status = freezed,
    Object? notes = freezed,
    Object? tableId = freezed,
    Object? table = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            customerPhone: freezed == customerPhone
                ? _value.customerPhone
                : customerPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            guestCount: null == guestCount
                ? _value.guestCount
                : guestCount // ignore: cast_nullable_to_non_nullable
                      as int,
            reservationTime: null == reservationTime
                ? _value.reservationTime
                : reservationTime // ignore: cast_nullable_to_non_nullable
                      as String,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            tableId: freezed == tableId
                ? _value.tableId
                : tableId // ignore: cast_nullable_to_non_nullable
                      as int?,
            table: freezed == table
                ? _value.table
                : table // ignore: cast_nullable_to_non_nullable
                      as TableModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableModelCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $TableModelCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReservationModelImplCopyWith<$Res>
    implements $ReservationModelCopyWith<$Res> {
  factory _$$ReservationModelImplCopyWith(
    _$ReservationModelImpl value,
    $Res Function(_$ReservationModelImpl) then,
  ) = __$$ReservationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'customer_name') String customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'guest_count') int guestCount,
    @JsonKey(name: 'reservation_time') String reservationTime,
    String? status,
    String? notes,
    @JsonKey(name: 'table_id') int? tableId,
    TableModel? table,
  });

  @override
  $TableModelCopyWith<$Res>? get table;
}

/// @nodoc
class __$$ReservationModelImplCopyWithImpl<$Res>
    extends _$ReservationModelCopyWithImpl<$Res, _$ReservationModelImpl>
    implements _$$ReservationModelImplCopyWith<$Res> {
  __$$ReservationModelImplCopyWithImpl(
    _$ReservationModelImpl _value,
    $Res Function(_$ReservationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerPhone = freezed,
    Object? guestCount = null,
    Object? reservationTime = null,
    Object? status = freezed,
    Object? notes = freezed,
    Object? tableId = freezed,
    Object? table = freezed,
  }) {
    return _then(
      _$ReservationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        customerPhone: freezed == customerPhone
            ? _value.customerPhone
            : customerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        guestCount: null == guestCount
            ? _value.guestCount
            : guestCount // ignore: cast_nullable_to_non_nullable
                  as int,
        reservationTime: null == reservationTime
            ? _value.reservationTime
            : reservationTime // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as int?,
        table: freezed == table
            ? _value.table
            : table // ignore: cast_nullable_to_non_nullable
                  as TableModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationModelImpl implements _ReservationModel {
  const _$ReservationModelImpl({
    required this.id,
    @JsonKey(name: 'customer_name') required this.customerName,
    @JsonKey(name: 'customer_phone') this.customerPhone,
    @JsonKey(name: 'guest_count') required this.guestCount,
    @JsonKey(name: 'reservation_time') required this.reservationTime,
    this.status,
    this.notes,
    @JsonKey(name: 'table_id') this.tableId,
    this.table,
  });

  factory _$ReservationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_phone')
  final String? customerPhone;
  @override
  @JsonKey(name: 'guest_count')
  final int guestCount;
  // Waktu reservasi (biasanya dalam format ISO-8601 atau YYYY-MM-DD HH:MM:SS)
  @override
  @JsonKey(name: 'reservation_time')
  final String reservationTime;
  @override
  final String? status;
  // 'booked', 'seated', 'cancelled', 'completed'
  @override
  final String? notes;
  // Foreign key (Berguna saat membuat/update data sebelum relasi di-load)
  @override
  @JsonKey(name: 'table_id')
  final int? tableId;
  // Nested object dari relasi tabel
  @override
  final TableModel? table;

  @override
  String toString() {
    return 'ReservationModel(id: $id, customerName: $customerName, customerPhone: $customerPhone, guestCount: $guestCount, reservationTime: $reservationTime, status: $status, notes: $notes, tableId: $tableId, table: $table)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount) &&
            (identical(other.reservationTime, reservationTime) ||
                other.reservationTime == reservationTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.table, table) || other.table == table));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    customerName,
    customerPhone,
    guestCount,
    reservationTime,
    status,
    notes,
    tableId,
    table,
  );

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationModelImplCopyWith<_$ReservationModelImpl> get copyWith =>
      __$$ReservationModelImplCopyWithImpl<_$ReservationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationModelImplToJson(this);
  }
}

abstract class _ReservationModel implements ReservationModel {
  const factory _ReservationModel({
    required final int id,
    @JsonKey(name: 'customer_name') required final String customerName,
    @JsonKey(name: 'customer_phone') final String? customerPhone,
    @JsonKey(name: 'guest_count') required final int guestCount,
    @JsonKey(name: 'reservation_time') required final String reservationTime,
    final String? status,
    final String? notes,
    @JsonKey(name: 'table_id') final int? tableId,
    final TableModel? table,
  }) = _$ReservationModelImpl;

  factory _ReservationModel.fromJson(Map<String, dynamic> json) =
      _$ReservationModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_phone')
  String? get customerPhone;
  @override
  @JsonKey(name: 'guest_count')
  int get guestCount; // Waktu reservasi (biasanya dalam format ISO-8601 atau YYYY-MM-DD HH:MM:SS)
  @override
  @JsonKey(name: 'reservation_time')
  String get reservationTime;
  @override
  String? get status; // 'booked', 'seated', 'cancelled', 'completed'
  @override
  String? get notes; // Foreign key (Berguna saat membuat/update data sebelum relasi di-load)
  @override
  @JsonKey(name: 'table_id')
  int? get tableId; // Nested object dari relasi tabel
  @override
  TableModel? get table;

  /// Create a copy of ReservationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationModelImplCopyWith<_$ReservationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
