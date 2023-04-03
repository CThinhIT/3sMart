// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionEntityAdapter extends TypeAdapter<SessionEntity> {
  @override
  final int typeId = 3;

  @override
  SessionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionEntity(
      id: fields[0] as String,
      phoneNumer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SessionEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.phoneNumer)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
