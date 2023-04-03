import 'package:hive/hive.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/app_storage/app_storage_entity.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/delivery_address_entity.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/session/session_entity.dart';

class HiveBoxName {
  static const String appStorage = 'appStorage'; // 1
  static const String deliveryAddress = 'deliveryAddress'; // 2
  static const String session = 'session'; //3
}

class HiveBoxMap {
  static Map<Type, MyHive> hiveBoxMap = {
    AppStorageEntity: MyHive<AppStorageEntity>(
      boxName: HiveBoxName.appStorage,
      registerAdapterFunction: () {
        Hive.registerAdapter(AppStorageEntityAdapter());
      },
    ),
    DeliveryAddressEntity: MyHive<DeliveryAddressEntity>(
      boxName: HiveBoxName.deliveryAddress,
      registerAdapterFunction: () {
        Hive.registerAdapter(DeliveryAddressEntityAdapter());
      },
    ),
        SessionEntity: MyHive<SessionEntity>(
      boxName: HiveBoxName.session,
      registerAdapterFunction: () {
        Hive.registerAdapter(SessionEntityAdapter());
      },
    ),
  };
}

class MyHive<EntityT> {
  late String boxName;
  late Future<void> Function() openBoxFunction;
  late void Function() registerAdapterFunction;

  MyHive({required this.boxName, required this.registerAdapterFunction}) {
    this.openBoxFunction = () async {
      await Hive.openBox<EntityT>(boxName);
    };
  }
}
