// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_storage_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStorageEntityAdapter extends TypeAdapter<AppStorageEntity> {
  @override
  final int typeId = 1;

  @override
  AppStorageEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppStorageEntity(
      id: fields[0] as String?,
      isFingerprint: fields[1] as bool,
      isWelcome: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppStorageEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.isFingerprint)
      ..writeByte(2)
      ..write(obj.isWelcome)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStorageEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
