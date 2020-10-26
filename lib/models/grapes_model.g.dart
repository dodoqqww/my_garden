// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grapes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrapesAdapter extends TypeAdapter<Grapes> {
  @override
  final int typeId = 2;

  @override
  Grapes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grapes(
      grapes: (fields[0] as List)?.cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, Grapes obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.grapes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrapesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
