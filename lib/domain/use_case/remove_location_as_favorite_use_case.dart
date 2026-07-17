import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';

class RemoveLocationAsFavoriteUseCase {
  final LocationRepository _repository;

  RemoveLocationAsFavoriteUseCase(this._repository);

  Future<void> execute(final Location location) => _repository.removeAsFavorite(location);
}