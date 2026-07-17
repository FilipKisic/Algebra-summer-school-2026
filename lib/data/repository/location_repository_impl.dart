import 'package:urban_explorer/data/datasource/local/db/database_manager.dart';
import 'package:urban_explorer/data/datasource/remote/client/locations_http_client.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationsHttpClient _client;
  final DatabaseManager _databaseManager;

  LocationRepositoryImpl(this._client, this._databaseManager);

  @override
  Future<Result<List<Location>>> getLocations() async {
    try {
      final locations = await _client.getLocations();
      return Result.ok(locations);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  List<Location> getFavoriteLocations() => _databaseManager.getAllFavorites();

  @override
  Future<void> removeAsFavorite(final Location location) async => _databaseManager.removeAsFavorite(location);

  @override
  Future<void> setAsFavorite(final Location location) async => _databaseManager.setAsFavorite(location);
}
