

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:reno_bar/game/bar_center.dart';

import 'dino_game.dart';


class DinoPlayer extends SpriteComponent with HasGameRef<DinoGame>, Tappable {

  DinoPlayer() : super(anchor: Anchor.bottomCenter);
   int _score = 0;
  int get score => _score;
   int _health = 10;
  int get health => _health;
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

  void addToScore(int point){
    _score += point;
  }

  void removeHealth(int point){
   _health -= point;
  }

  void reset() {
   _score = 0;
   _health = 10;
  }

}