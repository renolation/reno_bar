

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:reno_bar/bar_center.dart';

import 'dino_game.dart';

class DinoPlayer extends SpriteComponent with HasGameRef<DinoGame>, Tappable {

  DinoPlayer() : super(size: Vector2.all(100));

 @override
  Future<void> onLoad() async {
   super.onLoad();
   sprite = await gameRef.loadSprite('Barrel (1).png');
   // position = gameRef.size /3 ;
   // position = Vector2(0, 0);
 }

 @override
 bool onTapDown(TapDownInfo info) {
    // TODO: implement onTapDown
    // print('dino');
    // print(info.eventPosition.viewport);
    // print(info.eventPosition.game);
    // print(info.eventPosition.global);
    // print(info.eventPosition.widget);
    // print(info.handled);
   info.handled = true;
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    info.handled = true;
    return true;
  }


 // @override
 // void onLongTapDown(TapDownEvent event){
 //  print('long tap down');
 // }


}