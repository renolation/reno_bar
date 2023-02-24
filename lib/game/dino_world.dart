
import 'package:flame/components.dart';

class DinoWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('background.jpg');
    size = gameRef.size;
    print('size world ${size.x} ${size.y}');
  }
}