import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<Result<UserCredential>> execute(final String email, final String password) async {
    return await _authRepository.signUp(email, password);
  }
}