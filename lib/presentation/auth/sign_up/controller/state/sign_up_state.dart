import 'package:firebase_auth/firebase_auth.dart';

sealed class SignUpState {}

final class InitialState extends SignUpState {}

final class LoadingState extends SignUpState {}

final class SuccessState extends SignUpState {
  final UserCredential user;

  SuccessState(this.user);
}

final class ErrorState extends SignUpState {
  final Exception exception;

  ErrorState(this.exception);
}
