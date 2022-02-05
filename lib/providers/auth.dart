import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/controllers/auth_controller.dart';
import 'package:flutter_todo/models/auth_state.dart';
import 'package:flutter_todo/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authNotifierProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final authService = ref.read(authServiceProvider);
    return AuthController(authService: authService);
  },
);
