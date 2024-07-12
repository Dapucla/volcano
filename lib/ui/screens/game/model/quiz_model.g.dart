// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizStateAdapter extends TypeAdapter<QuizState> {
  @override
  final int typeId = 0;

  @override
  QuizState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizState(
      currentQuestion: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuizState obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.currentQuestion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
