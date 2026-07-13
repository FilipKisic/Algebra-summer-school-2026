import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:urban_explorer/domain/model/location.dart';

part 'locations_http_client.g.dart';

@RestApi(baseUrl: 'http://144.91.87.48:8080/sight')
abstract class LocationsHttpClient {
  factory LocationsHttpClient(Dio dio, {String? baseUrl}) = _LocationsHttpClient;

  @GET('/all')
  Future<List<Location>> getLocations();
}