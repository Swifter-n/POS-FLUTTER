// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_count_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StockCountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTasks,
    required TResult Function(int taskId) fetchItems,
    required TResult Function(int taskId, int itemId, double qty, bool isZero)
    updateItemCount,
    required TResult Function(int taskId) submitTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTasks,
    TResult? Function(int taskId)? fetchItems,
    TResult? Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult? Function(int taskId)? submitTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTasks,
    TResult Function(int taskId)? fetchItems,
    TResult Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult Function(int taskId)? submitTask,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTasks value) fetchTasks,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_UpdateItemCount value) updateItemCount,
    required TResult Function(_SubmitTask value) submitTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTasks value)? fetchTasks,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_UpdateItemCount value)? updateItemCount,
    TResult? Function(_SubmitTask value)? submitTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTasks value)? fetchTasks,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_UpdateItemCount value)? updateItemCount,
    TResult Function(_SubmitTask value)? submitTask,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountEventCopyWith<$Res> {
  factory $StockCountEventCopyWith(
    StockCountEvent value,
    $Res Function(StockCountEvent) then,
  ) = _$StockCountEventCopyWithImpl<$Res, StockCountEvent>;
}

/// @nodoc
class _$StockCountEventCopyWithImpl<$Res, $Val extends StockCountEvent>
    implements $StockCountEventCopyWith<$Res> {
  _$StockCountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchTasksImplCopyWith<$Res> {
  factory _$$FetchTasksImplCopyWith(
    _$FetchTasksImpl value,
    $Res Function(_$FetchTasksImpl) then,
  ) = __$$FetchTasksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchTasksImplCopyWithImpl<$Res>
    extends _$StockCountEventCopyWithImpl<$Res, _$FetchTasksImpl>
    implements _$$FetchTasksImplCopyWith<$Res> {
  __$$FetchTasksImplCopyWithImpl(
    _$FetchTasksImpl _value,
    $Res Function(_$FetchTasksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchTasksImpl implements _FetchTasks {
  const _$FetchTasksImpl();

  @override
  String toString() {
    return 'StockCountEvent.fetchTasks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchTasksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTasks,
    required TResult Function(int taskId) fetchItems,
    required TResult Function(int taskId, int itemId, double qty, bool isZero)
    updateItemCount,
    required TResult Function(int taskId) submitTask,
  }) {
    return fetchTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTasks,
    TResult? Function(int taskId)? fetchItems,
    TResult? Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult? Function(int taskId)? submitTask,
  }) {
    return fetchTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTasks,
    TResult Function(int taskId)? fetchItems,
    TResult Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult Function(int taskId)? submitTask,
    required TResult orElse(),
  }) {
    if (fetchTasks != null) {
      return fetchTasks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTasks value) fetchTasks,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_UpdateItemCount value) updateItemCount,
    required TResult Function(_SubmitTask value) submitTask,
  }) {
    return fetchTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTasks value)? fetchTasks,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_UpdateItemCount value)? updateItemCount,
    TResult? Function(_SubmitTask value)? submitTask,
  }) {
    return fetchTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTasks value)? fetchTasks,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_UpdateItemCount value)? updateItemCount,
    TResult Function(_SubmitTask value)? submitTask,
    required TResult orElse(),
  }) {
    if (fetchTasks != null) {
      return fetchTasks(this);
    }
    return orElse();
  }
}

abstract class _FetchTasks implements StockCountEvent {
  const factory _FetchTasks() = _$FetchTasksImpl;
}

/// @nodoc
abstract class _$$FetchItemsImplCopyWith<$Res> {
  factory _$$FetchItemsImplCopyWith(
    _$FetchItemsImpl value,
    $Res Function(_$FetchItemsImpl) then,
  ) = __$$FetchItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId});
}

/// @nodoc
class __$$FetchItemsImplCopyWithImpl<$Res>
    extends _$StockCountEventCopyWithImpl<$Res, _$FetchItemsImpl>
    implements _$$FetchItemsImplCopyWith<$Res> {
  __$$FetchItemsImplCopyWithImpl(
    _$FetchItemsImpl _value,
    $Res Function(_$FetchItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _$FetchItemsImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$FetchItemsImpl implements _FetchItems {
  const _$FetchItemsImpl(this.taskId);

  @override
  final int taskId;

  @override
  String toString() {
    return 'StockCountEvent.fetchItems(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchItemsImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchItemsImplCopyWith<_$FetchItemsImpl> get copyWith =>
      __$$FetchItemsImplCopyWithImpl<_$FetchItemsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTasks,
    required TResult Function(int taskId) fetchItems,
    required TResult Function(int taskId, int itemId, double qty, bool isZero)
    updateItemCount,
    required TResult Function(int taskId) submitTask,
  }) {
    return fetchItems(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTasks,
    TResult? Function(int taskId)? fetchItems,
    TResult? Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult? Function(int taskId)? submitTask,
  }) {
    return fetchItems?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTasks,
    TResult Function(int taskId)? fetchItems,
    TResult Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult Function(int taskId)? submitTask,
    required TResult orElse(),
  }) {
    if (fetchItems != null) {
      return fetchItems(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTasks value) fetchTasks,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_UpdateItemCount value) updateItemCount,
    required TResult Function(_SubmitTask value) submitTask,
  }) {
    return fetchItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTasks value)? fetchTasks,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_UpdateItemCount value)? updateItemCount,
    TResult? Function(_SubmitTask value)? submitTask,
  }) {
    return fetchItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTasks value)? fetchTasks,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_UpdateItemCount value)? updateItemCount,
    TResult Function(_SubmitTask value)? submitTask,
    required TResult orElse(),
  }) {
    if (fetchItems != null) {
      return fetchItems(this);
    }
    return orElse();
  }
}

abstract class _FetchItems implements StockCountEvent {
  const factory _FetchItems(final int taskId) = _$FetchItemsImpl;

  int get taskId;

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchItemsImplCopyWith<_$FetchItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemCountImplCopyWith<$Res> {
  factory _$$UpdateItemCountImplCopyWith(
    _$UpdateItemCountImpl value,
    $Res Function(_$UpdateItemCountImpl) then,
  ) = __$$UpdateItemCountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId, int itemId, double qty, bool isZero});
}

/// @nodoc
class __$$UpdateItemCountImplCopyWithImpl<$Res>
    extends _$StockCountEventCopyWithImpl<$Res, _$UpdateItemCountImpl>
    implements _$$UpdateItemCountImplCopyWith<$Res> {
  __$$UpdateItemCountImplCopyWithImpl(
    _$UpdateItemCountImpl _value,
    $Res Function(_$UpdateItemCountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? itemId = null,
    Object? qty = null,
    Object? isZero = null,
  }) {
    return _then(
      _$UpdateItemCountImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == qty
            ? _value.qty
            : qty // ignore: cast_nullable_to_non_nullable
                  as double,
        null == isZero
            ? _value.isZero
            : isZero // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$UpdateItemCountImpl implements _UpdateItemCount {
  const _$UpdateItemCountImpl(this.taskId, this.itemId, this.qty, this.isZero);

  @override
  final int taskId;
  @override
  final int itemId;
  @override
  final double qty;
  @override
  final bool isZero;

  @override
  String toString() {
    return 'StockCountEvent.updateItemCount(taskId: $taskId, itemId: $itemId, qty: $qty, isZero: $isZero)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemCountImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.isZero, isZero) || other.isZero == isZero));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, itemId, qty, isZero);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemCountImplCopyWith<_$UpdateItemCountImpl> get copyWith =>
      __$$UpdateItemCountImplCopyWithImpl<_$UpdateItemCountImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTasks,
    required TResult Function(int taskId) fetchItems,
    required TResult Function(int taskId, int itemId, double qty, bool isZero)
    updateItemCount,
    required TResult Function(int taskId) submitTask,
  }) {
    return updateItemCount(taskId, itemId, qty, isZero);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTasks,
    TResult? Function(int taskId)? fetchItems,
    TResult? Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult? Function(int taskId)? submitTask,
  }) {
    return updateItemCount?.call(taskId, itemId, qty, isZero);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTasks,
    TResult Function(int taskId)? fetchItems,
    TResult Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult Function(int taskId)? submitTask,
    required TResult orElse(),
  }) {
    if (updateItemCount != null) {
      return updateItemCount(taskId, itemId, qty, isZero);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTasks value) fetchTasks,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_UpdateItemCount value) updateItemCount,
    required TResult Function(_SubmitTask value) submitTask,
  }) {
    return updateItemCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTasks value)? fetchTasks,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_UpdateItemCount value)? updateItemCount,
    TResult? Function(_SubmitTask value)? submitTask,
  }) {
    return updateItemCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTasks value)? fetchTasks,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_UpdateItemCount value)? updateItemCount,
    TResult Function(_SubmitTask value)? submitTask,
    required TResult orElse(),
  }) {
    if (updateItemCount != null) {
      return updateItemCount(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemCount implements StockCountEvent {
  const factory _UpdateItemCount(
    final int taskId,
    final int itemId,
    final double qty,
    final bool isZero,
  ) = _$UpdateItemCountImpl;

  int get taskId;
  int get itemId;
  double get qty;
  bool get isZero;

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemCountImplCopyWith<_$UpdateItemCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitTaskImplCopyWith<$Res> {
  factory _$$SubmitTaskImplCopyWith(
    _$SubmitTaskImpl value,
    $Res Function(_$SubmitTaskImpl) then,
  ) = __$$SubmitTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId});
}

/// @nodoc
class __$$SubmitTaskImplCopyWithImpl<$Res>
    extends _$StockCountEventCopyWithImpl<$Res, _$SubmitTaskImpl>
    implements _$$SubmitTaskImplCopyWith<$Res> {
  __$$SubmitTaskImplCopyWithImpl(
    _$SubmitTaskImpl _value,
    $Res Function(_$SubmitTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _$SubmitTaskImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SubmitTaskImpl implements _SubmitTask {
  const _$SubmitTaskImpl(this.taskId);

  @override
  final int taskId;

  @override
  String toString() {
    return 'StockCountEvent.submitTask(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTaskImplCopyWith<_$SubmitTaskImpl> get copyWith =>
      __$$SubmitTaskImplCopyWithImpl<_$SubmitTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTasks,
    required TResult Function(int taskId) fetchItems,
    required TResult Function(int taskId, int itemId, double qty, bool isZero)
    updateItemCount,
    required TResult Function(int taskId) submitTask,
  }) {
    return submitTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTasks,
    TResult? Function(int taskId)? fetchItems,
    TResult? Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult? Function(int taskId)? submitTask,
  }) {
    return submitTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTasks,
    TResult Function(int taskId)? fetchItems,
    TResult Function(int taskId, int itemId, double qty, bool isZero)?
    updateItemCount,
    TResult Function(int taskId)? submitTask,
    required TResult orElse(),
  }) {
    if (submitTask != null) {
      return submitTask(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTasks value) fetchTasks,
    required TResult Function(_FetchItems value) fetchItems,
    required TResult Function(_UpdateItemCount value) updateItemCount,
    required TResult Function(_SubmitTask value) submitTask,
  }) {
    return submitTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchTasks value)? fetchTasks,
    TResult? Function(_FetchItems value)? fetchItems,
    TResult? Function(_UpdateItemCount value)? updateItemCount,
    TResult? Function(_SubmitTask value)? submitTask,
  }) {
    return submitTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTasks value)? fetchTasks,
    TResult Function(_FetchItems value)? fetchItems,
    TResult Function(_UpdateItemCount value)? updateItemCount,
    TResult Function(_SubmitTask value)? submitTask,
    required TResult orElse(),
  }) {
    if (submitTask != null) {
      return submitTask(this);
    }
    return orElse();
  }
}

abstract class _SubmitTask implements StockCountEvent {
  const factory _SubmitTask(final int taskId) = _$SubmitTaskImpl;

  int get taskId;

  /// Create a copy of StockCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitTaskImplCopyWith<_$SubmitTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockCountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCountStateCopyWith<$Res> {
  factory $StockCountStateCopyWith(
    StockCountState value,
    $Res Function(StockCountState) then,
  ) = _$StockCountStateCopyWithImpl<$Res, StockCountState>;
}

/// @nodoc
class _$StockCountStateCopyWithImpl<$Res, $Val extends StockCountState>
    implements $StockCountStateCopyWith<$Res> {
  _$StockCountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockCountState
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
    extends _$StockCountStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'StockCountState.initial()';
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
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
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
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
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
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
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
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
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

abstract class _Initial implements StockCountState {
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
    extends _$StockCountStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'StockCountState.loading()';
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
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
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
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
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
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
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
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
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

abstract class _Loading implements StockCountState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$TasksLoadedImplCopyWith<$Res> {
  factory _$$TasksLoadedImplCopyWith(
    _$TasksLoadedImpl value,
    $Res Function(_$TasksLoadedImpl) then,
  ) = __$$TasksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StockCountTaskModel> tasks});
}

/// @nodoc
class __$$TasksLoadedImplCopyWithImpl<$Res>
    extends _$StockCountStateCopyWithImpl<$Res, _$TasksLoadedImpl>
    implements _$$TasksLoadedImplCopyWith<$Res> {
  __$$TasksLoadedImplCopyWithImpl(
    _$TasksLoadedImpl _value,
    $Res Function(_$TasksLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tasks = null}) {
    return _then(
      _$TasksLoadedImpl(
        null == tasks
            ? _value._tasks
            : tasks // ignore: cast_nullable_to_non_nullable
                  as List<StockCountTaskModel>,
      ),
    );
  }
}

/// @nodoc

class _$TasksLoadedImpl implements _TasksLoaded {
  const _$TasksLoadedImpl(final List<StockCountTaskModel> tasks)
    : _tasks = tasks;

  final List<StockCountTaskModel> _tasks;
  @override
  List<StockCountTaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'StockCountState.tasksLoaded(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksLoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      __$$TasksLoadedImplCopyWithImpl<_$TasksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return tasksLoaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return tasksLoaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (tasksLoaded != null) {
      return tasksLoaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return tasksLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return tasksLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tasksLoaded != null) {
      return tasksLoaded(this);
    }
    return orElse();
  }
}

abstract class _TasksLoaded implements StockCountState {
  const factory _TasksLoaded(final List<StockCountTaskModel> tasks) =
      _$TasksLoadedImpl;

  List<StockCountTaskModel> get tasks;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemsLoadedImplCopyWith<$Res> {
  factory _$$ItemsLoadedImplCopyWith(
    _$ItemsLoadedImpl value,
    $Res Function(_$ItemsLoadedImpl) then,
  ) = __$$ItemsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int taskId, List<StockCountItemModel> items});
}

/// @nodoc
class __$$ItemsLoadedImplCopyWithImpl<$Res>
    extends _$StockCountStateCopyWithImpl<$Res, _$ItemsLoadedImpl>
    implements _$$ItemsLoadedImplCopyWith<$Res> {
  __$$ItemsLoadedImplCopyWithImpl(
    _$ItemsLoadedImpl _value,
    $Res Function(_$ItemsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null, Object? items = null}) {
    return _then(
      _$ItemsLoadedImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<StockCountItemModel>,
      ),
    );
  }
}

/// @nodoc

class _$ItemsLoadedImpl implements _ItemsLoaded {
  const _$ItemsLoadedImpl(this.taskId, final List<StockCountItemModel> items)
    : _items = items;

  @override
  final int taskId;
  final List<StockCountItemModel> _items;
  @override
  List<StockCountItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'StockCountState.itemsLoaded(taskId: $taskId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsLoadedImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    taskId,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsLoadedImplCopyWith<_$ItemsLoadedImpl> get copyWith =>
      __$$ItemsLoadedImplCopyWithImpl<_$ItemsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return itemsLoaded(taskId, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return itemsLoaded?.call(taskId, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (itemsLoaded != null) {
      return itemsLoaded(taskId, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return itemsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return itemsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (itemsLoaded != null) {
      return itemsLoaded(this);
    }
    return orElse();
  }
}

abstract class _ItemsLoaded implements StockCountState {
  const factory _ItemsLoaded(
    final int taskId,
    final List<StockCountItemModel> items,
  ) = _$ItemsLoadedImpl;

  int get taskId;
  List<StockCountItemModel> get items;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsLoadedImplCopyWith<_$ItemsLoadedImpl> get copyWith =>
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
    extends _$StockCountStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
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
    return 'StockCountState.success(message: $message)';
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

  /// Create a copy of StockCountState
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
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
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
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
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
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
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
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
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

abstract class _Success implements StockCountState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of StockCountState
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
    extends _$StockCountStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockCountState
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
    return 'StockCountState.error(message: $message)';
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

  /// Create a copy of StockCountState
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
    required TResult Function(List<StockCountTaskModel> tasks) tasksLoaded,
    required TResult Function(int taskId, List<StockCountItemModel> items)
    itemsLoaded,
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
    TResult? Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult? Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    TResult Function(List<StockCountTaskModel> tasks)? tasksLoaded,
    TResult Function(int taskId, List<StockCountItemModel> items)? itemsLoaded,
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
    required TResult Function(_TasksLoaded value) tasksLoaded,
    required TResult Function(_ItemsLoaded value) itemsLoaded,
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
    TResult? Function(_TasksLoaded value)? tasksLoaded,
    TResult? Function(_ItemsLoaded value)? itemsLoaded,
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
    TResult Function(_TasksLoaded value)? tasksLoaded,
    TResult Function(_ItemsLoaded value)? itemsLoaded,
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

abstract class _Error implements StockCountState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of StockCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
