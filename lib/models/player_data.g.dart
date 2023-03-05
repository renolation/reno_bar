// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDataAdapter extends TypeAdapter<_$_PlayerData> {
  @override
  final int typeId = 0;

  @override
  _$_PlayerData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PlayerData(
      score: fields[0] as int,
      life: fields[1] as int,
      highScore: (fields[2] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PlayerData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.life)
      ..writeByte(2)
      ..write(obj.highScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerData _$$_PlayerDataFromJson(Map<String, dynamic> json) =>
    _$_PlayerData(
      score: json['score'] as int,
      life: json['life'] as int,
      highScore:
          (json['highScore'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_PlayerDataToJson(_$_PlayerData instance) =>
    <String, dynamic>{
      'score': instance.score,
      'life': instance.life,
      'highScore': instance.highScore,
    };
