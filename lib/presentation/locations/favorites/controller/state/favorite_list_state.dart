import 'package:urban_explorer/domain/model/location.dart';

sealed class FavoriteListState {}

class EmptyState extends FavoriteListState {}

class LoadedState extends FavoriteListState {
  final List<Location> locations;

  LoadedState(this.locations);
}