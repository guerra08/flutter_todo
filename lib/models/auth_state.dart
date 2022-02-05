import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

extension AuthStateGetter on AuthState {
  bool get isLoading => this is _AuthStateLoading;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unauthorized() = _AuthStateUnauthorized;
  const factory AuthState.authorized({
    required User user,
  }) = _AuthStateAuthorized;
  const factory AuthState.loading() = _AuthStateLoading;
}
