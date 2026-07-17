import 'package:hive_ce/hive.dart';
import 'package:urban_explorer/data/datasource/local/db/database_manager.dart';
import 'package:urban_explorer/domain/model/location.dart';

class HiveDatabaseManagerImpl implements DatabaseManager {
  @override
  List<Location> getAllFavorites() {
    final locationsBox = Hive.box<Location>(locationBoxName);
    return locationsBox.values.toList();
  }

  @override
  Future<void> removeAsFavorite(Location location) async {
    final locationsBox = Hive.box<Location>(locationBoxName);
    locationsBox.delete(location.id);
  }

  @override
  Future<void> setAsFavorite(Location location) async {
    final locationsBox = Hive.box<Location>(locationBoxName);
    locationsBox.put(location.id, location);
  }
}
