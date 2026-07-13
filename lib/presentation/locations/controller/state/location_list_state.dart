import 'package:urban_explorer/domain/model/location.dart';

sealed class LocationListState {}

class LoadingState extends LocationListState {}

class EmptyState extends LocationListState {}

class LoadedState extends LocationListState {
  final List<Location> locations;

  LoadedState(this.locations);
}

class ErrorState extends LocationListState {
  final Exception exception;

  ErrorState(this.exception);
}
