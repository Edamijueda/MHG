// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/services/authentication/authentication.dart';
import '../core/services/cloud_storage.dart';
import '../core/services/database/firestore.dart';
import '../core/services/user/firestore.dart';
import '../core/services/user/storage.dart';
import '../utils/image_selector.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
  locator.registerLazySingleton(() => FirestoreDbService());
  locator.registerLazySingleton(() => UserStorageService());
  locator.registerLazySingleton(() => UserFsService());
}
