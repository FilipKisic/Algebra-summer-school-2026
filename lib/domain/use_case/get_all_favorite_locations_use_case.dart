import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class GetAllFavoriteLocationsUseCase {
  final LocationRepository _repository;

  GetAllFavoriteLocationsUseCase(this._repository);
  
  List<Location> execute() => _repository.getFavoriteLocations();
}