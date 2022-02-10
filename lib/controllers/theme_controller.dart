import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/utils/theme_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends StateNotifier<ThemeOptions> {
  ThemeController() : super(ThemeOptions.lightMode) {
    _init();
  }

  void _init() async {
    final sp = await SharedPreferences.getInstance();
    bool isDarkMode = sp.getBool("isDarkMode") ?? false;
    (isDarkMode) ? state = ThemeOptions.darkMode : ThemeOptions.lightMode;
  }

  void toggleTheme() async {
    final sp = await SharedPreferences.getInstance();
    ThemeOptions theme = (state == ThemeOptions.darkMode)
        ? ThemeOptions.lightMode
        : ThemeOptions.darkMode;
    sp.setBool("isDarkMode", theme == ThemeOptions.darkMode);
    state = theme;
  }
}
