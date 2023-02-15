
import 'package:flame/components.dart';

class BarCenter extends SpriteComponent with HasGameRef {
  BarCenter() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (15).png');
    position =  Vector2(gameRef.size.x/2, gameRef.size.y/1.5);
  }
}

class BarLeft extends SpriteComponent with HasGameRef {
  BarLeft() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (1).png');
    position =  Vector2(gameRef.size.x/3.5, gameRef.size.y/2.5);
  }
}

class BarRight extends SpriteComponent with HasGameRef {
  BarRight() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (3).png');
    position =  Vector2(gameRef.size.x/1.5, gameRef.size.y/2.5);
  }
}