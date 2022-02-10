import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/providers/theme_provider.dart';
import 'package:flutter_todo/utils/theme_options.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeControllerProvider);

    return IconButton(
      onPressed: () {
        ref.read(themeControllerProvider.notifier).toggleTheme();
      },
      icon: Icon(currentTheme == ThemeOptions.darkMode
          ? Icons.light_mode
          : Icons.dark_mode),
    );
  }
}
