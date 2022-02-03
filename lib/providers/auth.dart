import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/services/auth_service.dart';

final authServiceProvider = ChangeNotifierProvider<AuthService>(
  (ref) {
    return AuthService();
  },
);
