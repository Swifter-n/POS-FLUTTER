// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) {
  return _ShiftModel.fromJson(json);
}

/// @nodoc
mixin _$ShiftModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashier_name')
  String? get cashierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
  double? get openingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
  double? get closingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
  double? get expectedCash => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_sales', fromJson: _parseDouble)
  double? get cashSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_sales', fromJson: _parseDouble)
  double? get cardSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
  double? get totalPointsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transactions')
  int? get totalTransactions => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'opened_at')
  String? get openedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'closed_at')
  String? get closedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'closing_note')
  String? get closingNote => throw _privateConstructorUsedError;

  /// Serializes this ShiftModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftModelCopyWith<ShiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftModelCopyWith<$Res> {
  factory $ShiftModelCopyWith(
    ShiftModel value,
    $Res Function(ShiftModel) then,
  ) = _$ShiftModelCopyWithImpl<$Res, ShiftModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'cashier_name') String? cashierName,
    @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
    double? openingAmount,
    @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
    double? closingAmount,
    @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
    double? expectedCash,
    @JsonKey(name: 'cash_sales', fromJson: _parseDouble) double? cashSales,
    @JsonKey(name: 'card_sales', fromJson: _parseDouble) double? cardSales,
    @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
    double? totalPointsRedeemed,
    @JsonKey(name: 'total_transactions') int? totalTransactions,
    String? status,
    @JsonKey(name: 'opened_at') String? openedAt,
    @JsonKey(name: 'closed_at') String? closedAt,
    @JsonKey(name: 'closing_note') String? closingNote,
  });
}

/// @nodoc
class _$ShiftModelCopyWithImpl<$Res, $Val extends ShiftModel>
    implements $ShiftModelCopyWith<$Res> {
  _$ShiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? cashierName = freezed,
    Object? openingAmount = freezed,
    Object? closingAmount = freezed,
    Object? expectedCash = freezed,
    Object? cashSales = freezed,
    Object? cardSales = freezed,
    Object? totalPointsRedeemed = freezed,
    Object? totalTransactions = freezed,
    Object? status = freezed,
    Object? openedAt = freezed,
    Object? closedAt = freezed,
    Object? closingNote = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            cashierName: freezed == cashierName
                ? _value.cashierName
                : cashierName // ignore: cast_nullable_to_non_nullable
                      as String?,
            openingAmount: freezed == openingAmount
                ? _value.openingAmount
                : openingAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            closingAmount: freezed == closingAmount
                ? _value.closingAmount
                : closingAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            expectedCash: freezed == expectedCash
                ? _value.expectedCash
                : expectedCash // ignore: cast_nullable_to_non_nullable
                      as double?,
            cashSales: freezed == cashSales
                ? _value.cashSales
                : cashSales // ignore: cast_nullable_to_non_nullable
                      as double?,
            cardSales: freezed == cardSales
                ? _value.cardSales
                : cardSales // ignore: cast_nullable_to_non_nullable
                      as double?,
            totalPointsRedeemed: freezed == totalPointsRedeemed
                ? _value.totalPointsRedeemed
                : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
                      as double?,
            totalTransactions: freezed == totalTransactions
                ? _value.totalTransactions
                : totalTransactions // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            openedAt: freezed == openedAt
                ? _value.openedAt
                : openedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            closedAt: freezed == closedAt
                ? _value.closedAt
                : closedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            closingNote: freezed == closingNote
                ? _value.closingNote
                : closingNote // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShiftModelImplCopyWith<$Res>
    implements $ShiftModelCopyWith<$Res> {
  factory _$$ShiftModelImplCopyWith(
    _$ShiftModelImpl value,
    $Res Function(_$ShiftModelImpl) then,
  ) = __$$ShiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'cashier_name') String? cashierName,
    @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
    double? openingAmount,
    @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
    double? closingAmount,
    @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
    double? expectedCash,
    @JsonKey(name: 'cash_sales', fromJson: _parseDouble) double? cashSales,
    @JsonKey(name: 'card_sales', fromJson: _parseDouble) double? cardSales,
    @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
    double? totalPointsRedeemed,
    @JsonKey(name: 'total_transactions') int? totalTransactions,
    String? status,
    @JsonKey(name: 'opened_at') String? openedAt,
    @JsonKey(name: 'closed_at') String? closedAt,
    @JsonKey(name: 'closing_note') String? closingNote,
  });
}

/// @nodoc
class __$$ShiftModelImplCopyWithImpl<$Res>
    extends _$ShiftModelCopyWithImpl<$Res, _$ShiftModelImpl>
    implements _$$ShiftModelImplCopyWith<$Res> {
  __$$ShiftModelImplCopyWithImpl(
    _$ShiftModelImpl _value,
    $Res Function(_$ShiftModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? cashierName = freezed,
    Object? openingAmount = freezed,
    Object? closingAmount = freezed,
    Object? expectedCash = freezed,
    Object? cashSales = freezed,
    Object? cardSales = freezed,
    Object? totalPointsRedeemed = freezed,
    Object? totalTransactions = freezed,
    Object? status = freezed,
    Object? openedAt = freezed,
    Object? closedAt = freezed,
    Object? closingNote = freezed,
  }) {
    return _then(
      _$ShiftModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        cashierName: freezed == cashierName
            ? _value.cashierName
            : cashierName // ignore: cast_nullable_to_non_nullable
                  as String?,
        openingAmount: freezed == openingAmount
            ? _value.openingAmount
            : openingAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        closingAmount: freezed == closingAmount
            ? _value.closingAmount
            : closingAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        expectedCash: freezed == expectedCash
            ? _value.expectedCash
            : expectedCash // ignore: cast_nullable_to_non_nullable
                  as double?,
        cashSales: freezed == cashSales
            ? _value.cashSales
            : cashSales // ignore: cast_nullable_to_non_nullable
                  as double?,
        cardSales: freezed == cardSales
            ? _value.cardSales
            : cardSales // ignore: cast_nullable_to_non_nullable
                  as double?,
        totalPointsRedeemed: freezed == totalPointsRedeemed
            ? _value.totalPointsRedeemed
            : totalPointsRedeemed // ignore: cast_nullable_to_non_nullable
                  as double?,
        totalTransactions: freezed == totalTransactions
            ? _value.totalTransactions
            : totalTransactions // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        openedAt: freezed == openedAt
            ? _value.openedAt
            : openedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        closedAt: freezed == closedAt
            ? _value.closedAt
            : closedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        closingNote: freezed == closingNote
            ? _value.closingNote
            : closingNote // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftModelImpl implements _ShiftModel {
  const _$ShiftModelImpl({
    this.id,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'cashier_name') this.cashierName,
    @JsonKey(name: 'opening_amount', fromJson: _parseDouble) this.openingAmount,
    @JsonKey(name: 'closing_amount', fromJson: _parseDouble) this.closingAmount,
    @JsonKey(name: 'expected_cash', fromJson: _parseDouble) this.expectedCash,
    @JsonKey(name: 'cash_sales', fromJson: _parseDouble) this.cashSales,
    @JsonKey(name: 'card_sales', fromJson: _parseDouble) this.cardSales,
    @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
    this.totalPointsRedeemed,
    @JsonKey(name: 'total_transactions') this.totalTransactions,
    this.status,
    @JsonKey(name: 'opened_at') this.openedAt,
    @JsonKey(name: 'closed_at') this.closedAt,
    @JsonKey(name: 'closing_note') this.closingNote,
  });

  factory _$ShiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'cashier_name')
  final String? cashierName;
  @override
  @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
  final double? openingAmount;
  @override
  @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
  final double? closingAmount;
  @override
  @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
  final double? expectedCash;
  @override
  @JsonKey(name: 'cash_sales', fromJson: _parseDouble)
  final double? cashSales;
  @override
  @JsonKey(name: 'card_sales', fromJson: _parseDouble)
  final double? cardSales;
  @override
  @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
  final double? totalPointsRedeemed;
  @override
  @JsonKey(name: 'total_transactions')
  final int? totalTransactions;
  @override
  final String? status;
  @override
  @JsonKey(name: 'opened_at')
  final String? openedAt;
  @override
  @JsonKey(name: 'closed_at')
  final String? closedAt;
  @override
  @JsonKey(name: 'closing_note')
  final String? closingNote;

  @override
  String toString() {
    return 'ShiftModel(id: $id, userId: $userId, cashierName: $cashierName, openingAmount: $openingAmount, closingAmount: $closingAmount, expectedCash: $expectedCash, cashSales: $cashSales, cardSales: $cardSales, totalPointsRedeemed: $totalPointsRedeemed, totalTransactions: $totalTransactions, status: $status, openedAt: $openedAt, closedAt: $closedAt, closingNote: $closingNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.cashierName, cashierName) ||
                other.cashierName == cashierName) &&
            (identical(other.openingAmount, openingAmount) ||
                other.openingAmount == openingAmount) &&
            (identical(other.closingAmount, closingAmount) ||
                other.closingAmount == closingAmount) &&
            (identical(other.expectedCash, expectedCash) ||
                other.expectedCash == expectedCash) &&
            (identical(other.cashSales, cashSales) ||
                other.cashSales == cashSales) &&
            (identical(other.cardSales, cardSales) ||
                other.cardSales == cardSales) &&
            (identical(other.totalPointsRedeemed, totalPointsRedeemed) ||
                other.totalPointsRedeemed == totalPointsRedeemed) &&
            (identical(other.totalTransactions, totalTransactions) ||
                other.totalTransactions == totalTransactions) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.closingNote, closingNote) ||
                other.closingNote == closingNote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    cashierName,
    openingAmount,
    closingAmount,
    expectedCash,
    cashSales,
    cardSales,
    totalPointsRedeemed,
    totalTransactions,
    status,
    openedAt,
    closedAt,
    closingNote,
  );

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      __$$ShiftModelImplCopyWithImpl<_$ShiftModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftModelImplToJson(this);
  }
}

abstract class _ShiftModel implements ShiftModel {
  const factory _ShiftModel({
    final int? id,
    @JsonKey(name: 'user_id') final int? userId,
    @JsonKey(name: 'cashier_name') final String? cashierName,
    @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
    final double? openingAmount,
    @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
    final double? closingAmount,
    @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
    final double? expectedCash,
    @JsonKey(name: 'cash_sales', fromJson: _parseDouble)
    final double? cashSales,
    @JsonKey(name: 'card_sales', fromJson: _parseDouble)
    final double? cardSales,
    @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
    final double? totalPointsRedeemed,
    @JsonKey(name: 'total_transactions') final int? totalTransactions,
    final String? status,
    @JsonKey(name: 'opened_at') final String? openedAt,
    @JsonKey(name: 'closed_at') final String? closedAt,
    @JsonKey(name: 'closing_note') final String? closingNote,
  }) = _$ShiftModelImpl;

  factory _ShiftModel.fromJson(Map<String, dynamic> json) =
      _$ShiftModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'cashier_name')
  String? get cashierName;
  @override
  @JsonKey(name: 'opening_amount', fromJson: _parseDouble)
  double? get openingAmount;
  @override
  @JsonKey(name: 'closing_amount', fromJson: _parseDouble)
  double? get closingAmount;
  @override
  @JsonKey(name: 'expected_cash', fromJson: _parseDouble)
  double? get expectedCash;
  @override
  @JsonKey(name: 'cash_sales', fromJson: _parseDouble)
  double? get cashSales;
  @override
  @JsonKey(name: 'card_sales', fromJson: _parseDouble)
  double? get cardSales;
  @override
  @JsonKey(name: 'total_points_redeemed', fromJson: _parseDouble)
  double? get totalPointsRedeemed;
  @override
  @JsonKey(name: 'total_transactions')
  int? get totalTransactions;
  @override
  String? get status;
  @override
  @JsonKey(name: 'opened_at')
  String? get openedAt;
  @override
  @JsonKey(name: 'closed_at')
  String? get closedAt;
  @override
  @JsonKey(name: 'closing_note')
  String? get closingNote;

  /// Create a copy of ShiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftModelImplCopyWith<_$ShiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
