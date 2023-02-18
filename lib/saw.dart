

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:reno_bar/bar_center.dart';
import 'package:reno_bar/dino_game.dart';

class Saw extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
  double _speed = 350;

  final bool isBarrel;
  Saw( {
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    required this.isBarrel,
  }) : super(sprite: sprite, position: position, size: size);

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 1) * _speed * dt;
    if(position.y > gameRef.size.y){
      removeFromParent();
    }
  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(0.8,  parentSize: size,
      position: size / 2,
      anchor: Anchor.center,);
    add(shape);
  }


  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is BarCenter){
      removeFromParent();
      print('touch 22');
    }
  }



  @override
  void onRemove() {
    super.onRemove();
    print('removed');
  }
}