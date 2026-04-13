// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MemberEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberEventCopyWith<$Res> {
  factory $MemberEventCopyWith(
    MemberEvent value,
    $Res Function(MemberEvent) then,
  ) = _$MemberEventCopyWithImpl<$Res, MemberEvent>;
}

/// @nodoc
class _$MemberEventCopyWithImpl<$Res, $Val extends MemberEvent>
    implements $MemberEventCopyWith<$Res> {
  _$MemberEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchMembersImplCopyWith<$Res> {
  factory _$$FetchMembersImplCopyWith(
    _$FetchMembersImpl value,
    $Res Function(_$FetchMembersImpl) then,
  ) = __$$FetchMembersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$FetchMembersImplCopyWithImpl<$Res>
    extends _$MemberEventCopyWithImpl<$Res, _$FetchMembersImpl>
    implements _$$FetchMembersImplCopyWith<$Res> {
  __$$FetchMembersImplCopyWithImpl(
    _$FetchMembersImpl _value,
    $Res Function(_$FetchMembersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? search = freezed}) {
    return _then(
      _$FetchMembersImpl(
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FetchMembersImpl implements _FetchMembers {
  const _$FetchMembersImpl({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'MemberEvent.fetchMembers(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMembersImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMembersImplCopyWith<_$FetchMembersImpl> get copyWith =>
      __$$FetchMembersImplCopyWithImpl<_$FetchMembersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) {
    return fetchMembers(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) {
    return fetchMembers?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) {
    if (fetchMembers != null) {
      return fetchMembers(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) {
    return fetchMembers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) {
    return fetchMembers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) {
    if (fetchMembers != null) {
      return fetchMembers(this);
    }
    return orElse();
  }
}

abstract class _FetchMembers implements MemberEvent {
  const factory _FetchMembers({final String? search}) = _$FetchMembersImpl;

  String? get search;

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchMembersImplCopyWith<_$FetchMembersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckMemberImplCopyWith<$Res> {
  factory _$$CheckMemberImplCopyWith(
    _$CheckMemberImpl value,
    $Res Function(_$CheckMemberImpl) then,
  ) = __$$CheckMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String codeOrPhone});
}

/// @nodoc
class __$$CheckMemberImplCopyWithImpl<$Res>
    extends _$MemberEventCopyWithImpl<$Res, _$CheckMemberImpl>
    implements _$$CheckMemberImplCopyWith<$Res> {
  __$$CheckMemberImplCopyWithImpl(
    _$CheckMemberImpl _value,
    $Res Function(_$CheckMemberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? codeOrPhone = null}) {
    return _then(
      _$CheckMemberImpl(
        null == codeOrPhone
            ? _value.codeOrPhone
            : codeOrPhone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CheckMemberImpl implements _CheckMember {
  const _$CheckMemberImpl(this.codeOrPhone);

  @override
  final String codeOrPhone;

  @override
  String toString() {
    return 'MemberEvent.checkMember(codeOrPhone: $codeOrPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckMemberImpl &&
            (identical(other.codeOrPhone, codeOrPhone) ||
                other.codeOrPhone == codeOrPhone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, codeOrPhone);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckMemberImplCopyWith<_$CheckMemberImpl> get copyWith =>
      __$$CheckMemberImplCopyWithImpl<_$CheckMemberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) {
    return checkMember(codeOrPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) {
    return checkMember?.call(codeOrPhone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) {
    if (checkMember != null) {
      return checkMember(codeOrPhone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) {
    return checkMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) {
    return checkMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) {
    if (checkMember != null) {
      return checkMember(this);
    }
    return orElse();
  }
}

abstract class _CheckMember implements MemberEvent {
  const factory _CheckMember(final String codeOrPhone) = _$CheckMemberImpl;

  String get codeOrPhone;

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckMemberImplCopyWith<_$CheckMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterMemberImplCopyWith<$Res> {
  factory _$$RegisterMemberImplCopyWith(
    _$RegisterMemberImpl value,
    $Res Function(_$RegisterMemberImpl) then,
  ) = __$$RegisterMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$RegisterMemberImplCopyWithImpl<$Res>
    extends _$MemberEventCopyWithImpl<$Res, _$RegisterMemberImpl>
    implements _$$RegisterMemberImplCopyWith<$Res> {
  __$$RegisterMemberImplCopyWithImpl(
    _$RegisterMemberImpl _value,
    $Res Function(_$RegisterMemberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$RegisterMemberImpl(
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$RegisterMemberImpl implements _RegisterMember {
  const _$RegisterMemberImpl(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'MemberEvent.registerMember(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterMemberImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterMemberImplCopyWith<_$RegisterMemberImpl> get copyWith =>
      __$$RegisterMemberImplCopyWithImpl<_$RegisterMemberImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) {
    return registerMember(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) {
    return registerMember?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) {
    if (registerMember != null) {
      return registerMember(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) {
    return registerMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) {
    return registerMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) {
    if (registerMember != null) {
      return registerMember(this);
    }
    return orElse();
  }
}

abstract class _RegisterMember implements MemberEvent {
  const factory _RegisterMember(final Map<String, dynamic> data) =
      _$RegisterMemberImpl;

  Map<String, dynamic> get data;

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterMemberImplCopyWith<_$RegisterMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMemberImplCopyWith<$Res> {
  factory _$$UpdateMemberImplCopyWith(
    _$UpdateMemberImpl value,
    $Res Function(_$UpdateMemberImpl) then,
  ) = __$$UpdateMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, Map<String, dynamic> data});
}

/// @nodoc
class __$$UpdateMemberImplCopyWithImpl<$Res>
    extends _$MemberEventCopyWithImpl<$Res, _$UpdateMemberImpl>
    implements _$$UpdateMemberImplCopyWith<$Res> {
  __$$UpdateMemberImplCopyWithImpl(
    _$UpdateMemberImpl _value,
    $Res Function(_$UpdateMemberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? data = null}) {
    return _then(
      _$UpdateMemberImpl(
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

class _$UpdateMemberImpl implements _UpdateMember {
  const _$UpdateMemberImpl(this.id, final Map<String, dynamic> data)
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
    return 'MemberEvent.updateMember(id: $id, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_data));

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMemberImplCopyWith<_$UpdateMemberImpl> get copyWith =>
      __$$UpdateMemberImplCopyWithImpl<_$UpdateMemberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) {
    return updateMember(id, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) {
    return updateMember?.call(id, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) {
    if (updateMember != null) {
      return updateMember(id, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) {
    return updateMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) {
    return updateMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) {
    if (updateMember != null) {
      return updateMember(this);
    }
    return orElse();
  }
}

abstract class _UpdateMember implements MemberEvent {
  const factory _UpdateMember(final int id, final Map<String, dynamic> data) =
      _$UpdateMemberImpl;

  int get id;
  Map<String, dynamic> get data;

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMemberImplCopyWith<_$UpdateMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectedImplCopyWith<$Res> {
  factory _$$ClearSelectedImplCopyWith(
    _$ClearSelectedImpl value,
    $Res Function(_$ClearSelectedImpl) then,
  ) = __$$ClearSelectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectedImplCopyWithImpl<$Res>
    extends _$MemberEventCopyWithImpl<$Res, _$ClearSelectedImpl>
    implements _$$ClearSelectedImplCopyWith<$Res> {
  __$$ClearSelectedImplCopyWithImpl(
    _$ClearSelectedImpl _value,
    $Res Function(_$ClearSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSelectedImpl implements _ClearSelected {
  const _$ClearSelectedImpl();

  @override
  String toString() {
    return 'MemberEvent.clearSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetchMembers,
    required TResult Function(String codeOrPhone) checkMember,
    required TResult Function(Map<String, dynamic> data) registerMember,
    required TResult Function(int id, Map<String, dynamic> data) updateMember,
    required TResult Function() clearSelected,
  }) {
    return clearSelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetchMembers,
    TResult? Function(String codeOrPhone)? checkMember,
    TResult? Function(Map<String, dynamic> data)? registerMember,
    TResult? Function(int id, Map<String, dynamic> data)? updateMember,
    TResult? Function()? clearSelected,
  }) {
    return clearSelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetchMembers,
    TResult Function(String codeOrPhone)? checkMember,
    TResult Function(Map<String, dynamic> data)? registerMember,
    TResult Function(int id, Map<String, dynamic> data)? updateMember,
    TResult Function()? clearSelected,
    required TResult orElse(),
  }) {
    if (clearSelected != null) {
      return clearSelected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchMembers value) fetchMembers,
    required TResult Function(_CheckMember value) checkMember,
    required TResult Function(_RegisterMember value) registerMember,
    required TResult Function(_UpdateMember value) updateMember,
    required TResult Function(_ClearSelected value) clearSelected,
  }) {
    return clearSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchMembers value)? fetchMembers,
    TResult? Function(_CheckMember value)? checkMember,
    TResult? Function(_RegisterMember value)? registerMember,
    TResult? Function(_UpdateMember value)? updateMember,
    TResult? Function(_ClearSelected value)? clearSelected,
  }) {
    return clearSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchMembers value)? fetchMembers,
    TResult Function(_CheckMember value)? checkMember,
    TResult Function(_RegisterMember value)? registerMember,
    TResult Function(_UpdateMember value)? updateMember,
    TResult Function(_ClearSelected value)? clearSelected,
    required TResult orElse(),
  }) {
    if (clearSelected != null) {
      return clearSelected(this);
    }
    return orElse();
  }
}

abstract class _ClearSelected implements MemberEvent {
  const factory _ClearSelected() = _$ClearSelectedImpl;
}

/// @nodoc
mixin _$MemberState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_MemberFound value) memberFound,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_MemberFound value)? memberFound,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_MemberFound value)? memberFound,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStateCopyWith<$Res> {
  factory $MemberStateCopyWith(
    MemberState value,
    $Res Function(MemberState) then,
  ) = _$MemberStateCopyWithImpl<$Res, MemberState>;
}

/// @nodoc
class _$MemberStateCopyWithImpl<$Res, $Val extends MemberState>
    implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberState
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
    extends _$MemberStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MemberState.initial()';
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
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
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
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
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
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
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
    required TResult Function(_MemberFound value) memberFound,
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
    TResult? Function(_MemberFound value)? memberFound,
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
    TResult Function(_MemberFound value)? memberFound,
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

abstract class _Initial implements MemberState {
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
    extends _$MemberStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MemberState.loading()';
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
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
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
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
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
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
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
    required TResult Function(_MemberFound value) memberFound,
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
    TResult? Function(_MemberFound value)? memberFound,
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
    TResult Function(_MemberFound value)? memberFound,
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

abstract class _Loading implements MemberState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MemberModel> members});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MemberStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? members = null}) {
    return _then(
      _$LoadedImpl(
        null == members
            ? _value._members
            : members // ignore: cast_nullable_to_non_nullable
                  as List<MemberModel>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<MemberModel> members) : _members = members;

  final List<MemberModel> _members;
  @override
  List<MemberModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'MemberState.loaded(members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  /// Create a copy of MemberState
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
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loaded(members);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(members);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(members);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_MemberFound value) memberFound,
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
    TResult? Function(_MemberFound value)? memberFound,
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
    TResult Function(_MemberFound value)? memberFound,
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

abstract class _Loaded implements MemberState {
  const factory _Loaded(final List<MemberModel> members) = _$LoadedImpl;

  List<MemberModel> get members;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MemberFoundImplCopyWith<$Res> {
  factory _$$MemberFoundImplCopyWith(
    _$MemberFoundImpl value,
    $Res Function(_$MemberFoundImpl) then,
  ) = __$$MemberFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MemberModel member});

  $MemberModelCopyWith<$Res> get member;
}

/// @nodoc
class __$$MemberFoundImplCopyWithImpl<$Res>
    extends _$MemberStateCopyWithImpl<$Res, _$MemberFoundImpl>
    implements _$$MemberFoundImplCopyWith<$Res> {
  __$$MemberFoundImplCopyWithImpl(
    _$MemberFoundImpl _value,
    $Res Function(_$MemberFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? member = null}) {
    return _then(
      _$MemberFoundImpl(
        null == member
            ? _value.member
            : member // ignore: cast_nullable_to_non_nullable
                  as MemberModel,
      ),
    );
  }

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberModelCopyWith<$Res> get member {
    return $MemberModelCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value));
    });
  }
}

/// @nodoc

class _$MemberFoundImpl implements _MemberFound {
  const _$MemberFoundImpl(this.member);

  @override
  final MemberModel member;

  @override
  String toString() {
    return 'MemberState.memberFound(member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberFoundImpl &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, member);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberFoundImplCopyWith<_$MemberFoundImpl> get copyWith =>
      __$$MemberFoundImplCopyWithImpl<_$MemberFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return memberFound(member);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return memberFound?.call(member);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (memberFound != null) {
      return memberFound(member);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_MemberFound value) memberFound,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return memberFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_MemberFound value)? memberFound,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return memberFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_MemberFound value)? memberFound,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (memberFound != null) {
      return memberFound(this);
    }
    return orElse();
  }
}

abstract class _MemberFound implements MemberState {
  const factory _MemberFound(final MemberModel member) = _$MemberFoundImpl;

  MemberModel get member;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberFoundImplCopyWith<_$MemberFoundImpl> get copyWith =>
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
    extends _$MemberStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
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
    return 'MemberState.success(message: $message)';
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

  /// Create a copy of MemberState
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
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
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
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
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
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
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
    required TResult Function(_MemberFound value) memberFound,
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
    TResult? Function(_MemberFound value)? memberFound,
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
    TResult Function(_MemberFound value)? memberFound,
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

abstract class _Success implements MemberState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of MemberState
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
    extends _$MemberStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberState
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
    return 'MemberState.error(message: $message)';
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

  /// Create a copy of MemberState
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
    required TResult Function(List<MemberModel> members) loaded,
    required TResult Function(MemberModel member) memberFound,
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
    TResult? Function(List<MemberModel> members)? loaded,
    TResult? Function(MemberModel member)? memberFound,
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
    TResult Function(List<MemberModel> members)? loaded,
    TResult Function(MemberModel member)? memberFound,
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
    required TResult Function(_MemberFound value) memberFound,
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
    TResult? Function(_MemberFound value)? memberFound,
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
    TResult Function(_MemberFound value)? memberFound,
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

abstract class _Error implements MemberState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
