import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/presentation/auth/sign_up/controller/state/sign_up_state.dart';

class SignUpController extends Notifier<SignUpState>{
  @override
  SignUpState build() {
    return InitialState();
  }

  void signUp(final String email, final String password) async {
    state = LoadingState();

    final result = await ref.read(signUpUseCaseProvider).execute(email, password);

    switch (result) {
      case Ok<UserCredential>(): state = SuccessState(result.value);
      case Error<UserCredential>(): state = ErrorState(result.exception);
    }
  }

  void resendEmail() {
    if (state is SuccessState) {
      final user = (state as SuccessState).user.user;
      ref.read(resendEmailUseCaseProvider).execute(user!);
    }
  }
}