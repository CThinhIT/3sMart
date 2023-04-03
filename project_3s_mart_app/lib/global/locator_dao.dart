import 'package:get_it/get_it.dart';

import 'package:project_3s_mart_app/core/hive_database/daos/appstorage_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/daos/delivery_address_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/daos/session_dao.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => AppStorageDao());
  locator.registerLazySingleton(() => DeliveryAddressDao());
  locator.registerLazySingleton(() => SessionDao());
}

