
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:reno_bar/dino_game.dart';

import 'enemy.dart';

class EnemyManager extends Component with HasGameRef<DinoGame> {

  late Timer timer;
  EnemyManager() : super(){
    timer = Timer(1,
      onTick: _spawnEnemy,
      repeat: true
    );
  }
  Future<void> _spawnEnemy() async {
    Vector2 initialSize = Vector2(64, 64);
    Enemy enemy = Enemy(
        sprite: await Sprite.load('Saw.png'),
    size: initialSize,
    position: Vector2(gameRef.size.x/2, 0),
    )..anchor = Anchor.topCenter;

    gameRef.add(enemy);
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