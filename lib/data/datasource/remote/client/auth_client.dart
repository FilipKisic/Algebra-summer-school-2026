import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {

  Future<UserCredential> signIn(final String email, final String password) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(final String email, final String password) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    user.user?.sendEmailVerification();
    return user;
  }

  Future<void> signOut() async => FirebaseAuth.instance.signOut();

  Future<void> resendEmail(User user) async => user.sendEmailVerification();
}