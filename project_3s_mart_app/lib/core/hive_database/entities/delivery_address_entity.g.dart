// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryAddressEntityAdapter extends TypeAdapter<DeliveryAddressEntity> {
  @override
  final int typeId = 2;

  @override
  DeliveryAddressEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeliveryAddressEntity(
      id: fields[0] as String?,
      fullName: fields[1] as String,
      isDefaultAddress: fields[2] as bool,
      phoneNumber: fields[3] as String,
      province: fields[4] as String,
      address: fields[7] as String,
      ward: fields[6] as String,
      district: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeliveryAddressEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.isDefaultAddress)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.province)
      ..writeByte(5)
      ..write(obj.district)
      ..writeByte(6)
      ..write(obj.ward)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryAddressEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
