import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/providers/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authService = ref.watch(authServiceProvider);

    return Scaffold(
      body: Center(
        child: !_authService.isLoading
            ? TextButton.icon(
                onPressed: () async {
                  await _authService.signInWithGoogle();
                },
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text("Sign in with Google"),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
