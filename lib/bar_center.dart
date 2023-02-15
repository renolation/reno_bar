
import 'package:flame/components.dart';
import 'package:reno_bar/dino_game.dart';

class BarCenter extends SpriteComponent with HasGameRef<DinoGame> {
  BarCenter() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (15).png');
    // position =  Vector2(gameRef.size.x/2, gameRef.size.y/1.5);
    position = Vector2(gameRef.size.x /2, gameRef.size.y * 11 / 15);

  }
}





class BarLeft extends SpriteComponent with HasGameRef<DinoGame> {
  BarLeft() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (1).png');
    position = Vector2(gameRef.size.x - (gameRef.size.x / 10 * 9), gameRef.size.y * 11 / 15);
  }
}

class BarRight extends SpriteComponent with HasGameRef<DinoGame> {
  BarRight() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (1).png');
    position = Vector2((gameRef.size.x / 10 * 9), gameRef.size.y * 11 / 15);
  }
}