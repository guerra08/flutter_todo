// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthStateUnauthorized unauthorized() {
    return const _AuthStateUnauthorized();
  }

  _AuthStateAuthorized authorized({required User user}) {
    return _AuthStateAuthorized(
      user: user,
    );
  }

  _AuthStateLoading loading() {
    return const _AuthStateLoading();
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$AuthStateUnauthorizedCopyWith<$Res> {
  factory _$AuthStateUnauthorizedCopyWith(_AuthStateUnauthorized value,
          $Res Function(_AuthStateUnauthorized) then) =
      __$AuthStateUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateUnauthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateUnauthorizedCopyWith<$Res> {
  __$AuthStateUnauthorizedCopyWithImpl(_AuthStateUnauthorized _value,
      $Res Function(_AuthStateUnauthorized) _then)
      : super(_value, (v) => _then(v as _AuthStateUnauthorized));

  @override
  _AuthStateUnauthorized get _value => super._value as _AuthStateUnauthorized;
}

/// @nodoc

class _$_AuthStateUnauthorized implements _AuthStateUnauthorized {
  const _$_AuthStateUnauthorized();

  @override
  String toString() {
    return 'AuthState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthStateUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function() loading,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateLoading value) loading,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateUnauthorized implements AuthState {
  const factory _AuthStateUnauthorized() = _$_AuthStateUnauthorized;
}

/// @nodoc
abstract class _$AuthStateAuthorizedCopyWith<$Res> {
  factory _$AuthStateAuthorizedCopyWith(_AuthStateAuthorized value,
          $Res Function(_AuthStateAuthorized) then) =
      __$AuthStateAuthorizedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$AuthStateAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateAuthorizedCopyWith<$Res> {
  __$AuthStateAuthorizedCopyWithImpl(
      _AuthStateAuthorized _value, $Res Function(_AuthStateAuthorized) _then)
      : super(_value, (v) => _then(v as _AuthStateAuthorized));

  @override
  _AuthStateAuthorized get _value => super._value as _AuthStateAuthorized;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_AuthStateAuthorized(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AuthStateAuthorized implements _AuthStateAuthorized {
  const _$_AuthStateAuthorized({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authorized(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthStateAuthorized &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$AuthStateAuthorizedCopyWith<_AuthStateAuthorized> get copyWith =>
      __$AuthStateAuthorizedCopyWithImpl<_AuthStateAuthorized>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function() loading,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateLoading value) loading,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateAuthorized implements AuthState {
  const factory _AuthStateAuthorized({required User user}) =
      _$_AuthStateAuthorized;

  User get user;
  @JsonKey(ignore: true)
  _$AuthStateAuthorizedCopyWith<_AuthStateAuthorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthStateLoadingCopyWith<$Res> {
  factory _$AuthStateLoadingCopyWith(
          _AuthStateLoading value, $Res Function(_AuthStateLoading) then) =
      __$AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateLoadingCopyWith<$Res> {
  __$AuthStateLoadingCopyWithImpl(
      _AuthStateLoading _value, $Res Function(_AuthStateLoading) _then)
      : super(_value, (v) => _then(v as _AuthStateLoading));

  @override
  _AuthStateLoading get _value => super._value as _AuthStateLoading;
}

/// @nodoc

class _$_AuthStateLoading implements _AuthStateLoading {
  const _$_AuthStateLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function()? loading,
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
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoading implements AuthState {
  const factory _AuthStateLoading() = _$_AuthStateLoading;
}
