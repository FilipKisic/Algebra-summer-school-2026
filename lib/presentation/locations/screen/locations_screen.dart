import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/locations/controller/state/location_list_state.dart';
import 'package:urban_explorer/presentation/locations/widget/location_card.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationListControllerProvider);
    return Scaffold(
      body: switch (state) {
        LoadingState() => Center(child: Lottie.asset('assets/animations/loading_sights.json', width: 60)),
        EmptyState() => EmptyStateWidget(),
        LoadedState(locations: final locationList) => LocationList(locationList),
        ErrorState() => ErrorStateWidget(),
      },
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Places',
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/no_locations_found.png', width: 200),
            const SizedBox(height: 40),
            Text(
              'No places found',
              style: TextStyle(fontSize: 18, fontWeight: .bold),
            ),
            Text(
              'Try to refresh the screen or check later.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class LocationList extends StatelessWidget {
  final List<Location> locations;

  const LocationList(this.locations, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Places',
              style: TextStyle(fontSize: 40, fontWeight: .bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: locations.length,
                itemBuilder: (context, index) => LocationCard(location: locations[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Places',
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/error_image.png', width: 250),
            Text(
              'There was an error.',
              style: TextStyle(fontWeight: .bold, fontSize: 18),
            ),
            Text(
              'Please try again later or check\nyour internet connection.',
              style: TextStyle(fontSize: 16),
              textAlign: .center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
