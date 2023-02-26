

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
   int _life = 1;
  int get life => _life;
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

  void removeLife(int point){
   _life -= point;
   if(_life < 0){
     _life = 0;
   }
  }
  void addLife(int point){
    _life += point;
  }

  void reset() {
   _score = 0;
   _life = 1;
  }

}