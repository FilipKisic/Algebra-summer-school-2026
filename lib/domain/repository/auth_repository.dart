import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/domain/model/result.dart';

abstract interface class AuthRepository {
  Future<Result<UserCredential>> signIn(String email, String password);
  Future<Result<UserCredential>> signUp(String email, String password);
  Future<Result<void>> signOut();
  Future<Result<void>> resendEmail(User user);
}