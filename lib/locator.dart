import 'package:get_it/get_it.dart';
import 'package:instalment/screens/clients/viewmodel/clients_view_model.dart';
import 'package:instalment/screens/clients/viewmodel/edit_clients_view_model.dart';
import 'package:instalment/screens/home/viewmodel/home_view_model.dart';
import 'package:instalment/screens/instalments/viewmodel/instalments_view_model.dart';
import 'package:instalment/screens/orders_screen/viewmodel/orders_view_model.dart';
import 'package:instalment/services/firebase_services.dart';

import 'services/navigation_service.dart';
import 'services/shared_pref_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => FirebaseServices());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ClientsViewModel());
  locator.registerFactory(() => OrdersViewModel());
  locator.registerFactory(() => EditClientsViewModel());
  locator.registerFactory(() => InstalmentsViewModel());

  initSingleton();
}

void initSingleton() {
  locator<SharedPrefServices>();
}
