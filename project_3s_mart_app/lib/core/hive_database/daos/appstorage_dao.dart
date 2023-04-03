import 'package:project_3s_mart_app/core/hive_database/daos/base_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/app_storage/app_storage_entity.dart';

class AppStorageDao extends BaseDao<AppStorageEntity> {
  final String currentAppStorageKey = 'currentAppStorageKey';

  Future<AppStorageEntity> getAppStorage() async {
    if (box.length <= 0) {
      await box.put(currentAppStorageKey, AppStorageEntity());
    }
    return box.get(currentAppStorageKey)!;
  }

  Future<void> setFingerprint(bool isFingerprint) async {
    var appStorage = await getAppStorage();
    appStorage.isFingerprint = isFingerprint;
    await box.put(currentAppStorageKey, appStorage);
  }

  Future<void> setWelcome(bool isWelcome) async {
    var appStorage = await getAppStorage();
    appStorage.isWelcome = isWelcome;
    await box.put(currentAppStorageKey, appStorage);
  }
}
