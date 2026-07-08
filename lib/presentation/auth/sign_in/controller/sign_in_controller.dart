import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/state/sign_in_state.dart';

class SignInController extends Notifier<SignInState>{
  @override
  SignInState build() {
    return InitialState();
  }

  void signIn(final String email, final String password) async {
    state = LoadingState();

    final result = await ref.read(signInUseCaseProvider).execute(email, password);

    switch (result) {
      case Ok<UserCredential>(): state = SuccessState(result.value);
      case Error<UserCredential>(): state = ErrorState(result.exception);
    }
  }
}