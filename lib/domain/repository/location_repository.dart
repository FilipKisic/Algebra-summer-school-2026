import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';

abstract interface class LocationRepository {
  Future<Result<List<Location>>> getLocations();
  List<Location> getFavoriteLocations();
  Future<void> setAsFavorite(Location location);
  Future<void> removeAsFavorite(Location location);
}