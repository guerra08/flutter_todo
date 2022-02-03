import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;

  AuthService() {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          _isLoggedIn = false;
        } else {
          _isLoggedIn = true;
        }
        notifyListeners();
      },
    );
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<UserCredential> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final cred = await FirebaseAuth.instance.signInWithCredential(credential);

    _isLoading = false;
    notifyListeners();

    return cred;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
