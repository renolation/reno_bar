

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:reno_bar/bar_center.dart';

import 'dino_game.dart';

class DinoPlayer extends SpriteComponent with HasGameRef<DinoGame>, Tappable {

  DinoPlayer() : super(anchor: Anchor.bottomCenter);

 @override
  Future<void> onLoad() async {
   super.onLoad();
   sprite = await gameRef.loadSprite('Barrel (1).png');
   size = sprite!.originalSize/2;
   position = Vector2(gameRef.size.x/2, gameRef.size.y * 14 / 15);

 }

 @override
 bool onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
   info.handled = true;
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    info.handled = true;
    return true;
  }


}