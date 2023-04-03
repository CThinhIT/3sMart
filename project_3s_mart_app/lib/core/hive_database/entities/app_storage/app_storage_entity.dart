import 'package:hive/hive.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/base_entity.dart';

part 'app_storage_entity.g.dart';

@HiveType(typeId: 1)
class AppStorageEntity extends BaseEntity {
  @HiveField(1)
  bool isFingerprint;
  @HiveField(2)
  bool isWelcome;

  AppStorageEntity({
    String? id,
    this.isFingerprint = false,
    this.isWelcome = false,
  }) : super(id: id);
}
