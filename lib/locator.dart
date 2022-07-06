import 'package:get_it/get_it.dart';
import 'package:weather_app/modules/home/provider/home_provider.dart';

import 'core/services/location_service.dart';
import 'modules/details/provider/details_provider.dart';
import 'modules/home/provider/button_provider.dart';

GetIt getIt = GetIt.I;

setUp() {
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<HomeProvider>(() => HomeProvider());
  getIt.registerLazySingleton<ButtonProvider>(() => ButtonProvider());
  getIt.registerLazySingleton<DetailProvider>(() => DetailProvider());
}
