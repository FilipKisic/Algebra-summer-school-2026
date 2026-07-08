import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/data/client/auth_client.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthClient _authClient;

  AuthRepositoryImpl(this._authClient);

  @override
  Future<Result<UserCredential>> signIn(String email, String password) async {
    try {
      final user = await _authClient.signIn(email, password);
      return Result.ok(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return Result.error(Exception("Invalid email or password"));
      }
      return Result.error(Exception("Authentication internal error."));
    } catch (e) {
      return Result.error(Exception("There was an unexpected error."));
    }
  }
}
