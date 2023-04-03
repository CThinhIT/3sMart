import 'package:project_3s_mart_app/core/hive_database/daos/session_dao.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/session/session_entity.dart';
import 'package:project_3s_mart_app/core/services/interfaces/isession_service.dart';
import 'package:project_3s_mart_app/global/locator.dart';

class SessionService implements ISessionService {
  final _dao = locator<SessionDao>();

  @override
  Future<void> clear() async {
    await _dao.clear();
  }

  @override
  SessionEntity? getSession() {
    if (_dao.getAll().isNotEmpty) {
      return _dao.getAll().first;
    }
    return null;
  }

  @override
  Future<void> insert(SessionEntity entity) async {
    await _dao.insert(entity);
  }
}
