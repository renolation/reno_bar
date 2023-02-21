

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:reno_bar/bar_center.dart';
import 'package:reno_bar/command.dart';
import 'package:reno_bar/dino_game.dart';
import 'package:reno_bar/dino_player.dart';

import 'components/explosion_component.dart';

class Saw extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
  double _speed = 350;
  int time = 0;
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
    if(other is BarCenter || other is DinoPlayer){
      removeFromParent();
      time++;
      print(time);
      if(time<=1){

        if(!isBarrel){
          final command = Command<DinoPlayer>(action: (dinoPlayer){
            dinoPlayer.addToScore(1);
          });
          gameRef.addCommand(command);
        } else {
          gameRef.add(
              ExplosionComponent(
                position.clone()
                  ..add(
                    Vector2(size.x, 0),
                  ),

                angle: -angle,
              ));
          final command = Command<DinoPlayer>(action: (dinoPlayer){
            dinoPlayer.removeHealth(10);
          });
          gameRef.addCommand(command);
          gameRef.camera.shake(intensity: 1, duration: 0.15);
          print('game over');
        }

      }
    }
  }



  @override
  void onRemove() {
    super.onRemove();
    print('removed');
  }
}