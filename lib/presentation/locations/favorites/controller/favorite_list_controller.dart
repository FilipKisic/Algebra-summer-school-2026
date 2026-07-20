import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/locations/favorites/controller/state/favorite_list_state.dart';

class FavoriteListController extends Notifier<FavoriteListState> {
  @override
  FavoriteListState build() {
    return EmptyState();
  }

  void getFavorites() {
    final result = ref.read(getFavoritesUseCaseProvider).execute();
    state = result.isEmpty ? EmptyState() : LoadedState(result);
  }
}