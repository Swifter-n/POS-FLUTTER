// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TableEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableEventCopyWith<$Res> {
  factory $TableEventCopyWith(
    TableEvent value,
    $Res Function(TableEvent) then,
  ) = _$TableEventCopyWithImpl<$Res, TableEvent>;
}

/// @nodoc
class _$TableEventCopyWithImpl<$Res, $Val extends TableEvent>
    implements $TableEventCopyWith<$Res> {
  _$TableEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'TableEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements TableEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$MoveTableImplCopyWith<$Res> {
  factory _$$MoveTableImplCopyWith(
    _$MoveTableImpl value,
    $Res Function(_$MoveTableImpl) then,
  ) = __$$MoveTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tableId, double newX, double newY});
}

/// @nodoc
class __$$MoveTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$MoveTableImpl>
    implements _$$MoveTableImplCopyWith<$Res> {
  __$$MoveTableImplCopyWithImpl(
    _$MoveTableImpl _value,
    $Res Function(_$MoveTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? newX = null,
    Object? newY = null,
  }) {
    return _then(
      _$MoveTableImpl(
        tableId: null == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as int,
        newX: null == newX
            ? _value.newX
            : newX // ignore: cast_nullable_to_non_nullable
                  as double,
        newY: null == newY
            ? _value.newY
            : newY // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$MoveTableImpl implements _MoveTable {
  const _$MoveTableImpl({
    required this.tableId,
    required this.newX,
    required this.newY,
  });

  @override
  final int tableId;
  @override
  final double newX;
  @override
  final double newY;

  @override
  String toString() {
    return 'TableEvent.moveTable(tableId: $tableId, newX: $newX, newY: $newY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoveTableImpl &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.newX, newX) || other.newX == newX) &&
            (identical(other.newY, newY) || other.newY == newY));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId, newX, newY);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoveTableImplCopyWith<_$MoveTableImpl> get copyWith =>
      __$$MoveTableImplCopyWithImpl<_$MoveTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return moveTable(tableId, newX, newY);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return moveTable?.call(tableId, newX, newY);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (moveTable != null) {
      return moveTable(tableId, newX, newY);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return moveTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return moveTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (moveTable != null) {
      return moveTable(this);
    }
    return orElse();
  }
}

abstract class _MoveTable implements TableEvent {
  const factory _MoveTable({
    required final int tableId,
    required final double newX,
    required final double newY,
  }) = _$MoveTableImpl;

  int get tableId;
  double get newX;
  double get newY;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoveTableImplCopyWith<_$MoveTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavePositionsImplCopyWith<$Res> {
  factory _$$SavePositionsImplCopyWith(
    _$SavePositionsImpl value,
    $Res Function(_$SavePositionsImpl) then,
  ) = __$$SavePositionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavePositionsImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$SavePositionsImpl>
    implements _$$SavePositionsImplCopyWith<$Res> {
  __$$SavePositionsImplCopyWithImpl(
    _$SavePositionsImpl _value,
    $Res Function(_$SavePositionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SavePositionsImpl implements _SavePositions {
  const _$SavePositionsImpl();

  @override
  String toString() {
    return 'TableEvent.savePositions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavePositionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return savePositions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return savePositions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (savePositions != null) {
      return savePositions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return savePositions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return savePositions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (savePositions != null) {
      return savePositions(this);
    }
    return orElse();
  }
}

abstract class _SavePositions implements TableEvent {
  const factory _SavePositions() = _$SavePositionsImpl;
}

/// @nodoc
abstract class _$$AddTableImplCopyWith<$Res> {
  factory _$$AddTableImplCopyWith(
    _$AddTableImpl value,
    $Res Function(_$AddTableImpl) then,
  ) = __$$AddTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$AddTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$AddTableImpl>
    implements _$$AddTableImplCopyWith<$Res> {
  __$$AddTableImplCopyWithImpl(
    _$AddTableImpl _value,
    $Res Function(_$AddTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$AddTableImpl(
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$AddTableImpl implements _AddTable {
  const _$AddTableImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'TableEvent.addTable(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTableImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTableImplCopyWith<_$AddTableImpl> get copyWith =>
      __$$AddTableImplCopyWithImpl<_$AddTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return addTable(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return addTable?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (addTable != null) {
      return addTable(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return addTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return addTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (addTable != null) {
      return addTable(this);
    }
    return orElse();
  }
}

abstract class _AddTable implements TableEvent {
  const factory _AddTable(final Map<String, dynamic> data) = _$AddTableImpl;

  Map<String, dynamic> get data;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTableImplCopyWith<_$AddTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTableImplCopyWith<$Res> {
  factory _$$UpdateTableImplCopyWith(
    _$UpdateTableImpl value,
    $Res Function(_$UpdateTableImpl) then,
  ) = __$$UpdateTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, Map<String, dynamic> data});
}

/// @nodoc
class __$$UpdateTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$UpdateTableImpl>
    implements _$$UpdateTableImplCopyWith<$Res> {
  __$$UpdateTableImplCopyWithImpl(
    _$UpdateTableImpl _value,
    $Res Function(_$UpdateTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? data = null}) {
    return _then(
      _$UpdateTableImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTableImpl implements _UpdateTable {
  const _$UpdateTableImpl(this.id, final Map<String, dynamic> data)
    : _data = data;

  @override
  final int id;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'TableEvent.updateTable(id: $id, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTableImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTableImplCopyWith<_$UpdateTableImpl> get copyWith =>
      __$$UpdateTableImplCopyWithImpl<_$UpdateTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return updateTable(id, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return updateTable?.call(id, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (updateTable != null) {
      return updateTable(id, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return updateTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return updateTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (updateTable != null) {
      return updateTable(this);
    }
    return orElse();
  }
}

abstract class _UpdateTable implements TableEvent {
  const factory _UpdateTable(final int id, final Map<String, dynamic> data) =
      _$UpdateTableImpl;

  int get id;
  Map<String, dynamic> get data;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTableImplCopyWith<_$UpdateTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTableImplCopyWith<$Res> {
  factory _$$DeleteTableImplCopyWith(
    _$DeleteTableImpl value,
    $Res Function(_$DeleteTableImpl) then,
  ) = __$$DeleteTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$DeleteTableImpl>
    implements _$$DeleteTableImplCopyWith<$Res> {
  __$$DeleteTableImplCopyWithImpl(
    _$DeleteTableImpl _value,
    $Res Function(_$DeleteTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$DeleteTableImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DeleteTableImpl implements _DeleteTable {
  const _$DeleteTableImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TableEvent.deleteTable(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTableImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTableImplCopyWith<_$DeleteTableImpl> get copyWith =>
      __$$DeleteTableImplCopyWithImpl<_$DeleteTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return deleteTable(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return deleteTable?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (deleteTable != null) {
      return deleteTable(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return deleteTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return deleteTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (deleteTable != null) {
      return deleteTable(this);
    }
    return orElse();
  }
}

abstract class _DeleteTable implements TableEvent {
  const factory _DeleteTable(final int id) = _$DeleteTableImpl;

  int get id;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTableImplCopyWith<_$DeleteTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
    _$ClearImpl value,
    $Res Function(_$ClearImpl) then,
  ) = __$$ClearImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tableId});
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tableId = null}) {
    return _then(
      _$ClearImpl(
        null == tableId
            ? _value.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl(this.tableId);

  @override
  final int tableId;

  @override
  String toString() {
    return 'TableEvent.clear(tableId: $tableId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearImpl &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearImplCopyWith<_$ClearImpl> get copyWith =>
      __$$ClearImplCopyWithImpl<_$ClearImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return clear(tableId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return clear?.call(tableId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(tableId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements TableEvent {
  const factory _Clear(final int tableId) = _$ClearImpl;

  int get tableId;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearImplCopyWith<_$ClearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VoidOrderImplCopyWith<$Res> {
  factory _$$VoidOrderImplCopyWith(
    _$VoidOrderImpl value,
    $Res Function(_$VoidOrderImpl) then,
  ) = __$$VoidOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, String? reason});
}

/// @nodoc
class __$$VoidOrderImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$VoidOrderImpl>
    implements _$$VoidOrderImplCopyWith<$Res> {
  __$$VoidOrderImplCopyWithImpl(
    _$VoidOrderImpl _value,
    $Res Function(_$VoidOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? reason = freezed}) {
    return _then(
      _$VoidOrderImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VoidOrderImpl implements _VoidOrder {
  const _$VoidOrderImpl({required this.orderId, this.reason});

  @override
  final int orderId;
  @override
  final String? reason;

  @override
  String toString() {
    return 'TableEvent.voidOrder(orderId: $orderId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoidOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, reason);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoidOrderImplCopyWith<_$VoidOrderImpl> get copyWith =>
      __$$VoidOrderImplCopyWithImpl<_$VoidOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return voidOrder(orderId, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return voidOrder?.call(orderId, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (voidOrder != null) {
      return voidOrder(orderId, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return voidOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return voidOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (voidOrder != null) {
      return voidOrder(this);
    }
    return orElse();
  }
}

abstract class _VoidOrder implements TableEvent {
  const factory _VoidOrder({required final int orderId, final String? reason}) =
      _$VoidOrderImpl;

  int get orderId;
  String? get reason;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoidOrderImplCopyWith<_$VoidOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferTableImplCopyWith<$Res> {
  factory _$$TransferTableImplCopyWith(
    _$TransferTableImpl value,
    $Res Function(_$TransferTableImpl) then,
  ) = __$$TransferTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, String targetTableCode});
}

/// @nodoc
class __$$TransferTableImplCopyWithImpl<$Res>
    extends _$TableEventCopyWithImpl<$Res, _$TransferTableImpl>
    implements _$$TransferTableImplCopyWith<$Res> {
  __$$TransferTableImplCopyWithImpl(
    _$TransferTableImpl _value,
    $Res Function(_$TransferTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? targetTableCode = null}) {
    return _then(
      _$TransferTableImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        targetTableCode: null == targetTableCode
            ? _value.targetTableCode
            : targetTableCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransferTableImpl implements _TransferTable {
  const _$TransferTableImpl({
    required this.orderId,
    required this.targetTableCode,
  });

  @override
  final int orderId;
  @override
  final String targetTableCode;

  @override
  String toString() {
    return 'TableEvent.transferTable(orderId: $orderId, targetTableCode: $targetTableCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferTableImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.targetTableCode, targetTableCode) ||
                other.targetTableCode == targetTableCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, targetTableCode);

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferTableImplCopyWith<_$TransferTableImpl> get copyWith =>
      __$$TransferTableImplCopyWithImpl<_$TransferTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int tableId, double newX, double newY) moveTable,
    required TResult Function() savePositions,
    required TResult Function(Map<String, dynamic> data) addTable,
    required TResult Function(int id, Map<String, dynamic> data) updateTable,
    required TResult Function(int id) deleteTable,
    required TResult Function(int tableId) clear,
    required TResult Function(int orderId, String? reason) voidOrder,
    required TResult Function(int orderId, String targetTableCode)
    transferTable,
  }) {
    return transferTable(orderId, targetTableCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int tableId, double newX, double newY)? moveTable,
    TResult? Function()? savePositions,
    TResult? Function(Map<String, dynamic> data)? addTable,
    TResult? Function(int id, Map<String, dynamic> data)? updateTable,
    TResult? Function(int id)? deleteTable,
    TResult? Function(int tableId)? clear,
    TResult? Function(int orderId, String? reason)? voidOrder,
    TResult? Function(int orderId, String targetTableCode)? transferTable,
  }) {
    return transferTable?.call(orderId, targetTableCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int tableId, double newX, double newY)? moveTable,
    TResult Function()? savePositions,
    TResult Function(Map<String, dynamic> data)? addTable,
    TResult Function(int id, Map<String, dynamic> data)? updateTable,
    TResult Function(int id)? deleteTable,
    TResult Function(int tableId)? clear,
    TResult Function(int orderId, String? reason)? voidOrder,
    TResult Function(int orderId, String targetTableCode)? transferTable,
    required TResult orElse(),
  }) {
    if (transferTable != null) {
      return transferTable(orderId, targetTableCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_MoveTable value) moveTable,
    required TResult Function(_SavePositions value) savePositions,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_DeleteTable value) deleteTable,
    required TResult Function(_Clear value) clear,
    required TResult Function(_VoidOrder value) voidOrder,
    required TResult Function(_TransferTable value) transferTable,
  }) {
    return transferTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_MoveTable value)? moveTable,
    TResult? Function(_SavePositions value)? savePositions,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_DeleteTable value)? deleteTable,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_VoidOrder value)? voidOrder,
    TResult? Function(_TransferTable value)? transferTable,
  }) {
    return transferTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_MoveTable value)? moveTable,
    TResult Function(_SavePositions value)? savePositions,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_DeleteTable value)? deleteTable,
    TResult Function(_Clear value)? clear,
    TResult Function(_VoidOrder value)? voidOrder,
    TResult Function(_TransferTable value)? transferTable,
    required TResult orElse(),
  }) {
    if (transferTable != null) {
      return transferTable(this);
    }
    return orElse();
  }
}

abstract class _TransferTable implements TableEvent {
  const factory _TransferTable({
    required final int orderId,
    required final String targetTableCode,
  }) = _$TransferTableImpl;

  int get orderId;
  String get targetTableCode;

  /// Create a copy of TableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferTableImplCopyWith<_$TransferTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableStateCopyWith<$Res> {
  factory $TableStateCopyWith(
    TableState value,
    $Res Function(TableState) then,
  ) = _$TableStateCopyWithImpl<$Res, TableState>;
}

/// @nodoc
class _$TableStateCopyWithImpl<$Res, $Val extends TableState>
    implements $TableStateCopyWith<$Res> {
  _$TableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TableState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TableState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TableState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TableState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TableModel> tables, bool isSavingLayout});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tables = null, Object? isSavingLayout = null}) {
    return _then(
      _$LoadedImpl(
        tables: null == tables
            ? _value._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<TableModel>,
        isSavingLayout: null == isSavingLayout
            ? _value.isSavingLayout
            : isSavingLayout // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({
    required final List<TableModel> tables,
    this.isSavingLayout = false,
  }) : _tables = tables;

  final List<TableModel> _tables;
  @override
  List<TableModel> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  @JsonKey()
  final bool isSavingLayout;

  @override
  String toString() {
    return 'TableState.loaded(tables: $tables, isSavingLayout: $isSavingLayout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.isSavingLayout, isSavingLayout) ||
                other.isSavingLayout == isSavingLayout));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tables),
    isSavingLayout,
  );

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loaded(tables, isSavingLayout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tables, isSavingLayout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tables, isSavingLayout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements TableState {
  const factory _Loaded({
    required final List<TableModel> tables,
    final bool isSavingLayout,
  }) = _$LoadedImpl;

  List<TableModel> get tables;
  bool get isSavingLayout;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessTransferTableImplCopyWith<$Res> {
  factory _$$SuccessTransferTableImplCopyWith(
    _$SuccessTransferTableImpl value,
    $Res Function(_$SuccessTransferTableImpl) then,
  ) = __$$SuccessTransferTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessTransferTableImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$SuccessTransferTableImpl>
    implements _$$SuccessTransferTableImplCopyWith<$Res> {
  __$$SuccessTransferTableImplCopyWithImpl(
    _$SuccessTransferTableImpl _value,
    $Res Function(_$SuccessTransferTableImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessTransferTableImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessTransferTableImpl implements _SuccessTransferTable {
  const _$SuccessTransferTableImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TableState.successTransferTable(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessTransferTableImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessTransferTableImplCopyWith<_$SuccessTransferTableImpl>
  get copyWith =>
      __$$SuccessTransferTableImplCopyWithImpl<_$SuccessTransferTableImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return successTransferTable(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return successTransferTable?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successTransferTable != null) {
      return successTransferTable(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return successTransferTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return successTransferTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successTransferTable != null) {
      return successTransferTable(this);
    }
    return orElse();
  }
}

abstract class _SuccessTransferTable implements TableState {
  const factory _SuccessTransferTable(final String message) =
      _$SuccessTransferTableImpl;

  String get message;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessTransferTableImplCopyWith<_$SuccessTransferTableImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessVoidOrderImplCopyWith<$Res> {
  factory _$$SuccessVoidOrderImplCopyWith(
    _$SuccessVoidOrderImpl value,
    $Res Function(_$SuccessVoidOrderImpl) then,
  ) = __$$SuccessVoidOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessVoidOrderImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$SuccessVoidOrderImpl>
    implements _$$SuccessVoidOrderImplCopyWith<$Res> {
  __$$SuccessVoidOrderImplCopyWithImpl(
    _$SuccessVoidOrderImpl _value,
    $Res Function(_$SuccessVoidOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessVoidOrderImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessVoidOrderImpl implements _SuccessVoidOrder {
  const _$SuccessVoidOrderImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TableState.successVoidOrder(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessVoidOrderImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessVoidOrderImplCopyWith<_$SuccessVoidOrderImpl> get copyWith =>
      __$$SuccessVoidOrderImplCopyWithImpl<_$SuccessVoidOrderImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return successVoidOrder(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return successVoidOrder?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successVoidOrder != null) {
      return successVoidOrder(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return successVoidOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return successVoidOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successVoidOrder != null) {
      return successVoidOrder(this);
    }
    return orElse();
  }
}

abstract class _SuccessVoidOrder implements TableState {
  const factory _SuccessVoidOrder(final String message) =
      _$SuccessVoidOrderImpl;

  String get message;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessVoidOrderImplCopyWith<_$SuccessVoidOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TableState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements TableState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$TableStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TableState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TableModel> tables, bool isSavingLayout)
    loaded,
    required TResult Function(String message) successTransferTable,
    required TResult Function(String message) successVoidOrder,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult? Function(String message)? successTransferTable,
    TResult? Function(String message)? successVoidOrder,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TableModel> tables, bool isSavingLayout)? loaded,
    TResult Function(String message)? successTransferTable,
    TResult Function(String message)? successVoidOrder,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SuccessTransferTable value) successTransferTable,
    required TResult Function(_SuccessVoidOrder value) successVoidOrder,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SuccessTransferTable value)? successTransferTable,
    TResult? Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SuccessTransferTable value)? successTransferTable,
    TResult Function(_SuccessVoidOrder value)? successVoidOrder,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TableState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of TableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
