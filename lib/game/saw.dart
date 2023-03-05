import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:reno_bar/game/bar_center.dart';
import 'package:reno_bar/game/command.dart';
import 'package:reno_bar/game/dino_game.dart';
import '../components/explosion_component.dart';
import './dino_player.dart';

class Saw extends SpriteComponent with HasGameRef<DinoGame>, CollisionCallbacks {
  double _speed = 350;
  int time = 0;
  final bool isBarrel;

  final _random = Random();

  Saw({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    required this.isBarrel,
  }) : super(sprite: sprite, position: position, size: size);

  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2.random(_random)) * 10000;
  }

  // Returns a random direction vector with slight angle to +ve y axis.
  Vector2 getRandomDirection() {
    return (Vector2.random(_random) - Vector2(0.5, -1)).normalized();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 1) * _speed * dt;
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is BarCenter || other is DinoPlayer) {
      removeFromParent();
      time++;
      print(time);
      if (time <= 1) {
        if (!isBarrel) {
          final command = Command<DinoPlayer>(action: (dinoPlayer) {
            dinoPlayer.addToScore(1);
          });
          gameRef.addCommand(command);

          final particleComponent = ParticleSystemComponent(
              particle: Particle.generate(
                  count: 20,
                  lifespan: 0.1,
                  generator: (i) => AcceleratedParticle(
                      acceleration: getRandomVector(),
                      position: position.clone(),
                      child: CircleParticle(
                        radius: 2,
                        paint: Paint()..color = Colors.white,
                      ))));
          gameRef.add(particleComponent);
          print('a');
        } else {
          gameRef.add(ExplosionComponent(
            position.clone()
              ..add(
                Vector2(size.x, gameRef.barCenter.isRemoved ? 0 : 24),
              ),
            angle: -angle,
          ));
          gameRef.camera.shake(intensity: 1, duration: 0.15);
          print('a');

          final command = Command<DinoPlayer>(action: (dinoPlayer) {
            dinoPlayer.removeLife(1);
          });
          gameRef.addCommand(command);
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
