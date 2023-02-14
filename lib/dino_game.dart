import 'dart:ui';

import 'package:flame/game.dart';
import 'package:reno_bar/dino_player.dart';
import 'package:reno_bar/dino_world.dart';

class DinoGame extends FlameGame {
  DinoPlayer _dinoPlayer = DinoPlayer();
  DinoWorld _dinoWorld = DinoWorld();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_dinoWorld);
    await add(_dinoPlayer);
    _dinoPlayer.position = Vector2(_dinoWorld.size.x / 2.5, _dinoWorld.size.y/1.3);
    camera.followComponent(
      _dinoPlayer,
      worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y),
    );
  }
}
