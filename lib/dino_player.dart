

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class DinoPlayer extends SpriteComponent with HasGameRef, TapCallbacks {

  DinoPlayer() : super(size: Vector2.all(100));


 @override
  Future<void> onLoad() async {
   super.onLoad();
   sprite = await gameRef.loadSprite('Saw.png');
   position = gameRef.size /3 ;
 }

 // @override
 // void onTapUp(TapUpEvent event){
 //  print('tap up');
 //  print(event);
 // }
 // @override
 // void onTapDown(TapDownEvent event){
 //  print('tap down');
 // }

 // @override
 // void onLongTapDown(TapDownEvent event){
 //  print('long tap down');
 // }


}