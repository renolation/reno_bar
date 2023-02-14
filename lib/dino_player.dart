


import 'package:flame/components.dart';

class DinoPlayer extends SpriteComponent with HasGameRef {

  DinoPlayer() : super(size: Vector2.all(100));

 @override
  Future<void> onLoad() async {
   super.onLoad();
   sprite = await gameRef.loadSprite('assets/Saw.png');
   position = gameRef.size /2 ;
 }
}