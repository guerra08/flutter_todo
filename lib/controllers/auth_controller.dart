import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/auth_state.dart';
import 'package:flutter_todo/services/auth_service.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthController({required AuthService authService})
      : _authService = authService,
        super(const AuthState.unauthorized()) {
    _authService.onAuthStateChanges.listen((user) {
      if (user == null) {
        state = const AuthState.unauthorized();
      } else {
        state = AuthState.authorized(user: user);
      }
    });
  }

  Future<void> signIn() async {
    state = const AuthState.loading();
    await _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
