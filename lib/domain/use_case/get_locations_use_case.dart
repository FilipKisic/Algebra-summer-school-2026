import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class GetLocationsUseCase {
  final LocationRepository _repository;

  GetLocationsUseCase(this._repository);

  Future<Result<List<Location>>> execute() => _repository.getLocations();
}
