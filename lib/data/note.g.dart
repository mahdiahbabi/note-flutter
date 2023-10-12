// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteEntityAdapter extends TypeAdapter<NoteEntity> {
  @override
  final int typeId = 0;

  @override
  NoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteEntity(
      details: fields[1] as String,
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
