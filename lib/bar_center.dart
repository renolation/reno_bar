
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:reno_bar/dino_game.dart';

import 'enemy.dart';

class BarCenter extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
  BarCenter() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Tile (15).png');
    // position =  Vector2(gameRef.size.x/2, gameRef.size.y/1.5);
    position = Vector2(gameRef.size.x /2, gameRef.size.y * 11 / 15);

  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(1,  parentSize: size,
      position: size / 2,
      anchor: Anchor.center,);
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is Enemy){
      print('touch 2');
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is ScreenHitbox) {
      //...
    }
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