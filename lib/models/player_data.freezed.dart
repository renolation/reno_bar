// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerData _$PlayerDataFromJson(Map<String, dynamic> json) {
  return _PlayerData.fromJson(json);
}

/// @nodoc
mixin _$PlayerData {
  @HiveField(0)
  int get topScore => throw _privateConstructorUsedError;
  @HiveField(1)
  int get life => throw _privateConstructorUsedError;
  @HiveField(2)
  List<int> get highScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerDataCopyWith<PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDataCopyWith<$Res> {
  factory $PlayerDataCopyWith(
          PlayerData value, $Res Function(PlayerData) then) =
      _$PlayerDataCopyWithImpl<$Res, PlayerData>;
  @useResult
  $Res call(
      {@HiveField(0) int topScore,
      @HiveField(1) int life,
      @HiveField(2) List<int> highScore});
}

/// @nodoc
class _$PlayerDataCopyWithImpl<$Res, $Val extends PlayerData>
    implements $PlayerDataCopyWith<$Res> {
  _$PlayerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topScore = null,
    Object? life = null,
    Object? highScore = null,
  }) {
    return _then(_value.copyWith(
      topScore: null == topScore
          ? _value.topScore
          : topScore // ignore: cast_nullable_to_non_nullable
              as int,
      life: null == life
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      highScore: null == highScore
          ? _value.highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerDataCopyWith<$Res>
    implements $PlayerDataCopyWith<$Res> {
  factory _$$_PlayerDataCopyWith(
          _$_PlayerData value, $Res Function(_$_PlayerData) then) =
      __$$_PlayerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int topScore,
      @HiveField(1) int life,
      @HiveField(2) List<int> highScore});
}

/// @nodoc
class __$$_PlayerDataCopyWithImpl<$Res>
    extends _$PlayerDataCopyWithImpl<$Res, _$_PlayerData>
    implements _$$_PlayerDataCopyWith<$Res> {
  __$$_PlayerDataCopyWithImpl(
      _$_PlayerData _value, $Res Function(_$_PlayerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topScore = null,
    Object? life = null,
    Object? highScore = null,
  }) {
    return _then(_$_PlayerData(
      topScore: null == topScore
          ? _value.topScore
          : topScore // ignore: cast_nullable_to_non_nullable
              as int,
      life: null == life
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      highScore: null == highScore
          ? _value._highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'PlayerDataAdapter')
class _$_PlayerData implements _PlayerData {
  const _$_PlayerData(
      {@HiveField(0) required this.topScore,
      @HiveField(1) required this.life,
      @HiveField(2) required final List<int> highScore})
      : _highScore = highScore;

  factory _$_PlayerData.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerDataFromJson(json);

  @override
  @HiveField(0)
  final int topScore;
  @override
  @HiveField(1)
  final int life;
  final List<int> _highScore;
  @override
  @HiveField(2)
  List<int> get highScore {
    if (_highScore is EqualUnmodifiableListView) return _highScore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highScore);
  }

  @override
  String toString() {
    return 'PlayerData(topScore: $topScore, life: $life, highScore: $highScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerData &&
            (identical(other.topScore, topScore) ||
                other.topScore == topScore) &&
            (identical(other.life, life) || other.life == life) &&
            const DeepCollectionEquality()
                .equals(other._highScore, _highScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topScore, life,
      const DeepCollectionEquality().hash(_highScore));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      __$$_PlayerDataCopyWithImpl<_$_PlayerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerDataToJson(
      this,
    );
  }
}

abstract class _PlayerData implements PlayerData {
  const factory _PlayerData(
      {@HiveField(0) required final int topScore,
      @HiveField(1) required final int life,
      @HiveField(2) required final List<int> highScore}) = _$_PlayerData;

  factory _PlayerData.fromJson(Map<String, dynamic> json) =
      _$_PlayerData.fromJson;

  @override
  @HiveField(0)
  int get topScore;
  @override
  @HiveField(1)
  int get life;
  @override
  @HiveField(2)
  List<int> get highScore;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}
