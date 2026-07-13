import 'package:urban_explorer/data/client/locations_http_client.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationsHttpClient _client;

  LocationRepositoryImpl(this._client);

  @override
  Future<Result<List<Location>>> getLocations() async {
    try {
      final locations = await _client.getLocations();
      return Result.ok(locations);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
