import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class SetLocationAsFavoriteUseCase {
  final LocationRepository _repository;

  SetLocationAsFavoriteUseCase(this._repository);

  Future<void> execute(final Location location) async => _repository.setAsFavorite(location);
}