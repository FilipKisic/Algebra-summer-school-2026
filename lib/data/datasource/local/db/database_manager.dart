import 'package:urban_explorer/domain/model/location.dart';

abstract interface class DatabaseManager {
  List<Location> getAllFavorites();
  Future<void> setAsFavorite(Location location);
  Future<void> removeAsFavorite(Location location);
}
