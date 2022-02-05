import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:flutter_todo/pages/signin_page.dart';
import 'package:flutter_todo/providers/auth.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.watch(authControlleProvider);

    if (_auth.authUser != null) {
      return const HomePage(title: "To Do");
    }
    return const SignInPage();
  }
}
