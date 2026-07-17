sealed class ProfileState {}

class InitialState extends ProfileState {}

class LoadingState extends ProfileState {}

class SuccessState extends ProfileState {}

class ErrorState extends ProfileState {
  final Exception exception;

  ErrorState(this.exception);
}