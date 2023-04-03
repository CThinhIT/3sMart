import 'package:project_3s_mart_app/core/hive_database/daos/appstorage_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/app_storage/app_storage_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/iappstrore_service.dart';
import 'package:project_3s_mart_app/global/locator.dart';

class AppStorageService extends IAppStorageService {
  final _dao = locator<AppStorageDao>();
  @override
  Future<AppStorageEntity> getAppStorage() async {
    return await _dao.getAppStorage();
  }

  @override
  Future<void> updateAppStorage(AppStorageEntity appStorage) {
    return _dao.update(appStorage.id, appStorage);
  }

  @override
  Future<void> setFingerprint(bool isFingerprint) async {
    await _dao.setFingerprint(isFingerprint);
  }

  @override
  Future<void> setWelcome(bool isWelcome) async {
    await _dao.setWelcome(isWelcome);
  }


}
