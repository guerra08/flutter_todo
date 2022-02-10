import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/pages/auth_gate.dart';
import 'package:flutter_todo/pages/create_page.dart';
import 'package:flutter_todo/providers/theme_provider.dart';
import 'package:flutter_todo/utils/theme_options.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: Application()));
}

class Application extends ConsumerWidget {
  ThemeData _buildTheme(Brightness brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(
        baseTheme.textTheme,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const AuthGate(),
        routes: [
          GoRoute(
            path: "create",
            builder: (context, state) => const CreatePage(),
          ),
        ],
      ),
    ],
  );

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'To Do',
      theme: _buildTheme(
          theme == ThemeOptions.darkMode ? Brightness.dark : Brightness.light),
    );
  }
}
