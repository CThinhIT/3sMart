import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:project_3s_mart_app/core/hive_database/entities/base_entity.dart';
import 'package:project_3s_mart_app/global/locator.dart';

import '../hive_database.dart';

abstract class BaseDao<T extends BaseEntity> {
  @protected
  late Box<T> box;
  BaseDao() {
    box = locator<HiveDatabase>().getMyBox<T>();
  }

  Future<void> insert(T entity) async {
    try {
      await box.put(entity.id, entity);
    } catch (e) {
      print(e);
    }
  }

  Future<void> insertAll(Iterable<T> entities) async {
    try {
      Map<dynamic, T> data =
          Map.fromIterable(entities, key: (e) => e.id, value: (e) => e);
      await box.putAll(data);
    } catch (e) {
      print(e);
    }
  }

  T? findById(String id) {
    return box.get(id);
  }

  List<T> getAll() {
    return box.values.toList();
  }

  Future<void> update(String id, T entity) async {
    if (box.containsKey(id)) {
      await box.put(id, entity);
    }
  }

  Future<void> updateAll(List<T> entities) async {
    Map<dynamic, T> data =
        Map.fromIterable(entities, key: (e) => e.id, value: (e) => e);
    await box.putAll(data);
  }

  Future<void> delete(String id) async {
    if (box.containsKey(id)) {
      await box.delete(id);
    }
  }

  Future<void> deleteAll(List<String> ids) async {
    await box.deleteAll(ids);
  }

  Future<int> clear() async {
    return await box.clear();
  }
}
