import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/presentation/locations/location_list/controller/state/location_list_state.dart';

class LocationListController extends Notifier<LocationListState> {
  @override
  LocationListState build() {
    getLocations();
    return LoadingState();
  }

  void getLocations() async {
    state = LoadingState();

    final result = await ref.read(getLocationsUseCaseProvider).execute();

    switch (result) {
      case Ok<List<Location>>():
        state = result.value.isEmpty ? EmptyState() : LoadedState(result.value);
      case Error<List<Location>>():
        state = ErrorState(result.exception);
    }
  }
}
