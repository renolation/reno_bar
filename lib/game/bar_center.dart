
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:reno_bar/game/dino_game.dart';

import 'command.dart';
import './saw.dart';


class BarCenter extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
  BarCenter(Sprite sprite, Vector2 position) : super(sprite: sprite, position: position ,size: Vector2.all(100), anchor: Anchor.center);


  @override
  Future<void> onLoad() async {
    super.onLoad();
    // sprite = await gameRef.loadSprite('Tile (15).png');
    size = Vector2(150, 50);

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
    if(other is Saw){
      if(other.isBarrel){
        //todo: lose


      } else {
        // gameRef.dinoPlayer.score +=1;
      }
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

// class BarLeft extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
//   BarLeft() : super(size: Vector2.all(100), anchor: Anchor.center);
//
//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//     sprite = await gameRef.loadSprite('Tile (1).png');
//     position = Vector2(gameRef.size.x - (gameRef.size.x / 10 * 9), gameRef.size.y * 11 / 15);
//
//   }
//
//   @override
//   void onMount() {
//     super.onMount();
//     final shape = CircleHitbox.relative(1,  parentSize: size,
//       position: size / 2,
//       anchor: Anchor.center,);
//     add(shape);
//   }
//
//   @override
//   void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollision(intersectionPoints, other);
//     if(other is Saw){
//       if(other.isBarrel){
//         print('lose');
//       } else {
//         print('+1');
//         print('touch 2');
//       }
//     }
//   }
//
//   @override
//   void onCollisionEnd(PositionComponent other) {
//     super.onCollisionEnd(other);
//     if (other is ScreenHitbox) {
//       //...
//     }
//   }
//
//
// }
//
// class BarRight extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
//   BarRight() : super(size: Vector2.all(100), anchor: Anchor.center);
//
//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//     sprite = await gameRef.loadSprite('Tile (1).png');
//     position = Vector2((gameRef.size.x / 10 * 9), gameRef.size.y * 11 / 15);
//
//   }
//
//   @override
//   void onMount() {
//     super.onMount();
//     final shape = CircleHitbox.relative(1,  parentSize: size,
//       position: size / 2,
//       anchor: Anchor.center,);
//     add(shape);
//   }
//
//   @override
//   void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
//     super.onCollision(intersectionPoints, other);
//     if(other is Saw){
//       if(other.isBarrel){
//         print('lose');
//       } else {
//         print('+1');
//         print('touch 2');
//       }
//     }
//   }
//
//   @override
//   void onCollisionEnd(PositionComponent other) {
//     super.onCollisionEnd(other);
//     if (other is ScreenHitbox) {
//       //...
//     }
//   }
//
//
// }

