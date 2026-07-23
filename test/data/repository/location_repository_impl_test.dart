import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:urban_explorer/data/datasource/local/db/hive_database_manager_impl.dart';
import 'package:urban_explorer/data/datasource/remote/client/locations_http_client.dart';
import 'package:urban_explorer/data/repository/location_repository_impl.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';

void main() {
  test('should successfully fetch the list of locations', () async {
    // arrange
    final client = LocationsHttpClient(Dio());
    final databaseManager = HiveDatabaseManagerImpl();
    final repository = LocationRepositoryImpl(client, databaseManager);

    // act
    final result = await repository.getLocations();

    // assert
    equals((result as Ok<List<Location>>).value.length, 5);
  });
}