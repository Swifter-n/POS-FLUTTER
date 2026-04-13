// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RewardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCatalog,
    required TResult Function(int rewardId, int memberId) redeemReward,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCatalog,
    TResult? Function(int rewardId, int memberId)? redeemReward,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCatalog,
    TResult Function(int rewardId, int memberId)? redeemReward,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCatalog value) fetchCatalog,
    required TResult Function(_RedeemReward value) redeemReward,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCatalog value)? fetchCatalog,
    TResult? Function(_RedeemReward value)? redeemReward,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCatalog value)? fetchCatalog,
    TResult Function(_RedeemReward value)? redeemReward,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardEventCopyWith<$Res> {
  factory $RewardEventCopyWith(
    RewardEvent value,
    $Res Function(RewardEvent) then,
  ) = _$RewardEventCopyWithImpl<$Res, RewardEvent>;
}

/// @nodoc
class _$RewardEventCopyWithImpl<$Res, $Val extends RewardEvent>
    implements $RewardEventCopyWith<$Res> {
  _$RewardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchCatalogImplCopyWith<$Res> {
  factory _$$FetchCatalogImplCopyWith(
    _$FetchCatalogImpl value,
    $Res Function(_$FetchCatalogImpl) then,
  ) = __$$FetchCatalogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCatalogImplCopyWithImpl<$Res>
    extends _$RewardEventCopyWithImpl<$Res, _$FetchCatalogImpl>
    implements _$$FetchCatalogImplCopyWith<$Res> {
  __$$FetchCatalogImplCopyWithImpl(
    _$FetchCatalogImpl _value,
    $Res Function(_$FetchCatalogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchCatalogImpl implements _FetchCatalog {
  const _$FetchCatalogImpl();

  @override
  String toString() {
    return 'RewardEvent.fetchCatalog()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCatalogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCatalog,
    required TResult Function(int rewardId, int memberId) redeemReward,
  }) {
    return fetchCatalog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCatalog,
    TResult? Function(int rewardId, int memberId)? redeemReward,
  }) {
    return fetchCatalog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCatalog,
    TResult Function(int rewardId, int memberId)? redeemReward,
    required TResult orElse(),
  }) {
    if (fetchCatalog != null) {
      return fetchCatalog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCatalog value) fetchCatalog,
    required TResult Function(_RedeemReward value) redeemReward,
  }) {
    return fetchCatalog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCatalog value)? fetchCatalog,
    TResult? Function(_RedeemReward value)? redeemReward,
  }) {
    return fetchCatalog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCatalog value)? fetchCatalog,
    TResult Function(_RedeemReward value)? redeemReward,
    required TResult orElse(),
  }) {
    if (fetchCatalog != null) {
      return fetchCatalog(this);
    }
    return orElse();
  }
}

abstract class _FetchCatalog implements RewardEvent {
  const factory _FetchCatalog() = _$FetchCatalogImpl;
}

/// @nodoc
abstract class _$$RedeemRewardImplCopyWith<$Res> {
  factory _$$RedeemRewardImplCopyWith(
    _$RedeemRewardImpl value,
    $Res Function(_$RedeemRewardImpl) then,
  ) = __$$RedeemRewardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int rewardId, int memberId});
}

/// @nodoc
class __$$RedeemRewardImplCopyWithImpl<$Res>
    extends _$RewardEventCopyWithImpl<$Res, _$RedeemRewardImpl>
    implements _$$RedeemRewardImplCopyWith<$Res> {
  __$$RedeemRewardImplCopyWithImpl(
    _$RedeemRewardImpl _value,
    $Res Function(_$RedeemRewardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rewardId = null, Object? memberId = null}) {
    return _then(
      _$RedeemRewardImpl(
        null == rewardId
            ? _value.rewardId
            : rewardId // ignore: cast_nullable_to_non_nullable
                  as int,
        null == memberId
            ? _value.memberId
            : memberId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RedeemRewardImpl implements _RedeemReward {
  const _$RedeemRewardImpl(this.rewardId, this.memberId);

  @override
  final int rewardId;
  @override
  final int memberId;

  @override
  String toString() {
    return 'RewardEvent.redeemReward(rewardId: $rewardId, memberId: $memberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemRewardImpl &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rewardId, memberId);

  /// Create a copy of RewardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemRewardImplCopyWith<_$RedeemRewardImpl> get copyWith =>
      __$$RedeemRewardImplCopyWithImpl<_$RedeemRewardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchCatalog,
    required TResult Function(int rewardId, int memberId) redeemReward,
  }) {
    return redeemReward(rewardId, memberId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchCatalog,
    TResult? Function(int rewardId, int memberId)? redeemReward,
  }) {
    return redeemReward?.call(rewardId, memberId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchCatalog,
    TResult Function(int rewardId, int memberId)? redeemReward,
    required TResult orElse(),
  }) {
    if (redeemReward != null) {
      return redeemReward(rewardId, memberId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCatalog value) fetchCatalog,
    required TResult Function(_RedeemReward value) redeemReward,
  }) {
    return redeemReward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchCatalog value)? fetchCatalog,
    TResult? Function(_RedeemReward value)? redeemReward,
  }) {
    return redeemReward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCatalog value)? fetchCatalog,
    TResult Function(_RedeemReward value)? redeemReward,
    required TResult orElse(),
  }) {
    if (redeemReward != null) {
      return redeemReward(this);
    }
    return orElse();
  }
}

abstract class _RedeemReward implements RewardEvent {
  const factory _RedeemReward(final int rewardId, final int memberId) =
      _$RedeemRewardImpl;

  int get rewardId;
  int get memberId;

  /// Create a copy of RewardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemRewardImplCopyWith<_$RedeemRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RewardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardStateCopyWith<$Res> {
  factory $RewardStateCopyWith(
    RewardState value,
    $Res Function(RewardState) then,
  ) = _$RewardStateCopyWithImpl<$Res, RewardState>;
}

/// @nodoc
class _$RewardStateCopyWithImpl<$Res, $Val extends RewardState>
    implements $RewardStateCopyWith<$Res> {
  _$RewardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardState
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
    extends _$RewardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RewardState.initial()';
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
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
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
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RewardState {
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
    extends _$RewardStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RewardState.loading()';
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
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
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
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RewardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CatalogLoadedImplCopyWith<$Res> {
  factory _$$CatalogLoadedImplCopyWith(
    _$CatalogLoadedImpl value,
    $Res Function(_$CatalogLoadedImpl) then,
  ) = __$$CatalogLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RewardModel> rewards});
}

/// @nodoc
class __$$CatalogLoadedImplCopyWithImpl<$Res>
    extends _$RewardStateCopyWithImpl<$Res, _$CatalogLoadedImpl>
    implements _$$CatalogLoadedImplCopyWith<$Res> {
  __$$CatalogLoadedImplCopyWithImpl(
    _$CatalogLoadedImpl _value,
    $Res Function(_$CatalogLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rewards = null}) {
    return _then(
      _$CatalogLoadedImpl(
        null == rewards
            ? _value._rewards
            : rewards // ignore: cast_nullable_to_non_nullable
                  as List<RewardModel>,
      ),
    );
  }
}

/// @nodoc

class _$CatalogLoadedImpl implements _CatalogLoaded {
  const _$CatalogLoadedImpl(final List<RewardModel> rewards)
    : _rewards = rewards;

  final List<RewardModel> _rewards;
  @override
  List<RewardModel> get rewards {
    if (_rewards is EqualUnmodifiableListView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewards);
  }

  @override
  String toString() {
    return 'RewardState.catalogLoaded(rewards: $rewards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogLoadedImpl &&
            const DeepCollectionEquality().equals(other._rewards, _rewards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rewards));

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogLoadedImplCopyWith<_$CatalogLoadedImpl> get copyWith =>
      __$$CatalogLoadedImplCopyWithImpl<_$CatalogLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) {
    return catalogLoaded(rewards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) {
    return catalogLoaded?.call(rewards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (catalogLoaded != null) {
      return catalogLoaded(rewards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) {
    return catalogLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return catalogLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (catalogLoaded != null) {
      return catalogLoaded(this);
    }
    return orElse();
  }
}

abstract class _CatalogLoaded implements RewardState {
  const factory _CatalogLoaded(final List<RewardModel> rewards) =
      _$CatalogLoadedImpl;

  List<RewardModel> get rewards;

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogLoadedImplCopyWith<_$CatalogLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedeemSuccessImplCopyWith<$Res> {
  factory _$$RedeemSuccessImplCopyWith(
    _$RedeemSuccessImpl value,
    $Res Function(_$RedeemSuccessImpl) then,
  ) = __$$RedeemSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String voucherCode, int remainingPoints});
}

/// @nodoc
class __$$RedeemSuccessImplCopyWithImpl<$Res>
    extends _$RewardStateCopyWithImpl<$Res, _$RedeemSuccessImpl>
    implements _$$RedeemSuccessImplCopyWith<$Res> {
  __$$RedeemSuccessImplCopyWithImpl(
    _$RedeemSuccessImpl _value,
    $Res Function(_$RedeemSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? voucherCode = null, Object? remainingPoints = null}) {
    return _then(
      _$RedeemSuccessImpl(
        null == voucherCode
            ? _value.voucherCode
            : voucherCode // ignore: cast_nullable_to_non_nullable
                  as String,
        null == remainingPoints
            ? _value.remainingPoints
            : remainingPoints // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RedeemSuccessImpl implements _RedeemSuccess {
  const _$RedeemSuccessImpl(this.voucherCode, this.remainingPoints);

  @override
  final String voucherCode;
  @override
  final int remainingPoints;

  @override
  String toString() {
    return 'RewardState.redeemSuccess(voucherCode: $voucherCode, remainingPoints: $remainingPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemSuccessImpl &&
            (identical(other.voucherCode, voucherCode) ||
                other.voucherCode == voucherCode) &&
            (identical(other.remainingPoints, remainingPoints) ||
                other.remainingPoints == remainingPoints));
  }

  @override
  int get hashCode => Object.hash(runtimeType, voucherCode, remainingPoints);

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemSuccessImplCopyWith<_$RedeemSuccessImpl> get copyWith =>
      __$$RedeemSuccessImplCopyWithImpl<_$RedeemSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) {
    return redeemSuccess(voucherCode, remainingPoints);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) {
    return redeemSuccess?.call(voucherCode, remainingPoints);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (redeemSuccess != null) {
      return redeemSuccess(voucherCode, remainingPoints);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) {
    return redeemSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return redeemSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redeemSuccess != null) {
      return redeemSuccess(this);
    }
    return orElse();
  }
}

abstract class _RedeemSuccess implements RewardState {
  const factory _RedeemSuccess(
    final String voucherCode,
    final int remainingPoints,
  ) = _$RedeemSuccessImpl;

  String get voucherCode;
  int get remainingPoints;

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemSuccessImplCopyWith<_$RedeemSuccessImpl> get copyWith =>
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
    extends _$RewardStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardState
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
    return 'RewardState.error(message: $message)';
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

  /// Create a copy of RewardState
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
    required TResult Function(List<RewardModel> rewards) catalogLoaded,
    required TResult Function(String voucherCode, int remainingPoints)
    redeemSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RewardModel> rewards)? catalogLoaded,
    TResult? Function(String voucherCode, int remainingPoints)? redeemSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RewardModel> rewards)? catalogLoaded,
    TResult Function(String voucherCode, int remainingPoints)? redeemSuccess,
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
    required TResult Function(_CatalogLoaded value) catalogLoaded,
    required TResult Function(_RedeemSuccess value) redeemSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CatalogLoaded value)? catalogLoaded,
    TResult? Function(_RedeemSuccess value)? redeemSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CatalogLoaded value)? catalogLoaded,
    TResult Function(_RedeemSuccess value)? redeemSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RewardState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of RewardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
