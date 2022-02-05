import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/controllers/auth_controller.dart';

final authControlleProvider = ChangeNotifierProvider<AuthController>(
  (ref) {
    return AuthController();
  },
);
