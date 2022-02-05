import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Stream<User?> get onAuthStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final cred = await FirebaseAuth.instance.signInWithCredential(credential);

    return cred;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
