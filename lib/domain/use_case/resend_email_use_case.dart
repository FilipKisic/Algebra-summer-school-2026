import 'package:firebase_auth/firebase_auth.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';

class ResendEmailUseCase {
  final AuthRepository _authRepository;

  ResendEmailUseCase(this._authRepository);

  Future<Result<void>> execute(final User user) async => _authRepository.resendEmail(user);
}