import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {

  Future<UserCredential> signIn(final String email, final String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}