import 'package:get_it/get_it.dart';
import 'package:project_3s_mart_app/core/services/implements/appstorage_service.dart';
import 'package:project_3s_mart_app/core/services/implements/delivery_address_service.dart';
import 'package:project_3s_mart_app/core/services/implements/session_service.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iappstrore_service.dart';
import 'package:project_3s_mart_app/core/services/interfaces/idelivery_address_service.dart';
import 'package:project_3s_mart_app/core/services/interfaces/isession_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAppStorageService>(() => AppStorageService());
  locator.registerLazySingleton<IDeliveryAddressService>(
      () => DeliveryAddressService());
  locator.registerLazySingleton<ISessionService>(() => SessionService());
}
