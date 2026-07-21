import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/locations/favorites/controller/state/favorite_list_state.dart';

class FavoriteListController extends Notifier<FavoriteListState> {
  @override
  FavoriteListState build() {
    getFavorites();
    return state;
  }

  void getFavorites() {
    final result = ref.read(getFavoritesUseCaseProvider).execute();
    state = result.isEmpty ? EmptyState() : LoadedState(result);
  }

  void setAsFavorite(final Location location) {
    location.isFavorite = true;
    ref.read(setAsFavoriteUseCaseProvider).execute(location);
    getFavorites();
    ref.read(locationListControllerProvider.notifier).updateWithValue(location);
  }

  void removeAsFavorite(final Location location) {
    location.isFavorite = false;
    ref.read(removeAsFavoriteUseCaseProvider).execute(location);
    getFavorites();
    ref.read(locationListControllerProvider.notifier).updateWithValue(location);
  }
}