
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:reno_bar/dino_game.dart';

import 'enemy.dart';

class EnemyManager extends Component with HasGameRef<DinoGame> {

  late Timer timer;

  Random random = Random();
  EnemyManager() : super(){
    timer = Timer(1,
      onTick: _spawnEnemy,
      repeat: true
    );
  }

  Future<void> _spawnEnemy() async {
    Vector2 initialSize = Vector2(64, 64);

    Vector2 center =  Vector2(gameRef.size.x/2, 0);
    Vector2 left =  Vector2(gameRef.size.x -(gameRef.size.x *0.8) , 0);
    Vector2 right =  Vector2(gameRef.size.x -(gameRef.size.x * 0.2) , 0);
    int rand = random.nextInt(5);
    print(rand);
    int randomSprite = random.nextInt(5);
    Sprite? sprite = randomSprite != 0 ? await Sprite.load('Saw.png') :  await Sprite.load('Barrel (2).png');

    if(rand != 0){
      Enemy enemy = Enemy(
        sprite: sprite,
        size: initialSize,
        position: center,
      )..anchor = Anchor.center;
      gameRef.add(enemy);
    } else {
      Enemy enemyLeft = Enemy(
        sprite: sprite,
        size: initialSize,
        position: left,
      )..anchor = Anchor.center;

      gameRef.add(enemyLeft);
      Enemy enemyRight = Enemy(
        sprite: sprite,
        size: initialSize,
        position: right,
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
}