import 'package:get_it/get_it.dart';
import 'package:weather_app/modules/home/provider/home_provider.dart';

import 'core/services/location_service.dart';

GetIt getIt = GetIt.I;

setUp() {
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<HomeProvider>(() => HomeProvider());
}
