import 'package:get_it/get_it.dart';
import 'package:instalment/screens/clients/viewmodel/clients_view_model.dart';
import 'package:instalment/screens/home/viewmodel/home_view_model.dart';

import 'services/navigation_service.dart';
import 'services/shared_pref_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ClientsViewModel());

  initSingleton();
}

void initSingleton() {
  locator<SharedPrefServices>();
}
