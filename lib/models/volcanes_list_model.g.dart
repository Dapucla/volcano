// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volcanes_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolcanesListModelAdapter extends TypeAdapter<VolcanesListModel> {
  @override
  final int typeId = 1;

  @override
  VolcanesListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolcanesListModel(
      id: fields[1] as int?,
      name: fields[2] as String?,
      subregion: fields[3] as String?,
      type: fields[4] as String?,
      evidence: fields[5] as String?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VolcanesListModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.subregion)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.evidence)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolcanesListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
