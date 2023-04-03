import 'package:hive/hive.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/base_entity.dart';
part 'session_entity.g.dart';

@HiveType(typeId: 3)
class SessionEntity extends BaseEntity {
  @HiveField(1)
  String phoneNumer;

  SessionEntity({
    String? id,
    required this.phoneNumer,
  }) : super(id: id);
}


