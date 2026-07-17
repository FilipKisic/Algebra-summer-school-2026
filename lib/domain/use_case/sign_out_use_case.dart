import 'package:urban_explorer/domain/repository/auth_repository.dart';
import 'package:urban_explorer/domain/model/result.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<Result<void>> execute() async => _authRepository.signOut();
}