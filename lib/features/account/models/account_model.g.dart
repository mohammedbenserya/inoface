// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final int typeId = 0;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel(
      identifiant: fields[0] as String,
      motdepasse: fields[1] as String,
      tokenmobile: fields[2] as String?,
      codeSchool: fields[3] as String?,
      nameSchool: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.identifiant)
      ..writeByte(1)
      ..write(obj.motdepasse)
      ..writeByte(2)
      ..write(obj.tokenmobile)
      ..writeByte(3)
      ..write(obj.codeSchool)
      ..writeByte(4)
      ..write(obj.nameSchool);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
