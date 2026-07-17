import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/data/datasource/local/db/database_manager.dart';
import 'package:urban_explorer/data/datasource/local/db/hive_database_manager_impl.dart';
import 'package:urban_explorer/data/datasource/remote/client/auth_client.dart';
import 'package:urban_explorer/data/datasource/remote/client/locations_http_client.dart';
import 'package:urban_explorer/data/repository/auth_repository_impl.dart';
import 'package:urban_explorer/data/repository/location_repository_impl.dart';
import 'package:urban_explorer/domain/repository/auth_repository.dart';
import 'package:urban_explorer/domain/repository/location_repository.dart';
import 'package:urban_explorer/domain/use_case/get_locations_use_case.dart';
import 'package:urban_explorer/domain/use_case/sign_in_use_case.dart';
import 'package:urban_explorer/domain/use_case/sign_out_use_case.dart';
import 'package:urban_explorer/domain/use_case/sign_up_use_case.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/sign_in_controller.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/state/sign_in_state.dart';
import 'package:urban_explorer/presentation/auth/sign_up/controller/sign_up_controller.dart';
import 'package:urban_explorer/presentation/auth/sign_up/controller/state/sign_up_state.dart';
import 'package:urban_explorer/presentation/locations/location_list/controller/location_list_controller.dart';
import 'package:urban_explorer/presentation/locations/location_list/controller/state/location_list_state.dart';
import 'package:urban_explorer/presentation/profile/controller/profile_controller.dart';
import 'package:urban_explorer/presentation/profile/controller/state/profile_state.dart';

// ************ CLIENTS ************ //
final dioProvider = Provider((ref) => Dio());

final authClientProvider = Provider((ref) => AuthClient());
final locationsHttpClientProvider = Provider(
  (ref) => LocationsHttpClient(ref.watch(dioProvider)),
);

// ************ DATABASE ************ //
final databaseManagerProvider = Provider<DatabaseManager>((ref) => HiveDatabaseManagerImpl());

// ************ REPOSITORIES ************ //
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authClientProvider)),
);

final locationRepositoryProvider = Provider<LocationRepository>(
  (ref) => LocationRepositoryImpl(
    ref.watch(locationsHttpClientProvider),
    ref.watch(databaseManagerProvider),
  ),
);

// ************ USE CASES ************ //
final signInUseCaseProvider = Provider(
  (ref) => SignInUseCase(ref.watch(authRepositoryProvider)),
);

final signUpUseCaseProvider = Provider(
  (ref) => SignUpUseCase(ref.watch(authRepositoryProvider)),
);

final signOutUseCaseProvider = Provider(
  (ref) => SignOutUseCase(ref.watch(authRepositoryProvider)),
);

final getLocationsUseCaseProvider = Provider(
  (ref) => GetLocationsUseCase(ref.watch(locationRepositoryProvider)),
);

// ************ CONTROLLERS ************ //
final signInControllerProvider = NotifierProvider<SignInController, SignInState>(
  () => SignInController(),
);

final signUpControllerProvider = NotifierProvider<SignUpController, SignUpState>(
  () => SignUpController(),
);

final locationListControllerProvider = NotifierProvider<LocationListController, LocationListState>(
  () => LocationListController(),
);

final profileControllerProvider = NotifierProvider<ProfileController, ProfileState>(
  () => ProfileController(),
);
