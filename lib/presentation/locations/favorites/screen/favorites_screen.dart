import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/locations/favorites/controller/state/favorite_list_state.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoriteListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Favorites',
                style: TextStyle(fontSize: 40, fontWeight: .bold),
              ),
              switch (state) {
                EmptyState() => Expanded(child: EmptyStateWidget()),
                LoadedState() => Center(child: Text('There are favorites')),
              },
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        const SizedBox(width: double.maxFinite),
        Image.asset('assets/images/empty_favorites.png', width: 300),
        const SizedBox(height: 20),
        Text('No favorites yet', style: TextStyle(fontSize: 18, fontWeight: .bold)),
        const SizedBox(height: 10),
        Text(
          'Here you will see all your favorite sights.\nMark them as favorite by pressing the\nheart icon.',
          textAlign: .center,
        ),
      ],
    );
  }
}
