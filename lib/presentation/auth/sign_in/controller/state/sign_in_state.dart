import 'package:firebase_auth/firebase_auth.dart';

sealed class SignInState {}

final class InitialState extends SignInState {}

final class LoadingState extends SignInState {}

final class SuccessState extends SignInState {
  final UserCredential userCredential;

  SuccessState(this.userCredential);
}

final class ErrorState extends SignInState {
  final Exception exception;

  ErrorState(this.exception);
}