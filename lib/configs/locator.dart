import 'package:flutter_application_1/repositories/user_repo.dart';
import 'package:flutter_application_1/services/user_service.dart';
import 'package:flutter_application_1/view_models/registration/get_started_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  // register services
  locator.registerLazySingleton<UserService>(() => UserService());

  // register repositories
  locator.registerLazySingleton<UserRepository>(
      () => UserRepository(locator.get<UserService>()));

  // register view models
  locator.registerLazySingleton<GetStartedViewModel>(
      () => GetStartedViewModel(locator.get<UserRepository>()));
}
