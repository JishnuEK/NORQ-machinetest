// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 2;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      userEmail: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.userEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
