import 'package:get_it/get_it.dart';
import 'package:horizon/core/network/network_manager.dart';
import 'package:horizon/view/auth/auth.viewmodel.dart';
import 'package:horizon/view/home/home.viewmodel.dart';

import 'core/network/firebase_manager.dart';

// Represents compile-time dependency injection
GetIt locator = GetIt.instance;

void setupLocator() {
  // View models
  locator.registerFactory(() => AuthViewModel());
  locator.registerFactory(() => HomeViewModel());

  // Dio
  locator.registerFactory(() => NetworkManager());
  locator.registerFactory(() => FirestoreService.instance);
}
