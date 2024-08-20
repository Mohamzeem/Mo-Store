// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritModelAdapter extends TypeAdapter<FavoritModel> {
  @override
  final int typeId = 1;

  @override
  FavoritModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as int?,
      description: fields[3] as String?,
      images: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoritModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
