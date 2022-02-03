import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/pages/error_page.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:flutter_todo/pages/signin_page.dart';
import 'package:flutter_todo/providers/auth.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);

    return _authState.when(data: (data) {
      if (data == null) {
        return const SignInPage();
      }
      return const HomePage(title: "To Do");
    }, error: (e, trace) {
      return const ErrorPage();
    }, loading: () {
      return const Text("Loading");
    });
  }
}
