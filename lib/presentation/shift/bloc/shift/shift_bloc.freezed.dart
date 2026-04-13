// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShiftEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double openingAmount) open,
    required TResult Function() fetchSummary,
    required TResult Function(double closingAmount, String? note) close,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double openingAmount)? open,
    TResult? Function()? fetchSummary,
    TResult? Function(double closingAmount, String? note)? close,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double openingAmount)? open,
    TResult Function()? fetchSummary,
    TResult Function(double closingAmount, String? note)? close,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Open value) open,
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_Close value) close,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Open value)? open,
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_Close value)? close,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Open value)? open,
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEventCopyWith<$Res> {
  factory $ShiftEventCopyWith(
    ShiftEvent value,
    $Res Function(ShiftEvent) then,
  ) = _$ShiftEventCopyWithImpl<$Res, ShiftEvent>;
}

/// @nodoc
class _$ShiftEventCopyWithImpl<$Res, $Val extends ShiftEvent>
    implements $ShiftEventCopyWith<$Res> {
  _$ShiftEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckStatusImplCopyWith<$Res> {
  factory _$$CheckStatusImplCopyWith(
    _$CheckStatusImpl value,
    $Res Function(_$CheckStatusImpl) then,
  ) = __$$CheckStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckStatusImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$CheckStatusImpl>
    implements _$$CheckStatusImplCopyWith<$Res> {
  __$$CheckStatusImplCopyWithImpl(
    _$CheckStatusImpl _value,
    $Res Function(_$CheckStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckStatusImpl implements _CheckStatus {
  const _$CheckStatusImpl();

  @override
  String toString() {
    return 'ShiftEvent.checkStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double openingAmount) open,
    required TResult Function() fetchSummary,
    required TResult Function(double closingAmount, String? note) close,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double openingAmount)? open,
    TResult? Function()? fetchSummary,
    TResult? Function(double closingAmount, String? note)? close,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double openingAmount)? open,
    TResult Function()? fetchSummary,
    TResult Function(double closingAmount, String? note)? close,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Open value) open,
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_Close value) close,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Open value)? open,
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_Close value)? close,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Open value)? open,
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckStatus implements ShiftEvent {
  const factory _CheckStatus() = _$CheckStatusImpl;
}

/// @nodoc
abstract class _$$OpenImplCopyWith<$Res> {
  factory _$$OpenImplCopyWith(
    _$OpenImpl value,
    $Res Function(_$OpenImpl) then,
  ) = __$$OpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double openingAmount});
}

/// @nodoc
class __$$OpenImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$OpenImpl>
    implements _$$OpenImplCopyWith<$Res> {
  __$$OpenImplCopyWithImpl(_$OpenImpl _value, $Res Function(_$OpenImpl) _then)
    : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? openingAmount = null}) {
    return _then(
      _$OpenImpl(
        null == openingAmount
            ? _value.openingAmount
            : openingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$OpenImpl implements _Open {
  const _$OpenImpl(this.openingAmount);

  @override
  final double openingAmount;

  @override
  String toString() {
    return 'ShiftEvent.open(openingAmount: $openingAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenImpl &&
            (identical(other.openingAmount, openingAmount) ||
                other.openingAmount == openingAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, openingAmount);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      __$$OpenImplCopyWithImpl<_$OpenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double openingAmount) open,
    required TResult Function() fetchSummary,
    required TResult Function(double closingAmount, String? note) close,
  }) {
    return open(openingAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double openingAmount)? open,
    TResult? Function()? fetchSummary,
    TResult? Function(double closingAmount, String? note)? close,
  }) {
    return open?.call(openingAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double openingAmount)? open,
    TResult Function()? fetchSummary,
    TResult Function(double closingAmount, String? note)? close,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(openingAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Open value) open,
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_Close value) close,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Open value)? open,
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_Close value)? close,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Open value)? open,
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class _Open implements ShiftEvent {
  const factory _Open(final double openingAmount) = _$OpenImpl;

  double get openingAmount;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenImplCopyWith<_$OpenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchSummaryImplCopyWith<$Res> {
  factory _$$FetchSummaryImplCopyWith(
    _$FetchSummaryImpl value,
    $Res Function(_$FetchSummaryImpl) then,
  ) = __$$FetchSummaryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSummaryImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$FetchSummaryImpl>
    implements _$$FetchSummaryImplCopyWith<$Res> {
  __$$FetchSummaryImplCopyWithImpl(
    _$FetchSummaryImpl _value,
    $Res Function(_$FetchSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchSummaryImpl implements _FetchSummary {
  const _$FetchSummaryImpl();

  @override
  String toString() {
    return 'ShiftEvent.fetchSummary()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSummaryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double openingAmount) open,
    required TResult Function() fetchSummary,
    required TResult Function(double closingAmount, String? note) close,
  }) {
    return fetchSummary();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double openingAmount)? open,
    TResult? Function()? fetchSummary,
    TResult? Function(double closingAmount, String? note)? close,
  }) {
    return fetchSummary?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double openingAmount)? open,
    TResult Function()? fetchSummary,
    TResult Function(double closingAmount, String? note)? close,
    required TResult orElse(),
  }) {
    if (fetchSummary != null) {
      return fetchSummary();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Open value) open,
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_Close value) close,
  }) {
    return fetchSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Open value)? open,
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_Close value)? close,
  }) {
    return fetchSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Open value)? open,
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (fetchSummary != null) {
      return fetchSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchSummary implements ShiftEvent {
  const factory _FetchSummary() = _$FetchSummaryImpl;
}

/// @nodoc
abstract class _$$CloseImplCopyWith<$Res> {
  factory _$$CloseImplCopyWith(
    _$CloseImpl value,
    $Res Function(_$CloseImpl) then,
  ) = __$$CloseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double closingAmount, String? note});
}

/// @nodoc
class __$$CloseImplCopyWithImpl<$Res>
    extends _$ShiftEventCopyWithImpl<$Res, _$CloseImpl>
    implements _$$CloseImplCopyWith<$Res> {
  __$$CloseImplCopyWithImpl(
    _$CloseImpl _value,
    $Res Function(_$CloseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? closingAmount = null, Object? note = freezed}) {
    return _then(
      _$CloseImpl(
        null == closingAmount
            ? _value.closingAmount
            : closingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CloseImpl implements _Close {
  const _$CloseImpl(this.closingAmount, this.note);

  @override
  final double closingAmount;
  @override
  final String? note;

  @override
  String toString() {
    return 'ShiftEvent.close(closingAmount: $closingAmount, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseImpl &&
            (identical(other.closingAmount, closingAmount) ||
                other.closingAmount == closingAmount) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, closingAmount, note);

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      __$$CloseImplCopyWithImpl<_$CloseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function(double openingAmount) open,
    required TResult Function() fetchSummary,
    required TResult Function(double closingAmount, String? note) close,
  }) {
    return close(closingAmount, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function(double openingAmount)? open,
    TResult? Function()? fetchSummary,
    TResult? Function(double closingAmount, String? note)? close,
  }) {
    return close?.call(closingAmount, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function(double openingAmount)? open,
    TResult Function()? fetchSummary,
    TResult Function(double closingAmount, String? note)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(closingAmount, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckStatus value) checkStatus,
    required TResult Function(_Open value) open,
    required TResult Function(_FetchSummary value) fetchSummary,
    required TResult Function(_Close value) close,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckStatus value)? checkStatus,
    TResult? Function(_Open value)? open,
    TResult? Function(_FetchSummary value)? fetchSummary,
    TResult? Function(_Close value)? close,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckStatus value)? checkStatus,
    TResult Function(_Open value)? open,
    TResult Function(_FetchSummary value)? fetchSummary,
    TResult Function(_Close value)? close,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements ShiftEvent {
  const factory _Close(final double closingAmount, final String? note) =
      _$CloseImpl;

  double get closingAmount;
  String? get note;

  /// Create a copy of ShiftEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShiftState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftStateCopyWith<$Res> {
  factory $ShiftStateCopyWith(
    ShiftState value,
    $Res Function(ShiftState) then,
  ) = _$ShiftStateCopyWithImpl<$Res, ShiftState>;
}

/// @nodoc
class _$ShiftStateCopyWithImpl<$Res, $Val extends ShiftState>
    implements $ShiftStateCopyWith<$Res> {
  _$ShiftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftState
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
    extends _$ShiftStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ShiftState.initial()';
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
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
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
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ShiftState {
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
    extends _$ShiftStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ShiftState.loading()';
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
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
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
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ShiftState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OpenedImplCopyWith<$Res> {
  factory _$$OpenedImplCopyWith(
    _$OpenedImpl value,
    $Res Function(_$OpenedImpl) then,
  ) = __$$OpenedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShiftModel shift});

  $ShiftModelCopyWith<$Res> get shift;
}

/// @nodoc
class __$$OpenedImplCopyWithImpl<$Res>
    extends _$ShiftStateCopyWithImpl<$Res, _$OpenedImpl>
    implements _$$OpenedImplCopyWith<$Res> {
  __$$OpenedImplCopyWithImpl(
    _$OpenedImpl _value,
    $Res Function(_$OpenedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shift = null}) {
    return _then(
      _$OpenedImpl(
        null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftModel,
      ),
    );
  }

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftModelCopyWith<$Res> get shift {
    return $ShiftModelCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value));
    });
  }
}

/// @nodoc

class _$OpenedImpl implements _Opened {
  const _$OpenedImpl(this.shift);

  @override
  final ShiftModel shift;

  @override
  String toString() {
    return 'ShiftState.opened(shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenedImpl &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shift);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenedImplCopyWith<_$OpenedImpl> get copyWith =>
      __$$OpenedImplCopyWithImpl<_$OpenedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return opened(shift);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return opened?.call(shift);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(shift);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return opened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return opened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (opened != null) {
      return opened(this);
    }
    return orElse();
  }
}

abstract class _Opened implements ShiftState {
  const factory _Opened(final ShiftModel shift) = _$OpenedImpl;

  ShiftModel get shift;

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenedImplCopyWith<_$OpenedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SummaryLoadedImplCopyWith<$Res> {
  factory _$$SummaryLoadedImplCopyWith(
    _$SummaryLoadedImpl value,
    $Res Function(_$SummaryLoadedImpl) then,
  ) = __$$SummaryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShiftModel summary});

  $ShiftModelCopyWith<$Res> get summary;
}

/// @nodoc
class __$$SummaryLoadedImplCopyWithImpl<$Res>
    extends _$ShiftStateCopyWithImpl<$Res, _$SummaryLoadedImpl>
    implements _$$SummaryLoadedImplCopyWith<$Res> {
  __$$SummaryLoadedImplCopyWithImpl(
    _$SummaryLoadedImpl _value,
    $Res Function(_$SummaryLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summary = null}) {
    return _then(
      _$SummaryLoadedImpl(
        null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as ShiftModel,
      ),
    );
  }

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftModelCopyWith<$Res> get summary {
    return $ShiftModelCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value));
    });
  }
}

/// @nodoc

class _$SummaryLoadedImpl implements _SummaryLoaded {
  const _$SummaryLoadedImpl(this.summary);

  @override
  final ShiftModel summary;

  @override
  String toString() {
    return 'ShiftState.summaryLoaded(summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryLoadedImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryLoadedImplCopyWith<_$SummaryLoadedImpl> get copyWith =>
      __$$SummaryLoadedImplCopyWithImpl<_$SummaryLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return summaryLoaded(summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return summaryLoaded?.call(summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (summaryLoaded != null) {
      return summaryLoaded(summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return summaryLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return summaryLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (summaryLoaded != null) {
      return summaryLoaded(this);
    }
    return orElse();
  }
}

abstract class _SummaryLoaded implements ShiftState {
  const factory _SummaryLoaded(final ShiftModel summary) = _$SummaryLoadedImpl;

  ShiftModel get summary;

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryLoadedImplCopyWith<_$SummaryLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedImplCopyWith<$Res> {
  factory _$$ClosedImplCopyWith(
    _$ClosedImpl value,
    $Res Function(_$ClosedImpl) then,
  ) = __$$ClosedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosedImplCopyWithImpl<$Res>
    extends _$ShiftStateCopyWithImpl<$Res, _$ClosedImpl>
    implements _$$ClosedImplCopyWith<$Res> {
  __$$ClosedImplCopyWithImpl(
    _$ClosedImpl _value,
    $Res Function(_$ClosedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosedImpl implements _Closed {
  const _$ClosedImpl();

  @override
  String toString() {
    return 'ShiftState.closed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return closed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return closed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _Closed implements ShiftState {
  const factory _Closed() = _$ClosedImpl;
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
    extends _$ShiftStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftState
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
    return 'ShiftState.error(message: $message)';
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

  /// Create a copy of ShiftState
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
    required TResult Function(ShiftModel shift) opened,
    required TResult Function(ShiftModel summary) summaryLoaded,
    required TResult Function() closed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ShiftModel shift)? opened,
    TResult? Function(ShiftModel summary)? summaryLoaded,
    TResult? Function()? closed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ShiftModel shift)? opened,
    TResult Function(ShiftModel summary)? summaryLoaded,
    TResult Function()? closed,
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
    required TResult Function(_Opened value) opened,
    required TResult Function(_SummaryLoaded value) summaryLoaded,
    required TResult Function(_Closed value) closed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Opened value)? opened,
    TResult? Function(_SummaryLoaded value)? summaryLoaded,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Opened value)? opened,
    TResult Function(_SummaryLoaded value)? summaryLoaded,
    TResult Function(_Closed value)? closed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ShiftState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ShiftState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
