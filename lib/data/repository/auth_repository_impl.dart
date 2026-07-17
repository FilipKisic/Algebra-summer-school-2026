import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/data/datasource/remote/client/auth_client.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthClient _authClient;

  AuthRepositoryImpl(this._authClient);

  @override
  Future<Result<UserCredential>> signIn(final String email, final String password) async {
    try {
      final user = await _authClient.signIn(email, password);
      return Result.ok(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
        return Result.error(Exception("Invalid email or password"));
      }
      return Result.error(Exception("Authentication internal error."));
    } catch (e) {
      return Result.error(Exception("There was an unexpected error."));
    }
  }

  @override
  Future<Result<UserCredential>> signUp(final String email, final String password) async {
    try {
      final user = await _authClient.signUp(email, password);
      return Result.ok(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Result.error(Exception('Email already in use.'));
      }

      if (e.code == 'weak-password') {
        return Result.error(Exception('The password is weak.'));
      }
      return Result.error(Exception('Authentication internal error.'));
    } catch (e) {
      return Result.error(Exception('There was an unexpected error.'));
    }
  }

  @override
  Future<Result<void>> signOut() async {
   try {
     await _authClient.signOut();
     return Result.ok(null);
   } catch (e) {
     return Result.error(Exception('There was an unexpected error.'));
   }
  }
}
