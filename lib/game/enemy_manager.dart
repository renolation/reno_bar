import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:reno_bar/game/dino_game.dart';

import './saw.dart';

class EnemyManager extends Component with HasGameRef<DinoGame> {
  late Timer timer;

  Random random = Random();
  EnemyManager() : super() {
    timer = Timer(1, onTick: _spawnEnemy, repeat: true);
  }

  Future<void> _spawnEnemy() async {
    Vector2 initialSize = Vector2(64, 64);
    Vector2 center = Vector2(gameRef.size.x / 2, 0);
    Vector2 left = Vector2(gameRef.size.x - (gameRef.size.x * 0.8), 0);
    Vector2 right = Vector2(gameRef.size.x - (gameRef.size.x * 0.2), 0);
    int rand = random.nextInt(2);
    int randomSprite = random.nextInt(5);
    Sprite? sprite;
    bool? isBarrel;
    // Sprite? sprite =  ? await Sprite.load('Saw.png') :  await Sprite.load('Barrel (2).png');
    if (randomSprite != 0) {
      sprite = await Sprite.load('egg.png');
      isBarrel = false;
    } else {
      sprite = await Sprite.load('egg-bomb.png');
      isBarrel= true;
    }
    if (rand != 0) {
      Saw enemy = Saw(
        sprite: sprite,
        size: initialSize,
        position: center,
          isBarrel: isBarrel,
      )..anchor = Anchor.center;

      gameRef.add(enemy);
    } else {
      Saw enemyLeft = Saw(
        sprite: sprite,
        size: initialSize,
        position: left,
        isBarrel: isBarrel,
      )..anchor = Anchor.center;

      gameRef.add(enemyLeft);
      Saw enemyRight = Saw(
        sprite: sprite,
        size: initialSize,
        position: right,
        isBarrel: isBarrel,
      )..anchor = Anchor.center;
      gameRef.add(enemyRight);
    }
  }

  @override
  void onMount() {
    super.onMount();
    timer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
  }

  void reset(){
    timer.stop();
    timer.start();
  }
}
