import 'package:flutter/cupertino.dart';

import '../hive_database/entities/base_entity.dart';

abstract class BaseDto {
  String? id;

  BaseDto({@required this.id});

  // BaseDto({ BaseEntity entity });

  BaseDto.fromEntity(BaseEntity entity);

  BaseEntity toEntity();
}
