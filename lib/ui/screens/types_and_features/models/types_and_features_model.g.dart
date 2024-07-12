// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_and_features_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypesAndFeaturesModelAdapter extends TypeAdapter<TypesAndFeaturesModel> {
  @override
  final int typeId = 0;

  @override
  TypesAndFeaturesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypesAndFeaturesModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      image: fields[2] as String,
      subtitle: fields[3] as String,
      image_1: fields[4] as String,
      image_2: fields[5] as String,
      image_3: fields[6] as String,
      description_1: fields[7] as String,
      description_2: fields[8] as String,
      description_3: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TypesAndFeaturesModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.subtitle)
      ..writeByte(4)
      ..write(obj.image_1)
      ..writeByte(5)
      ..write(obj.image_2)
      ..writeByte(6)
      ..write(obj.image_3)
      ..writeByte(7)
      ..write(obj.description_1)
      ..writeByte(8)
      ..write(obj.description_2)
      ..writeByte(9)
      ..write(obj.description_3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypesAndFeaturesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
