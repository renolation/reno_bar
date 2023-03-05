import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'player_data.g.dart';
part 'player_data.freezed.dart';


@freezed

class PlayerData with _$PlayerData  {
  @HiveType(typeId: 0, adapterName: 'PlayerDataAdapter')
  const factory PlayerData({
    @HiveField(0)
    required int score,

    @HiveField(1)
    required int life,

    @HiveField(2)
    required List<int> highScore,


  }) = _PlayerData;

  factory PlayerData.fromJson(Map<String, dynamic> json) =>
      _$PlayerDataFromJson(json);
}