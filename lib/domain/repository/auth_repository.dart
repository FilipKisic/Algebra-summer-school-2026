import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/domain/model/result.dart';

abstract interface class AuthRepository {
  Future<Result<UserCredential>> signIn(String email, String password);
}