import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/data/client/auth_client.dart';
import 'package:urban_explorer/data/repository/auth_repository_impl.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';
import 'package:urban_explorer/domain/use_case/sign_in_use_case.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/sign_in_controller.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/state/sign_in_state.dart';

final authClientProvider = Provider((ref) => AuthClient());

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authClientProvider)),
);

final signInUseCaseProvider = Provider(
  (ref) => SignInUseCase(ref.watch(authRepositoryProvider)),
);

final signInControllerProvider = NotifierProvider<SignInController, SignInState>(
  () => SignInController(),
);