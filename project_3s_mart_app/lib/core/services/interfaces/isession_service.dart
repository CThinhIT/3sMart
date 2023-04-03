import 'package:project_3s_mart_app/core/hive_database/entities/session/session_entity.dart';

abstract class ISessionService{
  SessionEntity? getSession();
  Future<void> insert(SessionEntity entity);
  Future<void> clear();
}