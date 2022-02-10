import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/controllers/theme_controller.dart';
import 'package:flutter_todo/utils/theme_options.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeOptions>(
  (ref) {
    return ThemeController();
  },
);
