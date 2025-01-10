// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHvAdapter extends TypeAdapter<UserHv> {
  @override
  final int typeId = 0;

  @override
  UserHv read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHv(
      id: fields[0] as int,
      email: fields[1] as String,
      name: fields[2] as String,
      username: fields[3] as String,
      address: fields[4] as AddressHv,
      phone: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHv obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHvAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
