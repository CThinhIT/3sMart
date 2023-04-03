import 'package:project_3s_mart_app/core/hive_database/entities/app_storage/app_storage_entity.dart';

abstract class IAppStorageService {
  Future<AppStorageEntity> getAppStorage();
  Future<void> updateAppStorage(AppStorageEntity appStorage);
  Future<void> setFingerprint(bool isFingerprint);
  Future<void> setWelcome(bool isWelcome);
}
