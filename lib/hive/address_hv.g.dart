// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_hv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressHvAdapter extends TypeAdapter<AddressHv> {
  @override
  final int typeId = 1;

  @override
  AddressHv read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressHv(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
      geo: fields[3] as GeoHv,
    );
  }

  @override
  void write(BinaryWriter writer, AddressHv obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressHvAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
