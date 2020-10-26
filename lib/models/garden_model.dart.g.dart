// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_model.dart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GardenAdapter extends TypeAdapter<Garden> {
  @override
  final int typeId = 1;

  @override
  Garden read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Garden(
      plants: (fields[0] as List)?.cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, Garden obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.plants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GardenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
