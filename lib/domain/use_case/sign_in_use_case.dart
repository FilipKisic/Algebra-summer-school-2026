import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<UserCredential>> execute(final String email, final String password) async {
    return _authRepository.signIn(email, password);
  }
}
