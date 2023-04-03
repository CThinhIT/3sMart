import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_3s_mart_app/core/utils/constants.dart';
import 'package:project_3s_mart_app/core/utils/logger_utils.dart';

import 'entities/base_entity.dart';
import 'hive_constants.dart';

class HiveDatabase {
  HiveDatabase();

  Future<void> init() async {
    var appFolder = await getApplicationDocumentsDirectory();
    var hivePath = appFolder.path + '/hive';
    final hiveFolder = Directory(hivePath);
    // if (hiveFolder.existsSync()) {
    //   hiveFolder.deleteSync(recursive: true); // Uncomment to clear database
    // }

    Hive.init(hivePath);
    _registerAdapters();
    await _initBoxes();
  }

  Box<T> getMyBox<T extends BaseEntity>() {
    return Hive.box<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
  }

  Future<void> _initBoxes() async {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      await HiveBoxMap.hiveBoxMap[key]!.openBoxFunction();
    }
  }

  void _registerAdapters() {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      HiveBoxMap.hiveBoxMap[key]!.registerAdapterFunction();
    }
  }

  Future<void> backupHiveBox<T extends BaseEntity>() async {
    final box = await Hive.openBox<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
    var appFolder = await getApplicationDocumentsDirectory();
    var backupPath = appFolder.path +
        '/${Constants.BackUpData}/' +
        HiveBoxMap.hiveBoxMap[T]!.boxName;
    await File(backupPath).writeAsString(jsonEncode(
        box.values.toList())); // add data if it doesn't push to server
  }

  Future<void> restoreHiveBox<T extends BaseEntity>(Function fromJson) async {
    final box = await Hive.openBox<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
    var appFolder = await getApplicationDocumentsDirectory();
    var backupPath = appFolder.path +
        '/${Constants.BackUpData}/' +
        HiveBoxMap.hiveBoxMap[T]!.boxName;
    var file = await File(backupPath).exists();
    if (!file) {
      return;
    }
    var document = await File(backupPath).readAsString();
    var jsonFromFile = jsonDecode(document.toString());

    try {
      if (jsonFromFile.length > 0) {
        for (var item in jsonFromFile) {
          T itemConvertToEntity = fromJson(item) as T;
          await box.put(itemConvertToEntity.id, itemConvertToEntity);
        }
      }
      await File(backupPath).delete(); // Remove data file after backup
    } catch (e) {
      await LoggerUtils.logException(e);
    }
  }
}
